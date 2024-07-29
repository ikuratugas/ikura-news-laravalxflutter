<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Berita</title>
</head>
<body>
  <h1>Ini Halaman Utama</h1>

  <a href="/create">Tambah Berita</a>
  <br>
  <p>Berita terkini</p>
  <br>

  @foreach ($all as $item)
    <a href="{{ route('edit', ['id' => $item->id]) }}">
      <h3>{{ $item->title }}</h3> 
    </a>
     <p>{{ $item->description }}</p>
  @endforeach

</body>
</html>