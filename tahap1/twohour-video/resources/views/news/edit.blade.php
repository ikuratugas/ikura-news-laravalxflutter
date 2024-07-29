<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Berita Ikura</title>
</head>
<body>
  <h1>Edit Berita</h1>

  <form action="{{ route('destroy', ['id' => $id->id] ) }}" method="post">
      @method('delete')
      @csrf
      <button type="submit">Hapus Berita ini</button>
  </form>
  <br>
  <br>

  <form method="post" action="{{ route('update', ['id' => $id]) }}" >
    @method('put')
    @csrf
    <input placeholder="Masukkan Judul Berita" value="{{ $id->title }}" type="text" name="title" id="">
    <br>
    <textarea placeholder="Masukkan Deskripsi Berita" name="description" id="" cols="100" rows="30">{{ $id->description}}</textarea>
    <br>
    <input type="submit" value="Edit Berita">
  </form>
</body>
</html>