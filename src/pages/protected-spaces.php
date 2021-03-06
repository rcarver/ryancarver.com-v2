<?php include "_variables.php" ?>
<?php include "_media_queries.php" ?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Ryan Carver Photography | Protected Spaces</title>

    <?php include "_assets.php" ?>
  </head>
  <body>
    <?php include "_menu.php" ?>
    <?php include "_header.php" ?>   
    
    <div class="rc-gallery-header-container">
      <img    src="<?= $baseurl ?>/img/gallery/sm/protected-spaces/gallery-1.jpg"
           srcset="<?= $baseurl ?>/img/gallery/lg/protected-spaces/gallery-1.jpg 1280w, 
                   <?= $baseurl ?>/img/gallery/md/protected-spaces/gallery-1.jpg 1000w, 
                   <?= $baseurl ?>/img/gallery/sm/protected-spaces/gallery-1.jpg 800w, 
                   <?= $baseurl ?>/img/gallery/xs/protected-spaces/gallery-1.jpg 480w"
            sizes="<?= $gallery_sizes_header ?>">
      <div class="rc-content">
        <p class="rc-intro">
          <span class="rc-title">Protected Spaces</span> 
          <span class="rc-subtitle">2013 – 2014</span>
        </p>
        <p class="rc-copy">
          I’m drawn to places that are obscurred by physical or social space. It speaks to my fear of approaching even places
          that are inviting. By focusing on this, I hope to recognize that difference outside of the camera.
        </p>
      </div>
    </div>

    <div class="rc-gallery-container">
      <div class="row">    
        <img    src="<?= $baseurl ?>/img/gallery/sm/protected-spaces/gallery-2.jpg"
             srcset="<?= $baseurl ?>/img/gallery/lg/protected-spaces/gallery-2.jpg 1280w, 
                     <?= $baseurl ?>/img/gallery/md/protected-spaces/gallery-2.jpg 1000w, 
                     <?= $baseurl ?>/img/gallery/sm/protected-spaces/gallery-2.jpg 800w, 
                     <?= $baseurl ?>/img/gallery/xs/protected-spaces/gallery-2.jpg 480w"
              sizes="<?= $gallery_sizes_1up ?>">
        <img    src="<?= $baseurl ?>/img/gallery/sm/protected-spaces/gallery-3.jpg"
             srcset="<?= $baseurl ?>/img/gallery/lg/protected-spaces/gallery-3.jpg 1280w, 
                     <?= $baseurl ?>/img/gallery/md/protected-spaces/gallery-3.jpg 1000w, 
                     <?= $baseurl ?>/img/gallery/sm/protected-spaces/gallery-3.jpg 800w, 
                     <?= $baseurl ?>/img/gallery/xs/protected-spaces/gallery-3.jpg 480w"
              sizes="<?= $gallery_sizes_1up ?>"
              class="v">
        <img    src="<?= $baseurl ?>/img/gallery/sm/protected-spaces/gallery-4.jpg"
             srcset="<?= $baseurl ?>/img/gallery/lg/protected-spaces/gallery-4.jpg 1280w, 
                     <?= $baseurl ?>/img/gallery/md/protected-spaces/gallery-4.jpg 1000w, 
                     <?= $baseurl ?>/img/gallery/sm/protected-spaces/gallery-4.jpg 800w, 
                     <?= $baseurl ?>/img/gallery/xs/protected-spaces/gallery-4.jpg 480w"
              sizes="<?= $gallery_sizes_1up ?>"
              class="v">
        <img    src="<?= $baseurl ?>/img/gallery/sm/protected-spaces/gallery-6.jpg"
             srcset="<?= $baseurl ?>/img/gallery/lg/protected-spaces/gallery-6.jpg 1280w, 
                     <?= $baseurl ?>/img/gallery/md/protected-spaces/gallery-6.jpg 1000w, 
                     <?= $baseurl ?>/img/gallery/sm/protected-spaces/gallery-6.jpg 800w, 
                     <?= $baseurl ?>/img/gallery/xs/protected-spaces/gallery-6.jpg 480w"
              sizes="<?= $gallery_sizes_1up ?>">
        <img    src="<?= $baseurl ?>/img/gallery/sm/protected-spaces/gallery-7.jpg"
             srcset="<?= $baseurl ?>/img/gallery/lg/protected-spaces/gallery-7.jpg 1280w, 
                     <?= $baseurl ?>/img/gallery/md/protected-spaces/gallery-7.jpg 1000w, 
                     <?= $baseurl ?>/img/gallery/sm/protected-spaces/gallery-7.jpg 800w, 
                     <?= $baseurl ?>/img/gallery/xs/protected-spaces/gallery-7.jpg 480w"
              sizes="<?= $gallery_sizes_1up ?>"
              class="v">
        <img    src="<?= $baseurl ?>/img/gallery/sm/protected-spaces/gallery-8.jpg"
             srcset="<?= $baseurl ?>/img/gallery/lg/protected-spaces/gallery-8.jpg 1280w, 
                     <?= $baseurl ?>/img/gallery/md/protected-spaces/gallery-8.jpg 1000w, 
                     <?= $baseurl ?>/img/gallery/sm/protected-spaces/gallery-8.jpg 800w, 
                     <?= $baseurl ?>/img/gallery/xs/protected-spaces/gallery-8.jpg 480w"
              sizes="<?= $gallery_sizes_1up ?>"
              class="v">
        <img    src="<?= $baseurl ?>/img/gallery/sm/protected-spaces/gallery-9.jpg"
             srcset="<?= $baseurl ?>/img/gallery/lg/protected-spaces/gallery-9.jpg 1280w, 
                     <?= $baseurl ?>/img/gallery/md/protected-spaces/gallery-9.jpg 1000w, 
                     <?= $baseurl ?>/img/gallery/sm/protected-spaces/gallery-9.jpg 800w, 
                     <?= $baseurl ?>/img/gallery/xs/protected-spaces/gallery-9.jpg 480w"
              sizes="<?= $gallery_sizes_1up ?>">
        <img    src="<?= $baseurl ?>/img/gallery/sm/protected-spaces/gallery-10.jpg"
             srcset="<?= $baseurl ?>/img/gallery/lg/protected-spaces/gallery-10.jpg 1280w, 
                     <?= $baseurl ?>/img/gallery/md/protected-spaces/gallery-10.jpg 1000w, 
                     <?= $baseurl ?>/img/gallery/sm/protected-spaces/gallery-10.jpg 800w, 
                     <?= $baseurl ?>/img/gallery/xs/protected-spaces/gallery-10.jpg 480w"
              sizes="<?= $gallery_sizes_1up ?>"
              class="v">
      </div>
    </div>

    <?php include "_backtotop.php" ?>
    <?php include "_footer.php" ?> 

    <?php include "_scripts.php" ?> 
  </body>
</html>