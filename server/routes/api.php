<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\FigureController;
use App\Http\Controllers\BrandController;

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

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });

// MySQL
Route::prefix('v1')->group(function () {
    Route::get('figures/{figure}', [FigureController::class, "show"]);
    Route::get('figures', [FigureController::class, "index"]);
    Route::get('brands', [BrandController::class, "index"]);
});

// MongoDB
// Route::resource('figures', FigureControllerMongoDB::class);
