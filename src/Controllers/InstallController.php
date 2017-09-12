<?php
/**
 * Mage2
 *
 * NOTICE OF LICENSE
 *
 * This source file is subject to the GNU General Public License v3.0
 * that is bundled with this package in the file LICENSE.txt.
 * It is also available through the world-wide-web at this URL:
 * https://www.gnu.org/licenses/gpl-3.0.en.html
 * If you did not receive a copy of the license and are unable to
 * obtain it through the world-wide-web, please send an email
 * to ind.purvesh@gmail.com so we can send you a copy immediately.
 *
 * DISCLAIMER
 *
 * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
 * versions in the future. If you wish to customize PrestaShop for your
 * needs please refer to http://mage2.website for more information.
 *
 * @author    Purvesh <ind.purvesh@gmail.com>
 * @copyright 2016-2017 Mage2
 * @license   https://www.gnu.org/licenses/gpl-3.0.en.html GNU General Public License v3.0
 */
namespace Mage2\Install\Controllers;

use Exception;

use Illuminate\Support\Facades\Artisan;
use Illuminate\Http\Request;
use Mage2\Framework\Theme\Facades\Theme;
use Mage2\User\Models\AdminUser;
use Mage2\Framework\System\Controllers\Controller;
use Mage2\Install\Requests\AdminUserRequest;
use Mage2\User\Models\Role;
use Mage2\Dashboard\Models\Configuration;
use Mage2\Framework\Theme\ThemeService;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Storage;
use Laravel\Passport\ClientRepository;

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
        'curl'];


    public function __construct(ClientRepository $clientRepository)
    {
        $this->clientRepository = $clientRepository;
    }

    /**
     * Display all needed PHP Extension for the Mage2 E commerce App
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

        return view('mage2-install::install.extension')->with('result', $result);
    }

    public function databaseTableGet()
    {
        return view('mage2-install::install.database-table');
    }

    public function databaseTablePost(Request $request)
    {
        try {
            Artisan::call('migrate:fresh');
        } catch (Exception $e) {

            throw new Exception($e->getMessage());
        }

        return redirect()->route('mage2.install.database.data.get');
    }

    public function databaseDataGet()
    {
        return view('mage2-install::install.database-data');
    }

    public function databaseDataPost(Request $request)
    {
        if ($request->get('install_data') == "yes") {

            $fromPath = __DIR__ . "/../../assets";
            $toPath = public_path();

            try {
                Artisan::call('db:seed', ['--class' => 'Mage2DataSeeder']);
                Theme::publishItem($fromPath, $toPath);

            } catch (Exception $e) {
                throw new Exception($e->getMessage());
            }

        }

        return redirect()->route('mage2.install.admin');
    }

    public function admin()
    {
        return view('mage2-install::install.admin');
    }

    public function adminPost(AdminUserRequest $request)
    {

        $theme = Theme::get('mage2-default');
        $fromPath = $theme['asset_path'];
        $toPath = public_path('vendor/' . $theme['name']);

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
                'configuration_value' => 'mage2-default'
            ]);
            Configuration::create([
                'configuration_key' => 'active_theme_path',
                'configuration_value' => base_path('themes\mage2\default')
            ]);
            Configuration::create([
                'configuration_key' => 'mage2_catalog_no_of_product_category_page',
                'configuration_value' => 9
            ]);
            Configuration::create(
                ['configuration_key' => 'mage2_catalog_cart_page_display_taxamount',
                    'configuration_value' => 'yes'
                ]);
            Configuration::create([
                'configuration_key' => 'mage2_tax_class_percentage_of_tax',
                'configuration_value' => 15
            ]);


        } catch (Exception $e) {
            throw new Exception($e->getMessage());
        }


        return redirect()->route('mage2.install.success');
    }

    public function success()
    {
        Storage::disk('local')->put('installed.txt', '.installed');
        return view('mage2-install::install.success');
    }

}
