<?php

namespace Database\Seeders;

use Illuminate\Support\Facades\DB;


use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class SocialMediaLinksSeeder extends Seeder
{
    public function run(): void
    {
        DB::table('social_media_links')->insert([
            [
                'platform' => 'linkedIn',
                'link' => 'https://www.linkedin.com/in/ali-elchab/',
                'user_id' => 11
            ],
            [
                'platform' => 'github',
                'link' => 'https://github.com/Ali-Elchab',
                'user_id' => 11
            ],
            [
                'platform' => 'Facebook',
                'link' => 'https://www.facebook.com/AliElchab01/',
                'user_id' => 11
            ],
            [
                'platform' => 'linkedIn',
                'link' => 'https://www.linkedin.com/in/ali-elchab/',
                'user_id' => 2
            ],
            [
                'platform' => 'github',
                'link' => 'https://github.com/Ali-Elchab',
                'user_id' => 2
            ],
            [
                'platform' => 'Facebook',
                'link' => 'https://www.facebook.com/AliElchab01/',
                'user_id' => 2
            ],
            [
                'platform' => 'linkedIn',
                'link' => 'https://www.linkedin.com/in/jobseeker2/',
                'user_id' => 3
            ],
            [
                'platform' => 'github',
                'link' => 'https://www.github.com/jobseeker2/',
                'user_id' => 3
            ],
            [
                'platform' => 'Facebook',
                'link' => 'https://www.facebook.com/jobseeker2/',
                'user_id' => 3
            ],
            [
                'platform' => 'linkedIn',
                'link' => 'https://www.linkedin.com/in/jobseeker2/',
                'user_id' => 4
            ],
            [
                'platform' => 'github',
                'link' => 'https://www.github.com/jobseeker2/',
                'user_id' => 4
            ],
            [
                'platform' => 'Facebook',
                'link' => 'https://www.facebook.com/jobseeker2/',
                'user_id' => 4
            ],


        ]);
    }
}
