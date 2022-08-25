<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ include file="common.jsp"%>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>登录</title>
<meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no'
	name='viewport' />
</head>
<body>
	<script type="text/javascript">
		function changeCode() {
			var imgNode=document.getElementById("vimg");
			imgNode.src="/springspringmvcmybatisplus/randomServlet?t"+Math.random();
		}
	</script>
	<div class="wrapper wrapper-login">
		<div class="container container-login animated fadeIn">
			<h1 class="text-center">手机分期登录</h1>
			<div class="login-form">
				<form action="/springspringmvcmybatisplus/accountlogin" method="post">
					账号:<input id="name" name="name" type="text" class="form-control" required>
					密码:<input id="password" name="password" type="password" class="form-control" required>
					验证码 :<input type="text" name="randomCode" />
					<img id="vimg" title="点击" src="/springspringmvcmybatisplus/randomServlet" onclick="changeCode();">
					<span id="ieee"></span> <br />
					<input type="submit" class="btn btn-primary col-md-3 float-right mt-2 mt-sm-0 fw-bold" value="登录">
				</form>

				<script type="text/javascript">
					var a = '${param.a}';
					if (a == 1) {
						document.getElementById("ieee").innerHTML = "<font color='red'>验证码输入错误</font>";
					} else if (a == 2) {
						document.getElementById("ieee").innerHTML = "<font color='red'>账户名密码错误</font>";
					} else if (a == 3) {
						document.getElementById("ieee").innerHTML = "<font color='red'>账户名密码不能为空</font>";
					} else {
						document.getElementById("ieee").innerHTML = "";
					}
				</script>
				
			</div>
			<br />
			<a href="/springspringmvcmybatisplus/register.jsp">注册</a>
		</div>
	</div>
</body>
</html>