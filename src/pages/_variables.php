<?php

function debug_stderr($str) {
  file_put_contents('php://stderr', "$str\n");
}

function die_on_error($errno, $errstr, $errfile, $errline) {
  debug_stderr("Error on $errfile:$errline");
  debug_stderr("$errstr");
  exit(-1);
}

set_error_handler("die_on_error");

$options = getopt("", array(
  "baseurl:",
  "livereload",
  "checkvars"
));

$baseurl = array_key_exists('baseurl', $options) ? $options['baseurl'] : '';
$livereload = array_key_exists('livereload', $options);
$checkvars = array_key_exists('checkvars', $options);


if ($checkvars) {
  debug_stderr("CLI vars:");
  debug_stderr("  baseurl = $baseurl");
  debug_stderr("  livereload = $livereload");
  debug_stderr("Exiting...");
  exit(0);
}

?>