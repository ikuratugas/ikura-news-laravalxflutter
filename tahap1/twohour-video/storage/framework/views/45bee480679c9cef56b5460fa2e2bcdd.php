<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Halaman Utama</title>

  <style>
    .konten {
      display: flex;
      flex-direction:row; 
    }
  </style>
</head>
<body>

  <div class="konten">
    <div class="box1">
      <?php echo $__env->make('btn.components.sidebar', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?>
    </div>
    <div class="box2">
      <?php echo $__env->yieldContent('content'); ?>
    </div>
  </div>

</body>
</html><?php /**PATH /home/ikura/laravel/twohour-video/resources/views/btn/index.blade.php ENDPATH**/ ?>