<?php

namespace App\Http\Controllers\Api;

use Carbon\Carbon;
use App\Models\Pos;
use App\Models\Order;
use App\Models\Expense;
use App\Models\Product;
use App\Models\OrderDetail;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class PosController extends Controller
{
    public function categoryProducts($id)
    {
        $products = Product::where('category_id', $id)->get();
        return response()->json($products);
    }

    public function orderDone(Request $request)
    {
        $request->validate([
            'customer_id' => 'required',
            'payby' => 'required',          
        ]);

        $order = Order::create([
            'customer_id' => $request->customer_id,
            'quantity' => $request->quantity,
            'subtotal' => $request->subtotal,
            'vat' => $request->vat,
            'total' => $request->total,
            'pay' => $request->pay,
            'due' => $request->due,
            'payby' => $request->payby,
            'date' => date('Y-m-d'),
            'month' => date('F'),
            'year' => date('Y')            
        ]);

        $order_id = $order->id;

        $poses = Pos::all();

        foreach($poses as $pos)
        {
            OrderDetail::insert([
                'order_id' => $order_id,
                'product_id' => $pos->product_id, 
                'quantity' => $pos->product_quantity,
                'price' => $pos->product_price,
                'subtotal' => $pos->subtotal,
                'created_at' => Carbon::now()
            ]);

            $product = Product::findOrFail($pos->product_id);
            $product->quantity -= $pos->product_quantity;
            $product->save();
            $pos->delete();
        }
       

        return response('Done');
        
    }

    public function todaysSale()
    {
        $date = date('Y-m-d');
        $sale = Order::where('date', $date)->sum('total');
        return response()->json($sale); 
    }

    public function todaysIncome()
    {
        $date = date('Y-m-d');
        $income = Order::where('date', $date)->sum('pay');
        return response()->json($income); 
    }

    public function todaysDue()
    {
        $date = date('Y-m-d');
        $due = Order::where('date', $date)->sum('due');
        return response()->json($due); 
    }

    public function todaysExpense()
    {
        $date = date('Y-m-d');
        $expense = Expense::where('date', $date)->sum('amount');
        return response()->json($expense); 
    }

    public function todaysOutOfStock()
    {
        $products = Product::where('quantity', '<', 1)
                        ->join('categories', 'categories.id', 'products.category_id')
                        ->select('categories.name as category', 'products.*')
                        ->get();
        return response()->json($products); 
    }
}
