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

    // DetailSchedule
    $router->post('detail-schedule', 'DetailScheduleController@store');
    $router->get('detail-schedule', 'DetailScheduleController@getDetailSchedule');
    $router->get('detail-schedule/{id}', 'DetailScheduleController@showDetailSchedule');
    $router->put('detail-schedule/{id}', 'DetailScheduleController@update');
    $router->delete('detail-schedule/{id}', 'DetailScheduleController@destroy');

    // User
    $router->get('user', 'UserController@getUser');
    $router->get('user/{id}', 'UserController@showUser');
    $router->put('user/{id}', 'UserController@update');
    $router->delete('user/{id}', 'UserController@destroy');

    // Login Register
    $router->post('/register', 'UserController@register');
    $router->post('/login', 'UserController@login');

    // Pomodoro
    $router->get('pomodoro/{id}', 'PomodoroController@getPomodoro');
    $router->post('pomodoro', 'PomodoroController@store');
    $router->put('pomodoro/{id}', 'PomodoroController@update');

    // Pomodoro Activity
    $router->post('pomodoro-activity', 'PomodoroActivityController@store');
    $router->get('pomodoro-activity/{id}', 'PomodoroActivityController@getPomodoroActivity');
    $router->put('pomodoro-activity/{id}', 'PomodoroActivityController@update');
    $router->delete('pomodoro-activity/{id}', 'PomodoroActivityController@destroy');
});