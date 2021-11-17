<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Brand;

class Figure extends Model
{
    use HasFactory;

    protected $fillable = [
        "title",
        "image",
        "description",
        "price",
        "brand"
    ];

    public function brand() {
        return $this.belongsTo(Brand::class, "brand", "name");
    }
}
