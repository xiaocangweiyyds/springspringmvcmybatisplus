<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ include file="../../common.jsp" %>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>用户列表</title>
    <script src="../js/param.js" type="text/javascript"></script>
    <script src="../js/pages.js" type="text/javascript"></script>
    <meta content='width=device-width, initial-scale=1.0, shrink-to-fit=no'
          name='viewport'/>
</head>
<body>
<div class="wrapper">

    <jsp:include page="../../menu.jsp"></jsp:include>

    <div class="main-panel">
        <div class="content">
            <div class="page-inner">
                <div class="page-header">
                    <h4 class="page-title">用户</h4>
                    <ul class="breadcrumbs">
                        <li class="nav-home"><a href="#">
                            <i class="flaticon-home"></i>
                        </a></li>
                        <li class="separator"><i class="flaticon-right-arrow"></i></li>
                        <li class="nav-item"><a href="#">用户</a></li>
                        <li class="separator"><i class="flaticon-right-arrow"></i></li>
                        <li class="nav-item"><a href="#">列表</a></li>
                    </ul>
                </div>

                <!-- 首页的 内容-->
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                <a href="add.jsp">添加</a>
                            </div>
                            <div class="card-body">
                                <div class="col-md-12">
                                    <div class="card-body">
                                        <table
                                                class="table table-bordered table-head-bg-info table-bordered-bd-info mt-12">
                                            <thead>
                                            <tr align='center'>
                                                <th scope="col">id</th>
                                                <th scope="col">用户名</th>
                                                <th scope="col">密码</th>
                                                <th scope="col">邮箱</th>
                                                <th scope="col">状态</th>
                                                <th scope="col">创建人</th>
                                                <th scope="col">创建时间</th>
                                                <th scope="col">修改人</th>
                                                <th scope="col">修改时间</th>
                                                <th scope="col">操作</th>
                                            </tr>
                                            </thead>
                                            <tbody id="tableid"></tbody>
                                        </table>
                                        <!-- 分页的 -->
                                        <div id="pageDivId"></div>
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
    $(function () {
        list();
    });

    function list() {
        var pns = $.getUrlParam("pn");
        $.ajax({
            type: "post", //post请求、
            url: "/springspringmvcmybatisplus/query", //项目路径
            dataType: "json", //返回回来的数据格式
            async: true, //异步
            data: {pn: pns}, //返回后台的参数
            success: function (data) {//servlet(后台)传过来的参数
                console.log(data)
                var con = "";
                $.each(data.list, function (i, ojb) {  //相当于for循环，for(School ojb : list)
                    con = con +
                        "<tr align='center'>" +
                            "<td>" + ojb.id + "</td>" +
                            "<td>" + ojb.name + "</td>" +
                            "<td>" + ojb.password + "</td>" +
                            "<td>" + ojb.email + "</td>" +
                            "<td>" + ojb.state + "</td>" +
                            "<td>" + ojb.creator + "</td>" +
                            "<td>" + ojb.createTime + "</td>" +
                            "<td>" + ojb.updater + "</td>" +
                            "<td>" + ojb.updateTime + "</td>" +
                            "<td><a href='/springspringmvcmybatisplus/delete/" + ojb.id + "'>删除</a> <a href='/springspringmvcmybatisplus/pages/account/update.jsp?id=" + ojb.id + "'>修改</a></td>" +
                        "</tr>";
                });
                $("#tableid").html(con);
                pages(data.totalPage, data.pageNum, "list.jsp");
            },
            error: function (a, b, c, d) { //出错就执行这里把错误打印到控制台
                console.log(a, b, c, d);
            }
        });
    }

</script>

</body>
</html>