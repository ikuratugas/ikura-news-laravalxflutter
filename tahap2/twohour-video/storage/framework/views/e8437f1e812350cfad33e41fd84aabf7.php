<?php $__env->startSection('content'); ?>
    <h1>ini detail Mahasiswanya</h1>
    <h3>Nama : <?php echo e($mhs["nama"]); ?></h3>
    <h3>Nama : <?php echo e($mhs["nim"]); ?></h3>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('btn.index', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/ikura/laravel/twohour-video/resources/views/btn/mahasiswadetail.blade.php ENDPATH**/ ?>