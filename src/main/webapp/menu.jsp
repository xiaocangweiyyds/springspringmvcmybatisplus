<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!-- 头 -->
<div class="main-header" data-background-color="purple">
	<!-- 头左边 -->
	<div class="logo-header">  
		<a href="index.jsp" class="logo">
			<font class="navbar-brand" color="white">手机分期</font>					
		</a>
		<div class="navbar-minimize">
			<button class="btn btn-minimize btn-rounded">
				<i class="fa fa-bars"></i>
			</button>
		</div>
	</div>
	<!-- 结束 头左边 -->

	<!-- 头右边 
	<nav class="navbar navbar-header navbar-expand-lg">  
		<marquee> 
			<font class="navbar-brand" color="white">今天有10个账户升级为VIP</font>	 
		</marquee>
	</nav>
	结束 头右边 -->
	
</div>

<script src="../js/param.js" type="text/javascript"></script>
	<script src="../js/pages.js" type="text/javascript"></script>
<!-- 菜单   路径要写绝对路径  -->
<div class="sidebar"> 
	<div class="sidebar-background"></div>
	<div class="sidebar-wrapper scrollbar-inner">
		<div class="sidebar-content">
			 
			<ul class="nav">
				<li class="nav-item active">
					<a href="/springspringmvcmybatisplus/index.jsp">
						<i class="fas fa-home"></i>
						<p>首页</p>
					</a>
				</li>  
				<li class="nav-item">
					<a href="/springspringmvcmybatisplus/pages/account/list.jsp">
						<i class="fa fa-child" aria-hidden="true"></i>
						<p>用户</p> 
					</a>
				</li>
				<li class="nav-item">
					<a href="/springspringmvcmybatisplus/pages/father/list.jsp">
						<i class="fa fa-address-book" aria-hidden="true"></i> 
						<p>商品</p> 
					</a>
				</li>
				
				<li class="nav-item">
					<a href="/springspringmvcmybatisplus/pages/people/list.jsp">
						<i class="fa fa-info-circle" aria-hidden="true"></i>
						<p>订单</p> 
					</a>
				</li>
								
			</ul>
		</div>
	</div>
</div>
<!-- End 菜单 -->