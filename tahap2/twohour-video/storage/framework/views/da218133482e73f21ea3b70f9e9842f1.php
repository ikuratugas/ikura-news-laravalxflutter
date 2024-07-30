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

  <?php $__currentLoopData = $all; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
    <a href="<?php echo e(route('edit', ['id' => $item->id])); ?>">
      <h3><?php echo e($item->title); ?></h3> 
      <img width="100" height="100" src="<?php echo e(asset('storage/' . $item->image)); ?>" class="card-img-top" alt="<?php echo e($item->image); ?>">
    </a>
     <p><?php echo e($item->description); ?></p>
  <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>

</body>
</html><?php /**PATH /home/ikura/laravel/twohour-video/resources/views/news/main.blade.php ENDPATH**/ ?>