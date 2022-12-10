<?php

namespace App\Http\Controllers\Api;

use App\Models\Order;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class OrderController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $orders = Order::join('customers', 'customers.id', 'orders.customer_id')->select('customers.name as customer', 'orders.*')->get();
        return response()->json($orders);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $order = Order::where('orders.id', $id)->join('customers', 'customers.id', 'orders.customer_id')->select('customers.name', 'customers.phone', 'customers.address', 'orders.*')->first();
        return response()->json($order);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function edit(Order $order)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Order $order)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function destroy(Order $order)
    {
        //
    }

    public function today()
    {
        $today = date('Y-m-d');
        $orders = Order::where('date', $today)->join('customers', 'customers.id', 'orders.customer_id')->select('customers.name as customer', 'orders.*')->get();
        return response()->json($orders);
    }

    public function searchByDate(Request $request)
    {
        $date = $request->date;
        $orders = Order::where('date', $date)
                    ->join('customers', 'customers.id', 'orders.customer_id')
                    ->select('customers.name', 'orders.*')
                    ->get();
        return response()->json($orders);
    }
}
