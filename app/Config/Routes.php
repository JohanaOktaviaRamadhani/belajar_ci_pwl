<?php

use CodeIgniter\Router\RouteCollection;

/**
 * @var RouteCollection $routes
 */

$routes->get('/', 'Home::index', ['filter' => 'auth']);

$routes->get('login', 'AuthController::login');
$routes->post('login', 'AuthController::login',  ['filter' => 'Redirect']);
$routes->get('logout', 'AuthController::logout');

$routes->group('produk', ['filter' => 'auth'], function ($routes) { 
    $routes->get('', 'ProdukController::index');
    $routes->post('', 'ProdukController::create');
    $routes->post('edit/(:any)', 'ProdukController::edit/$1');
    $routes->get('delete/(:any)', 'ProdukController::delete/$1');
    $routes->get('download', 'ProdukController::download/');
});

$routes->group('keranjang', ['filter' => 'auth'], function ($routes) {
    $routes->get('', 'TransaksiController::index');
    $routes->post('', 'TransaksiController::cart_add');
    $routes->post('edit', 'TransaksiController::cart_edit');
    $routes->get('delete/(:any)', 'TransaksiController::cart_delete/$1');
    $routes->get('clear', 'TransaksiController::cart_clear');
});

$routes->group('kategori-produk', ['filter' => 'auth'], function ($routes) { 
    $routes->get('', 'ProductCategoryController::index');
    $routes->post('create', 'ProductCategoryController::create');
    $routes->post('update/(:any)', 'ProductCategoryController::update/$1');
    $routes->get('delete/(:any)', 'ProductCategoryController::delete/$1');
});


$routes->get('faq', 'FaqController::index', ['filter' => 'auth']);
$routes->get('profile', 'FaqController::index', ['filter' => 'auth']);
$routes->get('contact', 'FaqController::index', ['filter' => 'auth']);
$routes->resource('api', ['controller' => 'apiController']);


$routes->group('diskon', ['filter' => 'auth'], function($routes) {
    $routes->get('/', 'DiskonController::index');
    $routes->get('create', 'DiskonController::create');
    $routes->post('store', 'DiskonController::store');
    $routes->get('edit/(:num)', 'DiskonController::edit/$1');
    $routes->post('update/(:num)', 'DiskonController::update/$1');
    $routes->get('delete/(:num)', 'DiskonController::delete/$1');
});