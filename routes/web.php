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
  | It's a breeze. Simply tell avored install module the URI it should respond to
  | and give it the controller to call when that URI is requested.
  |
 */
Route::group(['middleware' => 'web', 'namespace' => "AvoRed\Install\Controllers"], function () {
    Route::get('/install', ['as' => 'avored.install', 'uses' => 'InstallController@index']);

    Route::get('/install/database/table', ['as' => 'avored.install.database.table.get', 'uses' => 'InstallController@databaseTableGet']);
    Route::post('/install/database/table', ['as' => 'avored.install.database.table.post', 'uses' => 'InstallController@databaseTablePost']);

    Route::get('/install/database/data', ['as' => 'avored.install.database.data.get', 'uses' => 'InstallController@databaseDataGet']);
    Route::post('/install/database/data', ['as' => 'avored.install.database.data.post', 'uses' => 'InstallController@databaseDataPost']);

    Route::get('/install/admin', ['as' => 'avored.install.admin', 'uses' => 'InstallController@admin']);
    Route::post('/install/admin', ['as' => 'avored.install.admin.post', 'uses' => 'InstallController@adminPost']);

    Route::get('/install/success', ['as' => 'avored.install.success', 'uses' => 'InstallController@success']);
});
