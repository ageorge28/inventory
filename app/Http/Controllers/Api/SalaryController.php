<?php

namespace App\Http\Controllers\Api;

use App\Models\Salary;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;

class SalaryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $salaries = DB::table('salaries')->select('month')->groupBy('month')->get();
        return response()->json($salaries);
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
     * @param  \App\Models\Salary  $salary
     * @return \Illuminate\Http\Response
     */
    public function view($id)
    {
        $salaries = Salary::join('employees', 'employees.id', '=', 'salaries.employee_id')->select('employees.name', 'salaries.*')->where('salaries.month', $id)->get();
        return response()->json($salaries);
    }

    public function show($id)
    {
        $salary = Salary::join('employees', 'employees.id', '=', 'salaries.employee_id')->select('employees.name', 'employees.email', 'salaries.*')->where('salaries.id', $id)->first();
        return response()->json($salary);
    }


    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Salary  $salary
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $salary = Salary::findOrFail($id);
        $check = Salary::where('employee_id', $salary->employee_id)->where('month', $salary->month)->first();
        // if($check)
        // {
        //     return response()->json('Salary already paid');
        // }
        // else 
        // {
            $check->update([
                // 'employee_id' => $request->employee_id,
                'amount' => $request->amount,
                'month' => $request->month
            ]);
        // }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Salary  $salary
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

    public function pay(Request $request, $id)
    {
        $validateData = $request->validate([
            'month' => 'required'
        ]);

        $month = $request->month;

        $check = Salary::where('employee_id', $id)->where('month', $month)->first();
        if($check)
        {
            return response()->json('Salary already paid');
        }
        else 
        {
            Salary::insert([
                'employee_id' => $id,
                'amount' => $request->salary,
                'date' => date('d/m/Y'),
                'month' => $month, 
                'year' => date('Y')
            ]);    
        }
    }
}
