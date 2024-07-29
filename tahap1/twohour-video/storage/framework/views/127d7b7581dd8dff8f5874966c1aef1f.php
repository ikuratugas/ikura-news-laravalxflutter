<?php $__env->startSection('content'); ?>
  <h1>Daftar Mahasiswa</h1>
  <table border="1">
    <tr>
      <td>Nama</td>
      <td>Nim</td>
    </tr>
    <?php $__currentLoopData = $mahasiswa; $__env->addLoop($__currentLoopData); foreach($__currentLoopData as $item): $__env->incrementLoopIndices(); $loop = $__env->getLastLoop(); ?>
      <tr>
        <td><?php echo e($item['nama']); ?></td>
        <td><a href="/mahasiswa/<?php echo e($item['id']); ?>">Detail</a></td>
      </tr>
    <?php endforeach; $__env->popLoop(); $loop = $__env->getLastLoop(); ?>
  </table>
<?php $__env->stopSection(); ?>
<?php echo $__env->make('btn.index', \Illuminate\Support\Arr::except(get_defined_vars(), ['__data', '__path']))->render(); ?><?php /**PATH /home/ikura/laravel/twohour-video/resources/views/btn/mahasiswa.blade.php ENDPATH**/ ?>