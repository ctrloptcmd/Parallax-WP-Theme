<?php get_header() ?>

	<div id="container">
		<div id="content">

			<div id="nav-above" class="navigation">
				<div class="nav-previous"><?php next_posts_link(__('<span class="meta-nav">&laquo;</span> Older posts', 'sandbox')) ?></div>
				<div class="nav-next"><?php previous_posts_link(__('Newer posts <span class="meta-nav">&raquo;</span>', 'sandbox')) ?></div>
			</div>

<?php while ( have_posts() ) : the_post() ?>
			<div id="post-<?php the_ID() ?>" class="<?php sandbox_post_class() ?> <?php the_category_unlinked(' '); ?>">

				
				<div class="timeAndName">
			
						<small class="PostTime">
						<strong class="day"><?php the_time('j') ?></strong>
						<strong class="month"><?php the_time('M') ?></strong>
						<strong class="year"><?php the_time('Y') ?></strong>
						</small>	
				
				<h2 class="entry-title"><a href="<?php the_permalink() ?>" title="<?php printf(__('Permalink to %s', 'sandbox'), wp_specialchars(get_the_title(), 1)) ?>" rel="bookmark"><?php the_title() ?></a></h2>
				
				
				</div>
				
				
				
				
				<div class="entry-content">
<?php the_content(''.__('Read More <span class="meta-nav">&raquo;</span>', 'sandbox').''); ?>

				<?php wp_link_pages('before=<div class="page-link">' .__('Pages:', 'sandbox') . '&after=</div>') ?>
				</div>
				<div class="entry-meta">
					<div class="entry-meta-inner">
					<span class="author vcard"><?php printf(__('By %s', 'sandbox'), get_the_author()) ?></span>
					<span class="meta-sep">|</span>
					<span class="cat-links"><?php printf(__('Posted in %s', 'sandbox'), get_the_category_list(', ')) ?></span>
					<span class="meta-sep">|</span>
					<?php the_tags(__('<span class="tag-links">Tagged ', 'sandbox'), ", ", "</span>\n\t\t\t\t\t<span class=\"meta-sep\">|</span>\n") ?>
<?php edit_post_link(__('Edit', 'sandbox'), "\t\t\t\t\t<span class=\"edit-link\">", "</span>\n\t\t\t\t\t<span class=\"meta-sep\">|</span>\n"); ?>
					<span class="comments-link"><?php comments_popup_link(__('Comments (0)', 'sandbox'), __('Comments (1)', 'sandbox'), __('Comments (%)', 'sandbox')) ?></span>
					</div>
				</div>
			</div>

<?php comments_template() ?>
<?php endwhile ?>

			<div id="nav-below" class="navigation">
				<div class="nav-previous"><?php next_posts_link(__('<span class="meta-nav">&laquo;</span> Older posts', 'sandbox')) ?></div>
				<div class="nav-next"><?php previous_posts_link(__('Newer posts <span class="meta-nav">&raquo;</span>', 'sandbox')) ?></div>
			</div>

		</div>
	</div>

<?php get_sidebar() ?>
<?php get_footer() ?>