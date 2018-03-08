<?php
/**
 * AvoRed E commerce built for Laravel Shopping Cart Solution
 * @author    Purvesh <ind.purvesh@gmail.com>
 * @copyright 2017-2018 AvoRed
 * @license   https://opensource.org/licenses/MIT MIT
 * @link      https://www.avored.com
 */

namespace AvoRed\Install;

use Illuminate\Support\ServiceProvider;
use AvoRed\Install\Middleware\InstallMiddleware;
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
     * Register the middleware for the avored auth modules.
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
        $this->loadViewsFrom(__DIR__ . '/../resources/views', 'avored-install');
    }

}


