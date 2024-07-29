<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Berita Ikura</title>
</head>
<body>
  <h1>Tambah Berita</h1>

  <form method="post" action="{{ route('store') }}" >
    @method('post')
    @csrf

    <input placeholder="Masukkan Judul Berita" type="text" name="title" id="">
    <br>
    <textarea placeholder="Masukkan Deskripsi Berita" name="description" id="" cols="100" rows="30">
    </textarea>
    <br>

    <input type="submit" value="Posting Berita">
  </form>
</body>
</html>