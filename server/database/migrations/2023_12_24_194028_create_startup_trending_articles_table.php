<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('startup_trending_articles', function (Blueprint $table) {
            $table->id();
            $table->string('article_name');
            $table->string('link');
            $table->string('image_url');
            $table->string('description');
            $table->timestamps();
            $table->foreignId('startup_id')->constrained()->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('startup_trending_articles');
    }
};