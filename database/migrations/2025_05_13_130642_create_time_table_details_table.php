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
        Schema::create('time_table_details', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained()->onDelete('cascade');
            $table->foreignId('time_table_id')->constrained('time_tables')->onDelete('cascade');
            $table->string('day');
            $table->unsignedInteger('period_index'); 
            $table->string('subject');
            $table->string('teacher');
            $table->unique(['time_table_id', 'day', 'period_index']); 
            $table->softDeletes();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('time_table_details');
    }
};
