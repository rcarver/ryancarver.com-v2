<?php include "_variables.php" ?>
<?php include "_media_queries.php" ?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Ryan Carver Photography | Details</title>
    
    <?php include "_assets.php" ?>
  </head>
  <body>
    <?php include "_menu.php" ?>
    <?php include "_header.php" ?>   
    
    <div class="rc-gallery-header-container">
      <img    src="<?= $baseurl ?>/img/gallery/sm/details/gallery-1.jpg"
           srcset="<?= $baseurl ?>/img/gallery/lg/details/gallery-1.jpg 1280w, 
                   <?= $baseurl ?>/img/gallery/md/details/gallery-1.jpg 1000w, 
                   <?= $baseurl ?>/img/gallery/sm/details/gallery-1.jpg 800w, 
                   <?= $baseurl ?>/img/gallery/xs/details/gallery-1.jpg 480w"
            sizes="<?= $gallery_sizes_header ?>">
      <div class="rc-content">
        <p class="rc-intro">
          <span class="rc-title">Details</span> 
          <span class="rc-subtitle">2013 – 2014</span>
        </p>
        <p class="rc-copy rc-copy-center">
          Studies on abstractions or exposure of everyday objects.
        </p>
      </div>
    </div>

    <div class="rc-gallery-container">
      <div class="row">
        <img    src="<?= $baseurl ?>/img/gallery/sm/details/gallery-2.jpg"
             srcset="<?= $baseurl ?>/img/gallery/lg/details/gallery-2.jpg 1280w, 
                     <?= $baseurl ?>/img/gallery/md/details/gallery-2.jpg 1000w, 
                     <?= $baseurl ?>/img/gallery/sm/details/gallery-2.jpg 800w, 
                     <?= $baseurl ?>/img/gallery/xs/details/gallery-2.jpg 480w"
              sizes="<?= $gallery_sizes_1up ?>"
              class="v">
        <img    src="<?= $baseurl ?>/img/gallery/sm/details/gallery-3.jpg"
             srcset="<?= $baseurl ?>/img/gallery/lg/details/gallery-3.jpg 1280w, 
                     <?= $baseurl ?>/img/gallery/md/details/gallery-3.jpg 1000w, 
                     <?= $baseurl ?>/img/gallery/sm/details/gallery-3.jpg 800w, 
                     <?= $baseurl ?>/img/gallery/xs/details/gallery-3.jpg 480w"
              sizes="<?= $gallery_sizes_1up ?>">
        <img    src="<?= $baseurl ?>/img/gallery/sm/details/gallery-4.jpg"
             srcset="<?= $baseurl ?>/img/gallery/lg/details/gallery-4.jpg 1280w, 
                     <?= $baseurl ?>/img/gallery/md/details/gallery-4.jpg 1000w, 
                     <?= $baseurl ?>/img/gallery/sm/details/gallery-4.jpg 800w, 
                     <?= $baseurl ?>/img/gallery/xs/details/gallery-4.jpg 480w"
              sizes="<?= $gallery_sizes_1up ?>"
              class="v">
        <img    src="<?= $baseurl ?>/img/gallery/sm/details/gallery-5.jpg"
             srcset="<?= $baseurl ?>/img/gallery/lg/details/gallery-5.jpg 1280w, 
                     <?= $baseurl ?>/img/gallery/md/details/gallery-5.jpg 1000w, 
                     <?= $baseurl ?>/img/gallery/sm/details/gallery-5.jpg 800w, 
                     <?= $baseurl ?>/img/gallery/xs/details/gallery-5.jpg 480w"
              sizes="<?= $gallery_sizes_1up ?>">
        <img    src="<?= $baseurl ?>/img/gallery/sm/details/gallery-6.jpg"
             srcset="<?= $baseurl ?>/img/gallery/lg/details/gallery-6.jpg 1280w, 
                     <?= $baseurl ?>/img/gallery/md/details/gallery-6.jpg 1000w, 
                     <?= $baseurl ?>/img/gallery/sm/details/gallery-6.jpg 800w, 
                     <?= $baseurl ?>/img/gallery/xs/details/gallery-6.jpg 480w"
              sizes="<?= $gallery_sizes_1up ?>"
              class="v">
        <img    src="<?= $baseurl ?>/img/gallery/sm/details/gallery-7.jpg"
             srcset="<?= $baseurl ?>/img/gallery/lg/details/gallery-7.jpg 1280w, 
                     <?= $baseurl ?>/img/gallery/md/details/gallery-7.jpg 1000w, 
                     <?= $baseurl ?>/img/gallery/sm/details/gallery-7.jpg 800w, 
                     <?= $baseurl ?>/img/gallery/xs/details/gallery-7.jpg 480w"
              sizes="<?= $gallery_sizes_1up ?>">
      </div>
    </div>

    <?php include "_backtotop.php" ?>
    <?php include "_footer.php" ?> 

    <?php include "_scripts.php" ?> 
  </body>
</html>