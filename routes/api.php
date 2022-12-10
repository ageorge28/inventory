<?php

use App\Http\Controllers\Api\CartController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\Api\EmployeeController;
use App\Http\Controllers\Api\SupplierController;
use App\Http\Controllers\Api\CategoryController;
use App\Http\Controllers\Api\ProductController;
use App\Http\Controllers\Api\ExpenseController;
use App\Http\Controllers\Api\SalaryController;
use App\Http\Controllers\Api\CustomerController;
use App\Http\Controllers\Api\PosController;
use App\Http\Controllers\Api\ExtraController;
use App\Http\Controllers\Api\OrderController;
use App\Http\Controllers\Api\OrderDetailController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::group(['middleware' => 'api', 'prefix' => 'auth'], function ($router) {

    Route::post('login', 'App\Http\Controllers\AuthController@login');
    Route::post('logout', 'App\Http\Controllers\AuthController@logout');
    Route::post('refresh', 'App\Http\Controllers\AuthController@refresh');
    Route::post('me', 'App\Http\Controllers\AuthController@me');
    Route::post('signup', 'App\Http\Controllers\AuthController@signup');

});

Route::apiResource('/employees', EmployeeController::class);
Route::apiResource('/suppliers', SupplierController::class);
Route::apiResource('/categories', CategoryController::class);
Route::apiResource('/products', ProductController::class);
Route::apiResource('/expenses', ExpenseController::class);

Route::post('/salaries/pay/{id}', [SalaryController::class, 'pay']);
Route::get('/salaries', [SalaryController::class, 'index']);
Route::get('/salaries/view/{id}', [SalaryController::class, 'view']);
Route::put('/salaries/update/{id}', [SalaryController::class, 'update']);
Route::get('/salaries/show/{id}', [SalaryController::class, 'show']);

Route::put('/products/stock/update/{id}', [ProductController::class, 'updateStock']);

Route::apiResource('/customers', CustomerController::class);

Route::get('/products/category/{id}', [PosController::class, 'categoryProducts']);

Route::post('/addToCart/{id}', [CartController::class, 'addToCart']);

Route::get('/cart/products',  [CartController::class, 'cartProducts']);

Route::post('/removeFromCart/{id}', [CartController::class, 'removeFromCart']);

Route::post('/incrementCart/{id}', [CartController::class, 'incrementCart']);

Route::post('/decrementCart/{id}', [CartController::class, 'decrementCart']);

Route::get('/extras', [ExtraController::class, 'index']);
Route::post('/extras/update', [ExtraController::class, 'update']);
Route::get('/extras/show', [ExtraController::class, 'show']);

Route::post('/orderDone', [PosController::class, 'orderDone']);

Route::get('/orders/today', [OrderController::class, 'today']);
Route::get('/orders/show/{id}', [OrderController::class, 'show']);
Route::get('/orders/details/{id}', [OrderDetailController::class, 'index']);
Route::get('/orders', [OrderController::class, 'index']);
Route::post('/orders/search', [OrderController::class, 'searchByDate']);

// Admin Dashboard Routes
Route::get('/todayssale', [PosController::class, 'todaysSale']);
Route::get('/todaysincome', [PosController::class, 'todaysIncome']);
Route::get('/todaysdue', [PosController::class, 'todaysDue']);
Route::get('/todaysexpense', [PosController::class, 'todaysExpense']);
Route::get('/todaysoutofstock', [PosController::class, 'todaysOutOfStock']);