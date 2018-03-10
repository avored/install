<?php
/**
 * AvoRed E commerce built for Laravel Shopping Cart Solution
 *
 * @author    Purvesh <ind.purvesh@gmail.com>
 * @copyright 2017-2018 AvoRed
 * @license   https://opensource.org/licenses/MIT MIT
 * @link      https://www.avored.com
 */


/*
  |--------------------------------------------------------------------------
  | AvoRed Install Module Routes
  |--------------------------------------------------------------------------
  |
  | Here is where you can register all of the routes for an avored install modules.
  | Simply tell avored install module the URI it should respond to
  | and give it the controller to call when that URI is requested.
  |
 */

Route::middleware('web')
        ->namespace('AvoRed\Install\Controllers')
        ->prefix('install')
        ->group(function (){

            Route::get('','InstallController@index')->name('install.index');

            Route::get('db','InstallController@databaseEnvGet')
                        ->name('avored.db');
            Route::post('db','InstallController@databaseEnvPost')
                        ->name('avored.db.post');

            Route::get('db/table','InstallController@databaseTableGet')
                        ->name('avored.install.database.table.get');
            Route::post('db/table','InstallController@databaseTablePost')
                        ->name('avored.install.database.table.post');

            Route::get('db/data','InstallController@databaseDataGet')
                ->name('avored.install.database.data.get');
            Route::post('db/data','InstallController@databaseDataPost')
                ->name('avored.install.database.data.post');

            Route::get('admin','InstallController@admin')
                ->name('avored.install.admin');
            Route::post('admin','InstallController@adminPost')
                ->name('avored.install.admin.post');

            Route::get('success','InstallController@success')
                ->name('avored.install.success');


        });
