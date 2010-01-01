
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head profile="http://gmpg.org/xfn/11">
	<title><?php bloginfo('name'); if ( is_404() ) : _e(' &raquo; ', 'sandbox'); _e('Not Found', 'sandbox'); elseif ( is_front_page() || is_home() ) : _e(' &raquo; ', 'sandbox'); bloginfo('description'); else : wp_title(); endif; ?></title>

	<link rel="stylesheet" type="text/css" href="<?php bloginfo('stylesheet_url'); ?>"   />
	<link rel="stylesheet" type="text/css" href="<?php bloginfo('stylesheet_directory'); ?>/parallax.css" />	
	<link rel="alternate" type="application/rss+xml" href="<?php bloginfo('rss2_url') ?>" title="<?php echo wp_specialchars(get_bloginfo('name'), 1) ?> <?php _e('Posts RSS feed', 'sandbox'); ?>" />
	<link rel="alternate" type="application/rss+xml" href="<?php bloginfo('comments_rss2_url') ?>" title="<?php echo wp_specialchars(get_bloginfo('name'), 1) ?> <?php _e('Comments RSS feed', 'sandbox'); ?>" />
	<link rel="pingback" href="<?php bloginfo('pingback_url') ?>" />
<?php wp_head() ?>
	
	<link rel="stylesheet" href="<?php bloginfo('stylesheet_directory'); ?>/scripts/sifr/css/sIFR-screen.css" type="text/css" media="screen" />
	<link rel="stylesheet" href="<?php bloginfo('stylesheet_directory'); ?>/scripts/sifr/css/sIFR-print.css" type="text/css" media="print" />
	
<script type="text/javascript" src="<?php bloginfo('stylesheet_directory'); ?>/scripts/sifr/js/sifr.js"></script>
<script src="<?php bloginfo('stylesheet_directory'); ?>/scripts/jquery-1.3.1.js" type="text/javascript" charset="utf-8"></script>
<script src="<?php bloginfo('stylesheet_directory'); ?>/scripts/equalcolumns.js" type="text/javascript" charset="utf-8"></script>


	<script type="text/javascript" src="<?php echo get_bloginfo('template_directory') ?>/scripts/swfobject.js"></script>	
	
	


	<?
	global $options;
	foreach ($options as $value) {
	    if (get_settings( $value['id'] ) === FALSE) { $$value['id'] = $value['std']; } else { $$value['id'] = get_settings( $value['id'] ); }
	}

	?>

	<script type="text/javascript">

	var flashvars = {};
		flashvars.twitterID = "<?php echo $parallax_twitter_id;?>";
		flashvars.ignoreReplies =  "<?php echo $parallax_twitter_replies;?>";
				var params = {};
				params.wmode = "transparent";
				params.allowscriptaccess = "always";
				var attributes = {};
				attributes.id = "tweet";
				swfobject.embedSWF("/wp-content/themes/parallax/flash/tweet.swf", "theTweet", "220", "245", "9.0.0", "/wp-content/themes/parallax/flash/scripts/expressInstall.swf", flashvars, params, attributes);
</script>		
		<?php if($parallax_header_type == "flash"){ 
			$content = '<div id="headInner"><h1><a href="'.get_bloginfo("home").'">'.get_bloginfo("name").'</a></h1><div class="description">'.get_bloginfo("description").'</div> </div>';
			if($parallax_use_alt_header){
				$fName = $parallax_alt_flash_title;
				$fSub = $parallax_alt_flash_desc;
			} else {
				$fName = get_bloginfo('name');
				$fSub = get_bloginfo('description');
				$fUrl = get_bloginfo("url");
			}
			
echo <<<FLASHHEAD
			<script type="text/javascript" charset="utf-8">
						var params2 = {};
							params2.wmode = "transparent";
							params2.allowscriptaccess = "always";
						var attributes2 = {};
						var flashvars2 = {};
FLASHHEAD;
	echo 'flashvars2.useFlash = "'.$headerType.'";';
	echo 'flashvars2.headText = "'.$fName.'";';
	echo 'flashvars2.subText = "'.$fSub.'";';
	echo 'flashvars2.mainPage = "'.$fUrl.'";';
	echo 'swfobject.embedSWF("/wp-content/themes/parallax/flash/Header.swf", "headInner", "700", "300", "10", "expressInstall.swf", flashvars2, params2, attributes2);';
	echo '</script>';
	} else if ($parallax_header_type == "image") {
		$hContent = '<a href="'.get_bloginfo("home").'"><img src="'.$parallax_header_image_url.'" /></a>';
	} else if ($parallax_header_type == "html"){
		$hContent = '<h1><a href="'.get_bloginfo("home").'">'.get_bloginfo("name").'</a></h1><div class="description">'.get_bloginfo("description").'</div>';
	}	
?>

	<!--[if IE 7]>
	<link rel="stylesheet" href="<?php bloginfo('stylesheet_directory'); ?>/styleIE7.css" type="text/css" media="screen" />
	<![endif]-->
	<!--[if IE 6]>
	<link rel="stylesheet" href="<?php bloginfo('stylesheet_directory'); ?>/styleIE6.css" type="text/css" media="screen" />

	<![endif]-->

</head>

<body class="<?php sandbox_body_class() ?> sIFR-active">	


<script type="text/javascript">
		var arno = {
		      src: '/wp-content/themes/parallax/flash/arno.swf'
		};

		sIFR.activate(arno);

		sIFR.replace(arno, {
		      selector: '.entry-title',
		      css: [
		     '.sIFR-root { font-size:30px; float:left;  padding-top:10px; font-weight:bold; text-decoration:none; color:#77868f; }',
			'a {font-weight:bold; text-decoration:none;  padding-top:10px;  color:#77868f; }',
			'a:hover { font-weight:bold; color:#d9e2e8; padding-top:10px; }'
		      ]
		});
		
		
		</script>
		
	
<div id="wrapper" class="hfeed">
	<div id="header">
			<div id="search">

				<form id="searchform" method="get" action="<?php bloginfo('home') ?>">
<fieldset>
						<input id="s" name="s" class="text-input" type="text" onfocus="if(this.value=='Search')value=''" onblur="if(this.value=='')value='Search';" value="Search" size="10" tabindex="1" accesskey="S" />
</fieldset>
				</form>
		</div>
		<div id="headInner">
		<?php echo $hContent ?>	
		</div>
</div>


	<!-- <div id="access">
		<?php sandbox_globalnav() ?>
	</div> -->
