<?php

namespace App\Http\Controllers\Api;

use App\Models\Employee;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Intervention\Image\Facades\Image;

class EmployeeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $employees = Employee::all();
        return response()->json($employees);
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
            'name' => 'required|unique:employees|max:255',
            'email' => 'required|unique:employees|email',
            'phone' => 'required|unique:employees',
        ]);

        if($request->photo)
        {
            $position = strpos($request->photo, ';');
            $sub = substr($request->photo, 0, $position);
            $ext = explode('/', $sub)[1];
            $name = time() . "." . $ext;
            $img = Image::make($request->photo)->resize(240,200);
            $upload_path = 'public/backend/employees/' ;
            if(file_exists($upload_path))
            {
                $image_url = $upload_path . $name;
                $img->save($image_url);
            }

            $employee = new Employee;
            $employee->name = $request->name;
            $employee->email = $request->email;
            $employee->phone = $request->phone;
            $employee->address = $request->address;
            $employee->salary = $request->salary;
            $employee->nid = $request->nid;
            $employee->photo = $image_url;
            $employee->joining_date = $request->joining_date; 
            $employee->save();           
        }
        else
        {
            $employee = new Employee;
            $employee->name = $request->name;
            $employee->email = $request->email;
            $employee->phone = $request->phone;
            $employee->address = $request->address;
            $employee->salary = $request->salary;
            $employee->nid = $request->nid;
            $employee->joining_date = $request->joining_date;
            $employee->save();   
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Employee $employee)
    {
        // $employee = Employee::findOrFail($id);
        return response()->json($employee);
    }


    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $employee = Employee::findOrFail($id);
        $employee->name = $request->name;
        $employee->email = $request->email;
        $employee->phone = $request->phone;
        $employee->salary = $request->salary;
        $employee->nid = $request->nid;
        $employee->address = $request->address;
        $employee->joining_date = $request->joining_date;

        $image = $request->newphoto;
        if($image)
        {
            $position = strpos($image, ';');
            $sub = substr($image, 0, $position);
            $ext = explode('/', $sub)[1];
            $name = time() . "." . $ext;
            $img = Image::make($image)->resize(240,200);
            $upload_path = 'public/backend/employees/' ;
            if(file_exists($upload_path))
            {
                $image_url = $upload_path . $name;
                $success = $img->save($image_url);
            }

            if($success)
            {
                if($employee->photo)
                {
                    unlink($employee->photo);
                }
                $employee->photo = $image_url;    
            }
        }

        $employee->save();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $employee = Employee::findOrFail($id);
        $photo = $employee->photo;
        if($photo)
        {
            unlink($photo);
        }
        $employee->delete();
    }
}
