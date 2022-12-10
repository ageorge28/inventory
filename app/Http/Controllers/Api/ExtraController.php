<?php

namespace App\Http\Controllers\Api;

use App\Models\Extra;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Intervention\Image\Facades\Image;

class ExtraController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $extra = Extra::first();
        return response()->json($extra);
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
     * @param  \App\Models\Extra  $extra
     * @return \Illuminate\Http\Response
     */
    public function show()
    {
        $extra = Extra::first();
        return response($extra);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Extra  $extra
     * @return \Illuminate\Http\Response
     */
    public function edit(Extra $extra)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Extra  $extra
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        $request->validate([
            'vat' => 'required',
            'logo' => 'required',
            'phone' => 'required',
            'email' => 'required|email',
            'address' => 'required'
        ]);

        $extra = Extra::first();

        $logo = $request->newlogo;
        if($logo)
        {
            $position = strpos($logo, ';');
            $sub = substr($logo, 0, $position);
            $ext = explode('/', $sub)[1];
            $name = time() . "." . $ext;
            $img = Image::make($logo)->resize(240,200);
            $upload_path = 'backend/extras/';
            $logo_url = $upload_path . $name;
            $success = $img->save($logo_url);
            if($success)
            {
                if($extra->logo)
                {
                    unlink($extra->logo);
                }
            }
        }
        else
        {
            $logo_url = $extra->logo;
        }

        $favicon = $request->newfavicon;
        if($favicon)
        {
            $position = strpos($favicon, ';');
            $sub = substr($favicon, 0, $position);
            $ext = explode('/', $sub)[1];
            $name = time() . "." . $ext;
            $img = Image::make($favicon)->resize(240,200);
            $upload_path = 'backend/extras/';
            $favicon_url = $upload_path . $name;
            $success = $img->save($favicon_url);
            if($success)
            {
                if($extra->favicon)
                {
                    unlink($extra->favicon);
                }
            }
        }
        else
        {
            $favicon_url = $extra->favicon;
        }

        $extra->update([
            'vat' => $request->vat,
            'logo' => $logo_url,
            'favicon' => $favicon_url,
            'phone' => $request->phone,
            'email' => $request->email,
            'address' => $request->address,            
        ]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Extra  $extra
     * @return \Illuminate\Http\Response
     */
    public function destroy(Extra $extra)
    {
        //
    }

}
