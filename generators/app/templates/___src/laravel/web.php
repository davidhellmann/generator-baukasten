<?php

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

Route::get('/', function () {
    $jsonBase = Storage::get('data/base.json');
    $jsonWelcome = Storage::get('data/welcome.json');

    $jsonBase = json_decode($jsonBase, true);
    $jsonWelcome = json_decode($jsonWelcome, true);

    $jsonMerged = array_merge($jsonBase, $jsonWelcome);

    return view('welcome', $jsonMerged);
});

Route::get('/{id}', function ($id) {
    $jsonBase = Storage::get('data/base.json');
    $jsonId = Storage::get('data/' . $id . '.json');

    $jsonBase = json_decode($jsonBase, true);
    $jsonId = json_decode($jsonId, true);

    $jsonMerged = array_merge($jsonBase, $jsonId);

    return view($id, $jsonMerged);
});
