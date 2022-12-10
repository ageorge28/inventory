<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        if(!Schema::hasTable('pos')){
        Schema::create('pos', function (Blueprint $table) {
            $table->id();
            $table->unsignedInteger('product_id');
            $table->string('product_name')->nullable();
            $table->unsignedInteger('product_quantity')->nullable();
            $table->decimal('product_price', 8, 2)->nullable();
            $table->decimal('subtotal', 8, 2)->nullable();
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
        Schema::dropIfExists('pos');
    }
}
