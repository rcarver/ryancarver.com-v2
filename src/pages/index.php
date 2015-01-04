<?php include "_variables.php" ?>
<?php include "_media_queries.php" ?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Ryan Carver Photography</title>

    <?php include "_assets.php" ?>
  </head>
  <body>
    <?php include "_menu.php" ?>
    <?php include "_header.php" ?>
    
    <div class="rc-container">
      <div class="rc-featured-image">
        <a href="<?= $baseurl ?>/discovery-bay.html">
          <img    src="<?= $baseurl ?>/img/gallery/md/discovery-bay/gallery-1.jpg"
               srcset="<?= $baseurl ?>/img/gallery/lg/discovery-bay/gallery-1.jpg 1280w, 
                       <?= $baseurl ?>/img/gallery/md/discovery-bay/gallery-1.jpg 1000w, 
                       <?= $baseurl ?>/img/gallery/sm/discovery-bay/gallery-1.jpg 800w, 
                       <?= $baseurl ?>/img/gallery/xs/discovery-bay/gallery-1.jpg 480w"
                sizes="<?= $home_sizes_header ?>"
                class="img-responsive"/>
          <span class="rc-feat">Featured work</span> 
          <span class="rc-name">Discovery Bay, CA</span>
        </a>
      </div>
    </div>

    <div class="rc-container rc-index-thumbs">
      <div class="row">
        <div class="col-xs-4">
          <a href="<?= $baseurl ?>/sun-sand.html">
            <img src="<?= $baseurl ?>/img/thumb-sun-sand.jpg">
            <span class="rc-title">Sun &amp; Sand</span>
          </a>
        </div>
        <div class="col-xs-4">
          <a href="<?= $baseurl ?>/protected-spaces.html">
            <img src="<?= $baseurl ?>/img/thumb-protected-spaces.jpg">
            <span class="rc-title">Protected Spaces</span>
          </a>
        </div>
        <div class="col-xs-4">
          <a href="<?= $baseurl ?>/portraits.html">
            <img src="<?= $baseurl ?>/img/thumb-portraits.jpg">
            <span class="rc-title">Portraits</span>
          </a>
        </div>
      </div>
      <div class="row">
        <div class="col-xs-4">
          <a href="<?= $baseurl ?>/offscreen-veen.html">
            <img src="<?= $baseurl ?>/img/thumb-offscreen-veen.jpg">
            <span class="rc-title">Offscreen / Jeffrey Veen</span>
          </a>
        </div>
        <div class="col-xs-4">
          <a href="<?= $baseurl ?>/details.html">
            <img src="<?= $baseurl ?>/img/thumb-details.jpg">
            <span class="rc-title">Details</span>
          </a>
        </div>
        <div class="col-xs-4">
          <a href="<?= $baseurl ?>/tokyo.html">
            <img src="<?= $baseurl ?>/img/thumb-tokyo.jpg">
            <span class="rc-title">Tokyo</span>
          </a>
        </div>
      </div>
      <div class="row">
        <div class="col-xs-4">
          <a href="<?= $baseurl ?>/dead-space.html">
            <img src="<?= $baseurl ?>/img/thumb-dead-space.jpg">
            <span class="rc-title">Dead Space</span>
          </a>
        </div>
        <div class="col-xs-4">
          <a href="<?= $baseurl ?>/firecracker.html">
            <img src="<?= $baseurl ?>/img/thumb-firecracker.jpg">
            <span class="rc-title">Firecracker</span>
          </a>
        </div>
      </div>
    </div>

    <?php include "_footer.php" ?>        

    <?php include "_scripts.php" ?> 
  </body>
</html>
