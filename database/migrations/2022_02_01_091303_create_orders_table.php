<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('orders', function (Blueprint $table) {
            $table->id();
            $table->unsignedInteger('customer_id');
            $table->unsignedInteger('quantity')->nullable();
            $table->decimal('subtotal', 8, 2)->nullable();
            $table->decimal('vat', 5, 2)->nullable();
            $table->decimal('total', 8, 2)->nullable();
            $table->decimal('pay', 8, 2)->nullable();
            $table->decimal('due', 8, 2)->nullable();
            $table->string('payby')->nullable();
            $table->date('date')->nullable();
            $table->string('month')->nullable();
            $table->string('year')->nullable();
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
        Schema::dropIfExists('orders');
    }
}
