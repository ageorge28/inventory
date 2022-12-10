<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->unsignedInteger('category_id');
            $table->string('name');
            $table->string('code')->nullable();
            $table->string('root')->nullable();
            $table->float('buying_price', 8, 2);
            $table->float('selling_price', 8, 2);
            $table->unsignedInteger('supplier_id')->nullable();
            $table->date('buying_date');
            $table->string('image')->nullable();
            $table->boolean('status')->default(1);
            $table->unsignedInteger('quantity');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('products');
    }
}
