<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Pos;
use App\Models\Product;

class CartController extends Controller
{
    public function addToCart(Request $request, $id)
    {
        $product = Product::findOrFail($id);

        $check = Pos::where('product_id', $id)->first();

        if($check)
        {
            if($product->quantity > 0)
            {
                $check->product_quantity ++;
                $check->subtotal = $check->product_price * $check->product_quantity;
                $check->save();   
                return response()->json([
                    'quantity' => $product->quantity
                ]);    
            }
            else
            {
                return response()->json([
                    'quantity' => $product->quantity
                ]);        
            }
        }
        else
        {
            if($product->quantity > 0)
            {
                $pos = new Pos;      
                $pos->product_id = $id;
                $pos->product_name = $product->name;
                $pos->product_quantity = 1;
                $pos->product_price = $product->selling_price;
                $pos->subtotal = $product->selling_price;
                $pos->save();
                return response()->json([
                    'quantity' => $product->quantity
                ]);    
            }
            return response()->json([
                'quantity' => $product->quantity
            ]);            
        }
    }

    public function cartProducts()
    {
        $carts = Pos::all();
        return response()->json($carts);
    }

    public function removeFromCart($id)
    {
        $pos = Pos::findOrFail($id);
        $pos->delete();
        return response('Removed from cart');
    }

    public function incrementCart($id)
    {
        $pos = Pos::findOrFail($id);
        $pos->product_quantity ++ ;
        $pos->subtotal = $pos->product_price * $pos->product_quantity;
        $pos->save();
        return response('Incremented');
    }

    public function decrementCart($id)
    {
        $pos = Pos::findOrFail($id);
        $pos->product_quantity -- ;
        $pos->subtotal = $pos->product_price * $pos->product_quantity;
        $pos->save();
        return response('Decremented');
    }
}
