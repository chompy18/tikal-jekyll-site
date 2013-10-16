---
layout: default
title: test fb-comments-count
created: 1363099131
---
<p>Comments Count using regular URL:</p>
<div class="fb-comments-count" data-href="<?php global $base_url; print $base_url .'/'. drupal_get_path_alias('node/' .  $node->nid); ?>">
	0</div>
<div id="fb-root">
	&nbsp;</div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
