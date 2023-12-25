<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\YugiohController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\NewsController;
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
Route::get('/',[YugiohController::class,'index'])->name('home');

// Route để hiển thị danh sách thẻ từ 
Route::get('/cardinfo', [YugiohController::class, 'index_card'])->name('cardinfo');
Route::post('/cardinfo/toggle-favorite', [YugiohController::class, 'toggleFavorite'])->name('toggle.favorite');
Route::post('/cardinfo/increment-views/{id}', [YugiohController::class, 'incrementViewsCard'])->name('incrementViews');
Route::post('/cardinfo/increment-views-news/{id}', [YugiohController::class, 'incrementViewsNews'])->name('incrementViewsNews');
//Route hiển thị cardset
Route::get('/cardsets', [YugiohController::class, 'showAllCardSets'])->name('cardset');
Route::get('/cardsets/{setCode}', [YugiohController::class, 'showCardSetDetail'])->name('cardset.show');

//Route hiểN thị các catalog thẻ của người dùng
Route::get('/catalog', [YugiohController::class, 'showOwnedItems'])->name('catalog.index');
// Route để hiển thị danh sách tin tức
Route::get('/news', [NewsController::class, 'index'])->name('news.index');

// Route để hiển thị chi tiết tin tức
Route::get('/news/{id}', [NewsController::class, 'show'])->name('news.show');
Route::get('/contact', [NewsController::class, 'contact'])->name('news.contact');
Route::get('/news/category/{category}', [NewsController::class, 'category'])->name('news.category');

//Route check quyền truy cập của người dùng
Route::middleware(['checkUserRole'])->group(function () {
    Route::get('/admin', [AdminController::class, 'admin_index'])->name('admin');
    // news manager
    Route::get('/admin/news', [AdminController::class, 'database'])->name('database');
    Route::get('/admin/news/create', [AdminController::class, 'createForm'])->name('news.create');
    Route::post('/admin/news/create', [AdminController::class, 'create'])->name('news.store');
    Route::get('/admin/news/{id}/edit', [AdminController::class, 'editForm'])->name('news.edit');
    Route::put('/admin/news/{id}/edit', [AdminController::class, 'editnews'])->name('news.update');
    Route::post('/admin/news/{id}/delete', [AdminController::class, 'delete'])->name('news.delete');
    // user manager
    Route::get('/admin/users', [AdminController::class, 'index'])->name('users.index');
    Route::get('/admin/users/{id}/edit', [AdminController::class, 'edituser'])->name('users.edit');
    Route::put('/admin/users/{id}/update', [AdminController::class, 'update'])->name('users.update');
    Route::delete('/admin/users/{id}/delete', [AdminController::class, 'destroy'])->name('users.destroy');
    // card manager
    Route::get('/admin/cards', [AdminController::class, 'index_card'])->name('cards.index');
    Route::get('/admin/cards/create', [AdminController::class, 'create_card'])->name('cards.create');
    Route::post('/admin/cards/store', [AdminController::class, 'store_card'])->name('cards.store');
    Route::get('/admin/cards/{id}/edit', [AdminController::class, 'edit_card'])->name('cards.edit');
    Route::put('/admin/cards/{id}', [AdminController::class, 'update_card'])->name('cards.update');
    Route::delete('/admin/cards/{id}/delete', [AdminController::class, 'destroy_card'])->name('cards.destroy');
});

//Route đăng nhập,đăng ký
Route::get('/login', [AuthController::class, 'showLoginForm'])->name('login');
Route::post('/login', [AuthController::class, 'login']);
Route::get('/register', [AuthController::class, 'showRegistrationForm'])->name('register');
Route::post('/register', [AuthController::class, 'register']);
Route::post('/logout', [AuthController::class, 'logout'])->name('logout');

// Routes for password reset
Route::get('/forgot-password', [AuthController::class, 'showForgotPasswordForm'])->name('password.request');
Route::post('/forgot-password', [AuthController::class, 'checkEmail'])->name('password.email');
Route::get('/reset-password/{userId}', [AuthController::class, 'showResetPasswordForm'])->name('password.reset');
Route::post('/reset-password/{userId}/reset', [AuthController::class, 'resetPassword'])->name('password.update');