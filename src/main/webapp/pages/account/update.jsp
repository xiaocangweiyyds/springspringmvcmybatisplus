<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ include file="../../common.jsp" %>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>修改</title>
    <meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no' name='viewport'/>

</head>
<body>
<div class="wrapper">
    <!--  头 和菜单    用jsp:include 嵌入进来  ( 包含 )-->
    <jsp:include page="../../menu.jsp"></jsp:include>

    <div class="main-panel">
        <div class="content">
            <div class="page-inner">
                <div class="page-header">
                    <h4 class="page-title">权限修改</h4>
                    <ul class="breadcrumbs">
                        <li class="nav-home">
                            <a href="#">
                                <i class="flaticon-home"></i>
                            </a>
                        </li>
                        <li class="separator">
                            <i class="flaticon-right-arrow"></i>
                        </li>
                        <li class="nav-item">
                            <a href="#">用户</a>
                        </li>
                        <li class="separator">
                            <i class="flaticon-right-arrow"></i>
                        </li>
                        <li class="nav-item">
                            <a href="#">修改</a>
                        </li>
                    </ul>

                </div>

                <!-- 首页的 内容-->
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <div class="card-title">请录入例子信息</div>
                            </div>
                            <form onsubmit="return false;">
                                <div class="card-body">
                                    <div class="form-group">
                                        <input type="hidden" name="id" id="idid"/>
                                        <label for="orderNameId">用户名</label>
                                        <input type="text" class="form-control" name="name" id="nameid">
                                        <label for="orderNameId">密码</label>
                                        <input type="text" class="form-control" name="password" id="passwordid">
                                        <label for="orderNameId">邮箱</label>
                                        <input type="text" class="form-control" name="email" id="emailid">
                                    </div>
                                </div>
                                <div class="card-action">
                                    <button class="btn btn-success" onclick="updatejs();">保存</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    $(function () {
        var id = $.getUrlParam("id");
        $.ajax({
            url: "/springspringmvcmybatisplus/getupdate",//跳转的路径
            data: {id: id},
            dataType: "json",//表示是json格式
            type: "post",//post请求
            async: true,//异步请求
            success: function (data) {//随便写了一个去接servlet传来的数据
                $("#nameid").val(data.name);
                $("#passwordid").val(data.password);
                $("#emailid").val(data.email);
                $("#idid").val(data.id);
            }
        })
    });

    function updatejs() {
        $.ajax({
            type: "post",//请求方式为post
            url: "/springspringmvcmybatisplus/update",//请求url
            dataType: 'json',//数据格式为json
            async: true,//是否同步，false表示为异步
            data: $("form").serialize(),//$("form").serialize(),就是把from中的所有值拿出来，自动用&分开的
            success: function (data) { //function为一个回调函数，data表示为请求servlet后，servlet中返回回来的值
            }, error: function (a, b, c, d) {
                console.log(a, b, c, d);
            }
        });
        location.href = "list.jsp";
    }

</script>
</html>