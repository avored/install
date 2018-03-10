<?php
/**
 * AvoRed E commerce built for Laravel Shopping Cart Solution
 *
 * @author    Purvesh <ind.purvesh@gmail.com>
 * @copyright 2017-2018 AvoRed
 * @license   https://opensource.org/licenses/MIT MIT
 * @link      https://www.avored.com
 */

namespace AvoRed\Install\Controllers;

use Exception;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Http\Request;
use AvoRed\Framework\Theme\Facade as Theme;
use AvoRed\Ecommerce\Models\Database\AdminUser;
use Illuminate\Routing\Controller;
use AvoRed\Install\Requests\AdminUserRequest;
use AvoRed\Ecommerce\Models\Database\Role;
use AvoRed\Ecommerce\Models\Database\Configuration;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Storage;
use Laravel\Passport\ClientRepository;
use Illuminate\Support\Facades\App;

class InstallController extends Controller
{

    protected $service;


    /**
     * Laravel Passport Client Repository
     *
     * @var \Laravel\Passport\ClientRepository
     */
    protected $clientRepository;


    public $extensions = [
        'openssl',
        'pdo',
        'mbstring',
        'tokenizer',
        'gd',
        'xml',
        'ctype',
        'json',
        'curl'];


    public function __construct(ClientRepository $clientRepository)
    {
        $this->clientRepository = $clientRepository;
    }

    /**
     * Display all needed PHP Extension for the AvoRed E commerce App
     *
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        Session::forget('install-module');

        $result = [];
        foreach ($this->extensions as $ext) {
            if (extension_loaded($ext)) {
                $result [$ext] = 'true';
            } else {
                $result [$ext] = false;
            }
        }

        return view('avored-install::install.extension')->with('result', $result);
    }

    public function databaseEnvGet()
    {
        return view('avored-install::install.database-env');
    }


    public function databaseEnvPost(Request $request)
    {


        $envReplacekeys = ['db_database','db_username','db_password'];
        $envFilePath = App::environmentFilePath();


        foreach ($envReplacekeys as $formKey) {

            $envKey = strtoupper($formKey);

            $envCurrentValue = env($envKey);

            $dbFormValue = $request->get($formKey);
            file_put_contents(
                $envFilePath,
                preg_replace("/^{$envKey}={$envCurrentValue}/m",
                "{$envKey}=".$dbFormValue,
                file_get_contents($envFilePath))
            );

        }

        return view('avored-install::install.database-table');
    }


    public function databaseTableGet()
    {
        return view('avored-install::install.database-table');
    }

    public function databaseTablePost(Request $request)
    {

        $downloadFile  = false;


        try {

            if(1 == $request->get('selected_db_option')) {
                //dd('here');
                Artisan::call('migrate:fresh');
            }
            if(2 == $request->get('selected_db_option')) {
                $downloadFile = true;
                $pathToFile = __DIR__ . DIRECTORY_SEPARATOR . ".." . DIRECTORY_SEPARATOR . ".." . DIRECTORY_SEPARATOR .  "sql" . DIRECTORY_SEPARATOR . "avored-ecommerce-table.sql";
            }
            if(3 == $request->get('selected_db_option')) {
                $downloadFile = true;

                $pathToFile = __DIR__ . DIRECTORY_SEPARATOR . ".." . DIRECTORY_SEPARATOR . ".." . DIRECTORY_SEPARATOR .  "sql" . DIRECTORY_SEPARATOR . "avored-ecommerce-sample-data.sql";
            }

        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }



        if(true === $downloadFile) {
            return response()->download($pathToFile);
        } else {
            return redirect()->route('avored.install.database.data.get');
        }

    }

    public function databaseDataGet()
    {
        return view('avored-install::install.database-data');
    }

    public function databaseDataPost(Request $request)
    {
        if ($request->get('install_data') == "yes") {

            $fromPath = __DIR__ . "/../../assets";
            $toPath = public_path();

            try {

                Artisan::call('db:seed', ['--class' => 'AvoRedDataSeeder']);
                Theme::publishItem($fromPath, $toPath);

            } catch (Exception $e) {
                throw new Exception($e->getMessage());
            }

        }

        return redirect()->route('avored.install.admin');
    }

    public function admin()
    {
        return view('avored-install::install.admin');
    }

    public function adminPost(AdminUserRequest $request)
    {

        $theme = Theme::get('avored-default');
        $fromPath = $theme['asset_path'];
        $toPath = public_path('vendor/' . $theme['identifier']);

        Theme::publishItem($fromPath, $toPath);

        try {


            $role = Role::create(['name' => 'administrator', 'description' => 'Administrator Role has all access']);

            $adminUser = AdminUser::create([
                'first_name' => $request->get('first_name'),
                'last_name' => $request->get('last_name'),
                'email' => $request->get('email'),
                'password' => bcrypt($request->get('password')),
                'is_super_admin' => 1,
                'role_id' => $role->id,
            ]);


            Artisan::call('passport:install');

            $this->clientRepository->createPasswordGrantClient($adminUser->id, $adminUser->full_name, $request->getUriForPath('/'));

            Configuration::create([
                'configuration_key' => 'active_theme_identifier',
                'configuration_value' => 'avored-default'
            ]);
            Configuration::create([
                'configuration_key' => 'active_theme_path',
                'configuration_value' => base_path('themes\avored\default')
            ]);
            Configuration::create([
                'configuration_key' => 'avored_catalog_no_of_product_category_page',
                'configuration_value' => 9
            ]);
            Configuration::create(
                ['configuration_key' => 'avored_catalog_cart_page_display_taxamount',
                    'configuration_value' => 'yes'
                ]);
            Configuration::create([
                'configuration_key' => 'avored_tax_class_percentage_of_tax',
                'configuration_value' => 15
            ]);


        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }


        return redirect()->route('avored.install.success');
    }

    public function success()
    {
        Storage::disk('local')->put('installed.txt', '.installed');
        return view('avored-install::install.success');
    }

}
