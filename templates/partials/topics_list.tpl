<ul component="category" class="topic-list" itemscope itemtype="http://www.schema.org/ItemList" data-nextstart="{nextStart}" data-set="{set}">
	<meta itemprop="itemListOrder" content="descending">
	{{{each topics}}}
	<li component="category/topic" class="row clearfix category-item {function.generateTopicClass}" <!-- IMPORT partials/data/category.tpl -->>
		<a id="{../index}" data-index="{../index}" component="topic/anchor"></a>
		<meta itemprop="name" content="{function.stripTags, title}">

		<div class="col-md-8 col-sm-9 col-xs-10 content">
			<div class="avatar pull-left">
				<!-- IF showSelect -->
				<div class="select" component="topic/select">
					{{{ if ./thumbs.length }}}
					<img src="{./thumbs.0.url}" class="user-img not-responsive" />
					{{{ else }}}
					{buildAvatar(../user, "46", true, "not-responsive")}
					{{{ end }}}
					<i class="fa fa-check"></i>
				</div>
				<!-- ENDIF showSelect -->

				<!-- IF !showSelect -->
				<a href="<!-- IF topics.user.userslug -->{config.relative_path}/user/{topics.user.userslug}<!-- ELSE -->#<!-- ENDIF topics.user.userslug -->" class="pull-left">
					{{{ if ./thumbs.length }}}
					<img src="{./thumbs.0.url}" class="user-img not-responsive" />
					{{{ else }}}
					{buildAvatar(../user, "46", true, "not-responsive")}
					{{{ end }}}
				</a>
				<!-- ENDIF !showSelect -->
			</div>

			<h2 component="topic/header" class="title">
				<i component="topic/scheduled" class="fa fa-clock-o <!-- IF !topics.scheduled -->hide<!-- ENDIF !topics.scheduled -->" title="[[topic:scheduled]]"></i>
				<i component="topic/pinned" class="fa fa-thumb-tack <!-- IF (topics.scheduled || !topics.pinned) -->hide<!-- ENDIF (topics.scheduled || !topics.pinned) -->" title="{{{ if !../pinExpiry }}}[[topic:pinned]]{{{ else }}}[[topic:pinned-with-expiry, {../pinExpiryISO}]]{{{ end }}}"></i>
				<i component="topic/locked" class="fa fa-lock <!-- IF !topics.locked -->hide<!-- ENDIF !topics.locked -->" title="[[topic:locked]]"></i>
				<i component="topic/moved" class="fa fa-arrow-circle-right <!-- IF !topics.oldCid -->hide<!-- ENDIF !topics.oldCid -->" title="[[topic:moved]]"></i>
				{{{each topics.icons}}}{@value}{{{end}}}


				<!-- IF !topics.noAnchor -->
				<a component="topic/link" href="{config.relative_path}/topic/{topics.slug}<!-- IF topics.bookmark -->/{topics.bookmark}<!-- ENDIF topics.bookmark -->" itemprop="url">{topics.title}</a><br />
				<!-- ELSE -->
				<span>{topics.title}</span><br />
				<!-- ENDIF !topics.noAnchor -->

				<!-- IF !template.category -->
				<small class="pull-left topic-item__footer">
					<a href="{config.relative_path}/category/{topics.category.slug}" class="topic-item__footer__cat">
						<!-- IF topics.category.backgroundImage -->
						<span class="fa-stack fa-lg" style="{function.generateCategoryBackground, topics.category}">
							<i style="color:{topics.category.color};" class="fa {topics.category.icon} fa-stack-1x"></i>
						</span>
						<!-- ENDIF topics.category.backgroundImage -->{topics.category.name}</a> &bull;
				</small>
				<!-- ELSE -->
					{{{ if isNotEqual(topics.category.cid, cid) }}}
					<small class="pull-left topic-item__footer">
						<a href="{config.relative_path}/category/{topics.category.slug}" class="topic-item__footer__cat">
							<!-- IF topics.category.backgroundImage -->
							<span class="fa-stack fa-lg" style="{function.generateCategoryBackground, topics.category}">
								<i style="color:{topics.category.color};" class="fa {topics.category.icon} fa-stack-1x"></i>
							</span>
							<!-- ENDIF topics.category.backgroundImage -->{topics.category.name}</a> &bull;
					</small>
					{{{ end }}}
				<!-- ENDIF !template.category -->

				<small class="hidden-xs pull-left topic-item__footer">
					<span class="aa_topic__counter human-readable-number stats-votes text-muted"><i class="fa fa-fw fi-rr-heart" title="[[global:votes]]"></i> {topics.votes}</span>
					<span class="aa_topic__counter human-readable-number stats-postcount text-muted"><i class="fa fa-fw fi-rr-comment" title="[[global:posts]]"></i> {topics.postcount}</span>
					<span class="aa_topic__counter human-readable-number stats-viewcount text-muted"><i class="fa fa-fw fi-rr-eye" title="[[global:views]]"></i> {topics.viewcount}</span>
				</small>
				<small class="hidden-xs pull-right topic-item__footer">
					<span class="timeago" title="{topics.timestampISO}"></span>,
					<a class="aa_topic__author" href="<!-- IF topics.user.userslug -->{config.relative_path}/user/{topics.user.userslug}<!-- ELSE -->#<!-- ENDIF topics.user.userslug -->">{topics.user.displayname}</a> 
				</small>
				<!-- IF topics.teaser.timestamp -->
				<small class="pull-left topic-item__footer timeago visible-xs-inline" title="{topics.teaser.timestampISO}"></small>
				<!-- ELSE -->
				<small class="pull-left topic-item__footer timeago visible-xs-inline" title="{topics.timestampISO}"></small>
				<!-- ENDIF topics.teaser.timestamp -->
			</h2>
		</div>

		<div class="mobile-stat col-xs-2 visible-xs text-right">
			<a href="{config.relative_path}/topic/{topics.slug}/{topics.teaser.index}">
				<span class="aa_topic__counter human-readable-number stats-votes text-muted">{topics.votes} <i class="fa fa-fw fi-rr-heart" title="[[global:votes]]"></i></span>
				<span class="aa_topic__counter human-readable-number stats-postcount text-muted">{topics.postcount} <i class="fa fa-fw fi-rr-comment" title="[[global:posts]]"></i></span>
				<span class="aa_topic__counter human-readable-number stats-viewcount text-muted">{topics.viewcount} <i class="fa fa-fw fi-rr-eye" title="[[global:views]]"></i></span>
			</a>
		</div>

		<div class="col-md-4 col-sm-3 teaser hidden-xs" component="topic/teaser">
			<div class="card background-link-container" style="border-color: {topics.category.bgColor}">
				<a class="background-link" href="{config.relative_path}/topic/{topics.slug}/{topics.teaser.index}"></a>
				<!-- IF topics.unreplied -->
				<p>
					[[category:no_replies]]
				</p>
				<!-- ELSE -->
				<!-- IF topics.teaser.pid -->
				<p>
					<a href="{config.relative_path}/user/{topics.teaser.user.userslug}">{buildAvatar(topics.teaser.user, "24", true, "not-responsive")}</a>
					<a class="permalink" href="{config.relative_path}/topic/{topics.slug}/{topics.teaser.index}">
						<span class="timeago" title="{topics.teaser.timestampISO}"></span>
					</a>
				</p>
				<div class="post-content">
					{topics.teaser.content}
				</div>
				<!-- ENDIF topics.teaser.pid -->
				<!-- ENDIF topics.unreplied -->
			</div>
		</div>
	</li>
	{{{end}}}
</ul>
