<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('users')->insert([
            [
                'email' => 'admin@example.com',
                'password' => Hash::make('password'),
                'user_type_id' => 1 // Assuming 1 is the ID for 'Job Seeker'
            ],

            [
                'email' => 'jobseeker@example.com',
                'password' => Hash::make('password'),
                'user_type_id' => 1 // Assuming 1 is the ID for 'Job Seeker'
            ],
            [
                'email' => 'jobseeker2@example.com',
                'password' => Hash::make('password'),
                'user_type_id' => 1 // Assuming 1 is the ID for 'Job Seeker'
            ],
            [
                'email' => 'employer@example.com',
                'password' => Hash::make('password'),
                'user_type_id' => 2 // Assuming 2 is the ID for 'Employer'
            ],
            [
                'email' => 'employer2@example.com',
                'password' => Hash::make('password'),
                'user_type_id' => 2 // Assuming 2 is the ID for 'Employer'
            ],

        ]);
    }
}
