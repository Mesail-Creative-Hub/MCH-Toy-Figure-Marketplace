<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class Brand extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $data = [
            [
                "name" => "Marvel",
                "image" =>"http://192.168.100.53:8000/storage/captain-america-logo-54-removebg-preview (1) 1.png",
                "subImage" => "http://192.168.100.53:8000/storage/585f9333cb11b227491c3581 1.png"
            ],
            [
                "name" => "Gundam",
                "image" => "http://192.168.100.53:8000/storage/484-4840109_gundam-head-png-gundam-rx-78-head-transparent-removebg-preview 1.png",
                "subImage" => "http://192.168.100.53:8000/storage/177-1774432_gundam-logo-png-transparent-png-removebg-preview 1.png"
            ],
            [
                "name" => "Transformer",
                "image" => "http://192.168.100.53:8000/storage/png-clipart-autobots-logo-bumblebee-optimus-prime-frenzy-logo-transformers-optimus-angle-symmetry-removebg-preview 1.png",
                "subImage" => "http://192.168.100.53:8000/storage/208-2084689_transformers-movie-logo-png-transparent-png-removebg-preview 1.png"
            ],
        ];

        \App\Models\Brand::insert($data);
    }
}
