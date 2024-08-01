<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Berita;
use Illuminate\Support\Facades\Storage;

class BeritaController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
        $all = Berita::latest()->paginate();
        return view('news.index', compact('all'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
        return view('news.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
        $data = $request->validate([
            'title' => 'required',
            'description' => 'required',
            'image' => 'required',
            ]
        );

        $data['image'] = $request->file('image')->store('berita');

        Berita::create($data);
        return redirect(route('index'));
    }

    /**
     * Display the specified resource.
     */
    public function show(Berita $berita)
    {
        //
        
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Berita $id)
    {
        //
        return view('news.edit', compact('id'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Berita $id, Request $request)
    {
        //
        $data = $request->validate([
            'title' => 'required',
            'description' => 'required',
            'image' => 'nullable'
        ]);

        if($request->file('image')){
            if($id->image){
                Storage::delete($id->image);
            }
            $data['image'] = $request->file('image')->store('berita');
        }

        $id->update($data);
        return redirect(route('index'));
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Berita $id){
        // dd($id->id);
        if($id->image){
            Storage::delete($id->image);
        }
        Berita::destroy($id->id);
        return redirect(route('index'));
    }

    // =========== this is for in ANDROID / Flutter =========
    /**
     * to get all the data sending to android
     */
    // public function apiIndex(){
    //     $all = Berita::latest()->get();
    //     return response()->json($all);
    // }
    public function apiIndex(Request $request)
{
    $page = $request->query('page', 1); // Ambil halaman dari parameter query atau default ke 1
    $perPage = 6; // Jumlah berita per halaman

    $berita = Berita::latest()->paginate($perPage, ['*'], 'page', $page);

    return response()->json($berita);
}


    // public function apiIndex(Request $request)
    // {
    //     // Menentukan jumlah item per halaman, misalnya 3
    //     $perPage = 3;
        
    //     // Mendapatkan halaman saat ini dari query parameter
    //     $page = $request->input('page', 1);
        
    //     // Mengambil data berita dengan pagination
    //     $berita = Berita::latest()->paginate($perPage, ['*'], 'page', $page);
    
    //     // Mengembalikan data dalam format JSON
    //     return response()->json($berita);
    // }
    
}