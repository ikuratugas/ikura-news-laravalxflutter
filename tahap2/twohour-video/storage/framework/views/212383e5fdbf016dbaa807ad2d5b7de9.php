<?php $__env->startSection('content'); ?>
  <h1>ini halaman utama</h1>
  <h4>hai selamat datang <?php echo e($nama); ?></h4>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('btn.index', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/ikura/laravel/twohour-video/resources/views/btn/utama.blade.php ENDPATH**/ ?>