<?php include "_variables.php" ?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Ryan Carver Photography | About</title>

    <?php include "_assets.php" ?>
  </head>
  <body>
    <?php include "_menu.php" ?>
    <?php include "_header.php" ?>   
    
    <div class="rc-about-masthead">
      <picture>
        <source srcset="<?= $baseurl ?>/img/about-xs.jpg,
                        <?= $baseurl ?>/img/about-xs@2x.jpg"
                 media="(max-width: 479px)">
        <source srcset="<?= $baseurl ?>/img/about-sm.jpg,
                        <?= $baseurl ?>/img/about-sm@2x.jpg 2x"
                 media="(max-width: 767px)">
        <source srcset="<?= $baseurl ?>/img/about-md.jpg,
                        <?= $baseurl ?>/img/about-md@2x.jpg 2x"
                 media="(max-width: 991px)">
        <source srcset="<?= $baseurl ?>/img/about-lg.jpg    1440w,
                        <?= $baseurl ?>/img/about-lg@2x.jpg 2880w">
        <img srcset="<?= $baseurl ?>/img/about-sm.jpg">
      </picture>
    </div>

    <div class="rc-about-container">
      <div class="row">
        <div class="col-sm-8 rc-col-a">
          <div class="rc-wrapper">
            <p>
              Ryan lives in San Francisco, CA. His photographs often capture the calm and the isolated. These images tend to describe himself, rather than the time or place.
            </p>

            <?php include "_about_sidebar.php" ?>

            <div class="rc-smaller">
              <h2>Colophon</h2>

              <p>
                This website was built using <a href="http://www.gnu.org/software/make/">Make</a>, and a variety of open source tools. The <a href="https://github.com/rcarver/ryancarver.com-v2">source is available</a> on GitHub. 
              </p>
              <p>
                The text is set in <a href="https://typekit.com/fonts/ff-tisa-web-pro">FF Tisa from FontFont</a> and served by <a href="https://typekit.com/">Typekit</a>. 
              </p>
              <p>
                <a href="<?= $baseurl ?>/firecracker.html">Firecracker</a> is set in <a href="http://www.typography.com/fonts/hoefler-text/overview/">Hoefler Text by Hoefler &amp; Co</a>, and served by <a href="http://www.typography.com/cloud/welcome/">Cloud.Typography</a>.
              </p>

              <h2>Archives</h2>

              <p>
                This is the second version of my photography website. The <a href="http://www.ryancarver.com/archives/v1/">previous version</a>, with work from 2009-2010, is also available.
              </p>
            </div>
          </div>
        </div>
        <div class="col-sm-4 rc-col-b">
          <div class="rc-wrapper">
            <?php include "_about_sidebar.php" ?>
          </div>
        </div>
      </div>
    </div>

    <?php include "_footer.php" ?> 

    <?php include "_scripts.php" ?> 
  </body>
</html>
