<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ include file="../../common.jsp" %>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>添加</title>
    <meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no'
          name='viewport'/>

</head>
<body class="animsition">

<div class="page-wrapper">
    <!--  头 和菜单    用jsp:include 嵌入进来  ( 包含 )-->
    <jsp:include page="../../menu.jsp"></jsp:include>

    <div class="main-panel">
        <div class="content">
            <div class="page-inner">
                <div class="page-header">
                    <h4 class="page-title">添加</h4>
                    <ul class="breadcrumbs">
                        <li class="nav-home"><a href="#"> <i
                                class="flaticon-home"></i>
                        </a></li>
                        <li class="separator"><i class="flaticon-right-arrow"></i> <a
                                href="#">权限表</a></li>
                        <li class="separator"><i class="flaticon-right-arrow"></i></li>
                        <li class="nav-item"><a href="#">添加</a></li>
                    </ul>
                </div>
                <div class="page-content--bge5">
                    <div class="container">
                        <div class="login-wrap">
                            <div class="login-content">
                                <div class="login-logo">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="card">
                                                <div class="card-header">
                                                    <div class="card-title">请添加账号信息</div>
                                                </div>
                                                <form onsubmit="return false;">
                                                    <div class="card-action">
                                                        <div class="form-group">
                                                            <label for="orderNameId">账号</label>
                                                            <input type="text" class="form-control" name="name">
                                                            <label for="orderNameId">密码</label>
                                                            <input type="password" class="form-control" name="password">
                                                            <label for="orderNameId">邮箱</label>
                                                            <input type="text" class="form-control" name="email">
                                                        </div>
                                                        <button class="btn btn-success" onclick="addjs();">保存</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    function addjs() {
        $.ajax({
            type: "post",//请求方式为post
            url: "/springspringmvcmybatisplus/add",//请求url
            dataType: 'json',//数据格式为json
            async: true,//是否同步，false表示为异步
            data: $("form").serialize(),//$("form").serialize(),就是把from中的所有值拿出来，自动用&分开的
            success: function (data) { //function为一个回调函数，data表示为请求servlet后，servlet中返回回来的值
            }, error: function (a, b, c, d) {
                console.log(a, b, c, d);
            }
        });
        window.location.href = "list.jsp";
    }
</script>


</body>
</html>