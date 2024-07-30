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

  <form action="{{ route('destroy', ['id' => $id->id] ) }}" method="post" enctype="multipart/form-data">
      @method('delete')
      @csrf
      <button type="submit">Hapus Berita ini</button>
  </form>
  <br>
  <br>

  <form method="post" action="{{ route('update', ['id' => $id]) }}" enctype="multipart/form-data">
    @method('put')
    @csrf
    <br>
    <label for="imagePreview">Pilih Gambar</label>
    <img id="imagePreview" width="100" height="100" src="{{ asset('storage/' . $id->image) }}" class="img-preview" alt="Image Preview">
    <input type="file" name="image" id="image">
    <br>
    <input placeholder="Masukkan Judul Berita" value="{{ $id->title }}" type="text" name="title" id="">
    <br>
    <textarea placeholder="Masukkan Deskripsi Berita" name="description" id="" cols="100" rows="30">{{ $id->description}}</textarea>
    <br>
    <input type="submit" value="Edit Berita">
  </form>
</body>
<script>
  document.getElementById('image').addEventListener('change', function(event) {
    const file = event.target.files[0];
    if (file) {
      const reader = new FileReader();
      reader.onload = function(e) {
        document.getElementById('imagePreview').src = e.target.result;
      };
      reader.readAsDataURL(file);
    }
  });
</script>
</html>