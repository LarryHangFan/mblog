<!-- Login dialog BEGIN -->
<div id="login_alert" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog show-window show-top" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">请登录</h4>
            </div>
            <div class="modal-body show-windows">
                <form method="POST" action="${base}/login" accept-charset="UTF-8">
                    <div class="form-group">
                        <input class="form-control" id="ajax_login_username" name="username" type="text" placeholder="账号" required>
                    </div>
                    <div class="form-group">
                        <input class="form-control" id="ajax_login_password" name="password" type="password" placeholder="密码" required>
                    </div>
                    <div class="form-group">
                        <button id="ajax_login_submit" class="btn btn-primary btn-block btn-sm show-login" type="button">
                            立即登录
                        </button>
                    </div>
                    <div class="form-group">
                        <div id="ajax_login_message" class="text-danger"></div>
                    </div>
                    <@controls name="register">
                        <fieldset class="form-group">
                            <#if site.hasValue("weibo_client_id")>
                            <a class="btn btn-default btn-block bg-weibo" href="${base}/oauth/callback/call_weibo">
                                <i class="fa fa-weibo"></i> 微博登录
                            </a>
                            </#if>
                            <#if site.hasValue("qq_app_id")>
                            <a class="btn btn-default btn-block bg-qq" href="${base}/oauth/callback/call_qq">
                                <i class="fa fa-qq"></i> QQ登录
                            </a>
                            </#if>
                            <#if site.hasValue("github_client_id")>
                            <a class="btn btn-default btn-block bg-github" href="${base}/oauth/callback/call_github">
                                <i class="fa fa-github"></i> Github登录
                            </a>
                            </#if>
                        </fieldset>
                    </@controls>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- /.modal-content -->
<!-- /.modal-dialog -->
<!-- /.modal -->
<!-- Login dialog END -->
<!--[if lt IE 9]>
<div class="alert alert-danger alert-dismissible fade in" role="alert" style="margin-bottom:0">
	<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
	<strong>您正在使用低版本浏览器，</strong> 在本页面的显示效果可能有差异。
	建议您升级到
	<a href="http://www.google.cn/intl/zh-CN/chrome/" target="_blank">Chrome</a>
	或以下浏览器：
	<a href="www.mozilla.org/en-US/firefox/‎" target="_blank">Firefox</a> /
	<a href="http://www.apple.com.cn/safari/" target="_blank">Safari</a> /
	<a href="http://www.opera.com/" target="_blank">Opera</a> /
	<a href="http://windows.microsoft.com/en-us/internet-explorer/download-ie" target="_blank">Internet Explorer 9+</a>
</div>
<![endif]-->
<!-- Fixed navbar -->
<header class="header">
    <div class="container">
        <nav class="navbar" role="navigation">
            <div class="navbar-header">
                <button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="${base}/">
                    <img src="<@resource src=options['site_logo']/>"/>
                </a>
            </div>
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav">
					<#if profile??>
						<li data="user">
                            <a href="${base}/users/${profile.id}" nav="user">我的主页</a>
                        </li>
                    </#if>
					<#list channels as row>
						<li class="hidden-xs hidden-sm">
                            <a href="${base}/channel/${row.id}" nav="${row.name}">${row.name}</a>
                        </li>
                    </#list>
                    <li>
                        <a href="${base}/tags" nav="tags" class="tags-i">标签 <i class="fa  fa-circle"></i></a>
                    </li>
                </ul>
                <ul class="navbar-button list-inline" id="header_user">
                    <li view="search" class="hidden-xs hidden-sm">
                        <form method="GET" action="${base}/search" accept-charset="UTF-8" class="navbar-form navbar-left">
                            <div class="form-group">
                                <input class="form-control search-input mac-style" placeholder="搜索" name="kw" type="text" value="${kw}">
                                <button class="search-btn" type="submit"><i class="fa fa-search"></i></button>
                            </div>
                        </form>
                    </li>

				<#if profile??>
                    <@controls name="post">
                        <li>
                            <a href="${base}/post/editing" class="plus"><i class="icon icon-note"></i> 写文章</a>
                        </li>
                    </@controls>
                    <li class="dropdown">
                        <a href="#" class="user dropdown-toggle" data-toggle="dropdown" data-hover="dropdown">
                            <img class="img-circle" src="<@resource src=profile.avatar + '?t=' + .now?time />">
                            <span>${profile.name}</span>
                        </a>
                        <ul class="dropdown-menu" role="menu">
                            <li>
                                <a href="${base}/users/${profile.id}">我的主页</a>
                            </li>
                            <li>
                                <a href="${base}/settings/profile">编辑资料</a>
                            </li>
                            <@shiro.hasPermission name="admin">
                                <li><a href="${base}/admin">后台管理</a></li>
                            </@shiro.hasPermission>
                            <li><a href="${base}/logout">退出</a></li>
                        </ul>
                    </li>
                <#else>
                    <li><a href="${base}/login" class="btn btn-default btn-sm signup">登录</a></li>
                    <@controls name="register">
                        <li><a href="${base}/register" class="btn btn-primary btn-sm signup">注册</a></li>
                    </@controls>
                </#if>

                </ul>
            </div>
        </nav>
    </div>
    <!-- 移动端显示 start -->
    <div class="slide-box hidden-lg">
        <#list channels as row>
            <div class="slide-item">
                <a href="${base}/channel/${row.id}" nav="${row.name}">${row.name}</a>
            </div>
        </#list>
    </div>
    <!-- 移动端显示 end -->
</header>

<script type="text/javascript">
    $(function () {
        $('a[nav]').each(function(){
            $this = $(this);
            if($this[0].href == String(window.location)){
                $this.closest('li').addClass("active");
            }
        });
    });
</script>
<!-- Header END -->