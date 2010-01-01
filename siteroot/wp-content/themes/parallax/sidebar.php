<div id="allSideBars">	
	<div id="primary" class="sidebar">

	<ul class="xoxo">
			
			<li id="tweeter">
		<div id="theTweet">
			<div id="twinner">
			Haven't upgraded your Flash Player lately? Tsk tsk...
				<a href="http://www.adobe.com/go/getflashplayer">
								<img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="Get Adobe Flash player" /></a>
					</div>								
			</div>
			</li>
			

	

			
			<li id="rss_links" class="widget widget_rss_links">
			<h3 class="widgettitle">RSS Links</h3>
			<ul>
				<li id="allPostsRSS">
<a href="<?php bloginfo('rss2_url'); ?>" title="<?php echo attribute_escape(__('Syndicate this site using RSS 2.0')); ?>">All posts</a>				</li>
					<li id="allCommentsRSS">
			<a href="<?php bloginfo('comments_rss2_url'); ?>" title="<?php echo attribute_escape(__('The latest comments to all posts in RSS')); ?>">All comments</a>
					</li>
				</ul>
			</li>

			<li id="recent-posts" class="widget recentPostsHolder">
				<h3><?php _e('Recent', 'sandbox'); ?></h3>

				 <ul><?php get_archives('postbypost','5','custom','<li>','</li>'); ?></ul>



			</li>

			
			
						<li id="pages">
							<h3><?php _e('Pages', 'sandbox') ?></h3>
							<ul>
			<?php wp_list_pages('title_li=&sort_column=post_title' ) ?>
							</ul>
						</li>
		
				
					</ul>		
	</div><!-- #primary .sidebar -->


</div>