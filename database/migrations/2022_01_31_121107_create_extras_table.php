<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateExtrasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        if(!Schema::hasTable('extras')){
        Schema::create('extras', function (Blueprint $table) {
            $table->id();
            $table->decimal('vat', 8, 2)->nullable(0);
            $table->string('logo');
            $table->string('favicon')->nullable();
            $table->string('phone');
            $table->string('email');
            $table->string('address');           
            $table->timestamps();
        });
    }
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('extras');
    }
}
