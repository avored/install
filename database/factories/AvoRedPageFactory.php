<?php
use Faker\Generator as Faker;

/*
|--------------------------------------------------------------------------
| Model Factories
|--------------------------------------------------------------------------
|
| This directory should contain each of the model factory definitions for
| your application. Factories provide a convenient way to generate new
| model instances for testing / seeding your application's database.
|
*/


$factory->define(\AvoRed\Ecommerce\Models\Database\Page::class, function (Faker $faker) {

    $name = $faker->name;
    $slug = str_slug($name);
    $content = $faker->realText(5000);
    $metaTitle = $faker->title;
    $metaDescription = $faker->title;

    return [
        'name' => $name,
        'slug' => $slug,
        'content' => $content,
        'meta_title' => $metaTitle,
        'meta_description' => $metaDescription
    ];
});