<?php

namespace Database\Seeders;

use App\Models\Advisor;
use App\Models\Application;
use App\Models\Certification;
use App\Models\Education;
use App\Models\Experience;
use App\Models\Startup;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        $this->call([
            UserTypeSeeder::class,
            AdvisorsTableSeeder::class,
            UsersTableSeeder::class,
            SocialMediaLinksSeeder::class,
            IndustriesTableSeeder::class,
            SpecializationsTableSeeder::class,
            SkillsTableSeeder::class,
            HobbiesTableSeeder::class,
            StartupsTableSeeder::class,
            JobSeekersTableSeeder::class,
            JobPostsTableSeeder::class,
            JobSeekerHasSkillsTableSeeder::class,
            JobSeekerHasHobbiesTableSeeder::class,
            JobPostRequiredSkillsTableSeeder::class,
            ApplicationsTableSeeder::class,
            CertificationsTableSeeder::class,
            EducationTableSeeder::class,
            ExperiencesTableSeeder::class,

        ]);
    }
}
