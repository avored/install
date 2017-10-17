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
namespace Mage2\Install;

use Illuminate\Support\ServiceProvider;
use Mage2\Install\Middleware\InstallMiddleware;
use Illuminate\Database\Eloquent\Factory as EloquentFactory;

class Module extends ServiceProvider
{


    /**
     * Indicates if loading of the provider is deferred.
     *
     * @var bool
     */
    ///protected $defer = true;
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        $this->registerMiddleware();
        $this->registerViewPath();
        $dbFactory = $this->app[EloquentFactory::class];
        $path = __DIR__ . "/../database/factories";
        $dbFactory->load($path);

    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        $this->mapWebRoutes();
    }

    /**
     * Register the middleware for the mage2 auth modules.
     *
     * @return void
     */
    public function registerMiddleware()
    {
        $router = $this->app['router'];
        $router->aliasMiddleware('install', InstallMiddleware::class);
    }


    /**
     * Define the "web" routes for the application.
     *
     * These routes all receive session state, CSRF protection, etc.
     *
     * @return void
     */
    protected function mapWebRoutes()
    {
        $this->loadRoutesFrom(__DIR__ . '/../routes/web.php');
    }

    protected function registerViewPath()
    {
        $this->loadViewsFrom(__DIR__ . '/../resources/views', 'mage2-install');
    }

}


