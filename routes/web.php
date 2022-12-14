<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ViewController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/', function () {
//     return view('welcome');
// });

// Auth::routes();

//Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

Route::get('/{vue_capture?}',function () {
    return view('welcome');
})->where('vue_capture', '[\/\w\.-]*');

Route::any('/{any}', 'App\Http\Controllers\ViewController@app')->where('any','^(?!api).*$');
