<?php

namespace App\Http\Controllers\Api;

use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Intervention\Image\Facades\Image;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $products = DB::table('products')
                        ->join('categories', 'products.category_id', 'categories.id')
                        ->join('suppliers', 'products.supplier_id', 'suppliers.id')
                        ->select('categories.name as category_name', 'suppliers.name as supplier_name', 'products.*')
                        ->orderBy('products.id', 'DESC')
                        ->get();

        return response()->json($products);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validateData = $request->validate([
            'name' => 'required|max:255',
            'code' => 'required|unique:products,code|max:255',
            'category_id' => 'required',
            'supplier_id' => 'required',
            'buying_price' => 'required',
            'selling_price' => 'required',
            'buying_date' => 'required',
            'quantity' => 'required',
        ]);

        $product = new Product;
        $product->name = $request->name;
        $product->code = $request->code;
        $product->category_id = $request->category_id;
        $product->supplier_id = $request->supplier_id;
        $product->root = $request->root;
        $product->buying_price = $request->buying_price;
        $product->selling_price = $request->selling_price;
        $product->buying_date = $request->buying_date;
        $product->quantity = $request->quantity;
        $product->root = $request->root;

        if($request->image)
        {
            $position = strpos($request->image, ';');
            $sub = substr($request->image, 0, $position);
            $ext = explode('/', $sub)[1];
            $name = time() . "." . $ext;
            $img = Image::make($request->image)->resize(240,200);

            $upload_path = 'public/backend/products/' ;
            if(file_exists($upload_path))
            {
                $image_url = $upload_path . $name;
                $img->save($image_url);
            }
            
            $product->image = $image_url; 
        }

        $product->save();         
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function show(Product $product)
    {
        return response()->json($product);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function edit(Product $product)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Product $product)
    {
        $product->name = $request->name;
        $product->code = $request->code;
        $product->category_id = $request->category_id;
        $product->supplier_id = $request->supplier_id;
        $product->root = $request->root;
        $product->buying_price = $request->buying_price;
        $product->selling_price = $request->selling_price;
        $product->buying_date = $request->buying_date;
        $product->quantity = $request->quantity;
        $product->root = $request->root;

        $image = $request->newimage;
        if($image)
        {
            $position = strpos($image, ';');
            $sub = substr($image, 0, $position);
            $ext = explode('/', $sub)[1];
            $name = time() . "." . $ext;
            $img = Image::make($image)->resize(240,200);

            $upload_path = 'public/backend/products/' ;
            if(file_exists($upload_path))
            {
                $image_url = $upload_path . $name;
                $success = $img->save($image_url);
            }

            if($success)
            {
                unlink($product->image);
                $product->image = $image_url;    
            }
        }

        $product->save();
    }

    public function updateStock(Request $request, $id)
    {
        $product = Product::findOrFail($id);
        $product->update([
            'quantity' => $request->quantity
        ]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function destroy(Product $product)
    {
        $image = $product->image;
        if($image)
        {
            unlink($image);
        }
        $product->delete();
    }
}
