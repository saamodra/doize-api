<?php

/** @var \Laravel\Lumen\Routing\Router $router */

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$router->get('/', function () use ($router) {
    return $router->app->version();
});

$router->group(['prefix' => 'api'], function () use ($router) {
    // DailyActivity
    $router->post('daily-activity', 'DailyActivityController@store');
    $router->get('daily-activity', 'DailyActivityController@getDailyActivity');
    $router->get('daily-activity/{id}', 'DailyActivityController@showDailyActivity');
    $router->put('daily-activity/{id}', 'DailyActivityController@update');
    $router->delete('daily-activity/{id}', 'DailyActivityController@destroy');

    // Assignment
    $router->post('assignment', 'AssignmentController@store');
    $router->get('assignment', 'AssignmentController@getAssignment');
    $router->get('assignment/{id}', 'AssignmentController@showAssignment');
    $router->put('assignment/{id}', 'AssignmentController@update');
    $router->delete('assignment/{id}', 'AssignmentController@destroy');

    // Schedule
    $router->post('schedule', 'ScheduleController@store');
    $router->get('schedule', 'ScheduleController@getSchedule');
    $router->get('schedule/{id}', 'ScheduleController@showSchedule');
    $router->put('schedule/{id}', 'ScheduleController@update');
    $router->delete('schedule/{id}', 'ScheduleController@destroy');
});