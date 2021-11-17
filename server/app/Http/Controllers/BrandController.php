<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Brand;

class BrandController extends Controller
{
    public function index() {
        $data = Brand::all();
        return response()->json($data, 200);
    }
}
