<?php

namespace App\Http\Controllers;

use App\Http\Requests\UpdateBeritaRequest;
use App\Models\Berita;
use Illuminate\Http\Request;

class BeritaController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
        $all = Berita::latest()->paginate();
        return view('news.main', compact('all'));
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
            'description' => 'required'
            ]
        );
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
        ]);

        $id->update($data);
        return redirect(route('index'));
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Berita $id){
        // dd($id->id);
        Berita::destroy($id->id);
        return redirect(route('index'));
    }


    // =========== this is for in ANDROID / Flutter =========
    /**
     * to get all the data sending to android
     */
    public function apiIndex(){
        $all = Berita::latest()->get();
        return response()->json($all);
    }
}