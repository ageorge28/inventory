<?php

namespace App\Http\Controllers\Api;

use App\Models\Supplier;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Intervention\Image\Facades\Image;

class SupplierController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $suppliers = Supplier::all();   
        return response()->json($suppliers);
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
            'name' => 'required|unique:suppliers|max:255',
            'email' => 'required|unique:suppliers|email',
            'phone' => 'required|unique:suppliers',
        ]);

        $supplier = new Supplier;
        $supplier->name = $request->name;
        $supplier->email = $request->email;
        $supplier->phone = $request->phone;
        $supplier->address = $request->address;
        $supplier->shopname = $request->shopname;

        if($request->photo)
        {
            $position = strpos($request->photo, ';');
            $sub = substr($request->photo, 0, $position);
            $ext = explode('/', $sub)[1];
            $name = time() . "." . $ext;
            $img = Image::make($request->photo)->resize(240,200);

            $upload_path = 'public/backend/suppliers/' ;
            if(file_exists($upload_path))
            {
                $image_url = $upload_path . $name;
                $img->save($image_url);
            }

            $supplier->photo = $image_url; 
        }

        $supplier->save();           
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Supplier $supplier)
    {
        // $supplier = Supplier::findOrFail($id);
        return response()->json($supplier);
    }


    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Supplier $supplier)
    {
        $supplier->name = $request->name;
        $supplier->email = $request->email;
        $supplier->phone = $request->phone;
        $supplier->address = $request->address;
        $supplier->shopname = $request->shopname;

        $image = $request->newphoto;
        if($image)
        {
            $position = strpos($image, ';');
            $sub = substr($image, 0, $position);
            $ext = explode('/', $sub)[1];
            $name = time() . "." . $ext;
            $img = Image::make($image)->resize(240,200);

            $upload_path = 'public/backend/suppliers/' ;
            if(file_exists($upload_path))
            {
                $image_url = $upload_path . $name;
                $success = $img->save($image_url);
            }

            if($success)
            {
                unlink($supplier->photo);
                $supplier->photo = $image_url;    
            }
        }

        $supplier->save();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $supplier = Supplier::findOrFail($id);
        $photo = $supplier->photo;
        if($photo)
        {
            unlink($photo);
        }
        $supplier->delete();
    }
}
