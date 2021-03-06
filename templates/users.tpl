<!-- IMPORT partials/breadcrumbs.tpl -->

<div data-widget-area="header">
	{{{each widgets.header}}}
	{{widgets.header.html}}
	{{{end}}}
</div>
<div class="users">
	<div class="row">
		<div class="col-lg-7">
		<!-- IMPORT partials/users_list_menu.tpl -->
		</div>
		<!-- IF displayUserSearch -->
		<div class="col-lg-5">
			<div class="search">
				<div class="input-group">
					<input class="form-control" id="search-user" type="text" placeholder="[[users:enter_username]]"/>
					<span class="input-group-addon">
						<i component="user/search/icon" class="fa fa-search"></i>
					</span>
				</div>
			</div>
		</div>
		<!-- ENDIF displayUserSearch -->
	</div>

	<ul id="users-container" class="users-container">
		<!-- IMPORT partials/users_list.tpl -->
		<!-- IF anonymousUserCount -->
		<li class="users-box anon-user">
			<div class="avatar avatar-lg avatar-rounded">G</div>
			<br/>
			<div class="user-info">
				<span>[[global:guests]]:</span>
				<span id="online_anon_count">{anonymousUserCount}</span>
			</div>
		</li>
		<!-- ENDIF anonymousUserCount -->
	</ul>

	<!-- IMPORT partials/paginator.tpl -->
</div>
