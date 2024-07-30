<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Berita Ikura</title>
  <style>
    .preview {
        margin-top: 20px;
    }
    .preview img {
        max-width: 300px;
        max-height: 300px;
    }
</style>
</head>
<body>
  <h1>Tambah Berita</h1>

  <form method="post" action="{{ route('store') }}" enctype="multipart/form-data">
    @method('post')
    @csrf

    <div class="form-group">
      <label for="image">Choose Image</label>
      <input type="file" name="image" id="image" class="form-control" required onchange="previewImage(event)">
  </div>
  <div class="preview">
      <img id="imagePreview" src="#" alt="Image Preview" style="display: none;">
  </div>
    <input placeholder="Masukkan Judul Berita" value="{{ old('name') }}" type="text" name="title" id="">
    <br>
    <textarea placeholder="Masukkan Deskripsi Berita" name="description" id="" cols="100" rows="30">{{ old('description') }}</textarea>
    <br>
    <input type="submit" value="Posting Berita">
  </form>
</body>
   <!-- Add JavaScript to handle image preview -->
   <script>
    function previewImage(event) {
        var reader = new FileReader();
        reader.onload = function(){
            var output = document.getElementById('imagePreview');
            output.src = reader.result;
            output.style.display = 'block';
        };
        reader.readAsDataURL(event.target.files[0]);
    }
  </script>
</html>