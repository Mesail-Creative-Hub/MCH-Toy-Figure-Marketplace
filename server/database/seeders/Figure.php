<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class Figure extends Seeder
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
                "title" => "Mainan Figure Bumblebee The Movie Transformers Toys/Mainan",
                "image" => "http://192.168.100.53:8000/storage/026419c7-fb1a-4758-8dca-4f28f593d40a.png",
                "description" => "Action Figure BUMBLEBEE The Movie - Tinggi 21 cm - Bahan Plastik ABS & metal alloy - Detail & kualitas halus - Artikulasi - Bisa berubah menjadi mobil/ - Mendapat manual book cara merubah menjadi mobil/ - Merk Wei Jiang - Paking Dus Exclusive - Cocok utk koleksi/pajangan/hiasan/mainan/kado ultah #promo #murah # #pastimurah #pastipromo #hargapromo #figur #fgure #actionfigure SKU : 3131/1070184956928114688/55",
                "price" => "Rp. 1.366.900",
                "brand_id" => 3
            ],
            [
                "title" => "Promo Mainan Robot Megatron Boy Transformer 5 Deformation Buatan T",
                "image" => "http://192.168.100.53:8000/storage/33c35fe9-e2e1-4a90-b632-fab5cbf19c6d.png",
                "description" => "Mainan Robot Megatron Boy Transformer 5 Deformation Buatan Tangan Deformation
                Sebelum Mohon Chat/Noted Untuk Warna dan Type Yang Tersedia **
                ** Semua Order Barang Express-PO (Personal Preorder) - Anda Order Langsung di Proses Hari itu Juga **
                ** Pengiriman Super Cepat 7- 10 hari**
                ** Packing Aman dan Secure Sampai Alamat **
                Megatron boy children Transformer 5 toy aircraft enlarged movie robot model hand-made TyrannosaurusOrigin: Mainland ChinaApplicable age group: over 14 years oldToy Type: plastic toy",
                "price" => "Rp. 1.051.000",
                "brand_id" => 3
            ],
            [
                "title" => "Transformers - BMB LS03F Optimus Prime Black Mamba God of War Ver.",
                "image" => "http://192.168.100.53:8000/storage/32ddbf7f-a1dc-4cdf-bfbe-2a516fbd7500.png",
                "description" => "Model : Transformers - BMB LS03F Optimus Prime Black Mamba God of War Ver.
                Harga : 1.400.000
                Material : PVC & Diecast
                Detail & Cat : High Quality
                Tinggi : 32 cm
                Ketersediaan Stok : Terbatas ( Grab it Fast )
                Packing : Free Bubblewrap + Kardus Pelapis
                
                #actionfigure #actionfigureanime #anime #figureanime #actionfiguremurah #figurejepang #figureanimemurah #figureoriginal #actionfigureoriginal",
                "price" => "Rp. 1.400.000",
                "brand_id" => 3
            ],
            [
                "title" => "Bandai Freedom Gundam34;Gundam Seed34; - Metal Build",
                "image" => "http://192.168.100.53:8000/storage/25696ac8-34e3-4de5-8167-53517dbe50d5.png",
                "description" => "From the Manufacturer The birth of the Metal Build series, which began with 00 Gundam Seven Sword in March 2011 was nothing less than a game changer for highend robot action figures. A year after the initial release, Metal Build will continue with the Freedom Gundam from the Gundam SEED series. Employing diecast, capable of awesome action poses, and exhibiting superior articulation and breathtaking detail; this represents the pinnacle of robot action figure precision and technology and what will have been a yearlong endeavor of one of the greatest design teams ever assembled overseen by Gundam SEED animator Satoshi Shigeta, and finetuned by sculptor Yoichi Sakamoto. Figure set will include interchangeable hand parts, shield, beam rifle, special display stand, and special booklet.",
                "price" => "Rp. 11.022.000",
                "brand_id" => 2
            ], 
            [
                "title" => "00 Gundam Seven Sword/G 00V Battlefield Record Action Figure",
                "image" => "http://192.168.100.53:8000/storage/009426df-8f21-4021-9c24-0854a71869aa.png",
                "description" => "The Gundam Metal Build series is a line of action figures from Bandai that come with extreme detail and articulation plus diecast metal parts. Building on technology cultivated in the Gundam Fix Figuration Metal Composite series, Bandai put its experience into creating the Metal Build line. Six years after the first METAL BUILD series release, we enlisted the help of designer Kanetaka Ebikawa to help us realize this OO Gundam Seven Sword/G. Incredibly detailed and posable, the 180mm diecast and plastic figure includes 4 optional pairs of hands, 2 GN Beam Sabers, 2 beam swords, a long GN Sword II, a short GN Sword II, a joint grip, a wire, a GN Buster Sword II, 2 GN Katars, GN Sword II Blaster, L/R shoulder joints, optional GN Drive, 2 GN Sword IIs, 2 optional knee parts, display stand set, and weapon stand set.",
                "price" => "Rp. 11.728.000",
                "brand_id" => 2
            ]
        ];

        \App\Models\Figure::insert($data);
    }
}
