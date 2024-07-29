<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Rumah Kuning Laravel</title>
</head>
<body>
  <h1>ini halaman detail</h1>
  <?php $__currentLoopData = $mahasiswa; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
    <h3>
      <a href="mahasiswa/<?php echo e($item["nim"]); ?>">
        <?php echo e($item["nama"]); ?>

      </a>
    </h3>
    <h4>
      <a href="mahasiswa/<?php echo e($item["nim"]); ?>">
        <?php echo e($item["nim"]); ?>

    </a>
</h4>
  <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
</body>
</html><?php /**PATH /home/ikura/laravel/twohour-video/resources/views/rumahkuning/home.blade.php ENDPATH**/ ?>