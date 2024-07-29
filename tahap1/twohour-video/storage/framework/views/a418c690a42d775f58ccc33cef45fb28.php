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

  <form action="<?php echo e(route('destroy', ['id' => $id->id] )); ?>" method="post">
      <?php echo method_field('delete'); ?>
      <?php echo csrf_field(); ?>
      <button type="submit">Hapus Berita ini</button>
  </form>
  <br>
  <br>

  <form method="post" action="<?php echo e(route('update', ['id' => $id])); ?>" >
    <?php echo method_field('put'); ?>
    <?php echo csrf_field(); ?>
    <input placeholder="Masukkan Judul Berita" value="<?php echo e($id->title); ?>" type="text" name="title" id="">
    <br>
    <textarea placeholder="Masukkan Deskripsi Berita" name="description" id="" cols="100" rows="30"><?php echo e($id->description); ?></textarea>
    <br>
    <input type="submit" value="Edit Berita">
  </form>
</body>
</html><?php /**PATH /home/ikura/laravel/twohour-video/resources/views/news/edit.blade.php ENDPATH**/ ?>