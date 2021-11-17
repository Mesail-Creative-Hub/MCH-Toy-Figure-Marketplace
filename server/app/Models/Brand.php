<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Figure;

class Brand extends Model
{
    use HasFactory;

    protected $fillable = [
        "name",
        "image",
        "subImage",
    ];

    public function figures() {
        return $this.hasMany(Figure, "brand", "name");
    }
}
