<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>志愿者服务管理系统</title>
    <link rel='stylesheet prefetch' href='<%=request.getContextPath()%>/css/bootstrap.min.css'>

    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
    <style type="text/css">
        body{
            background-image: url("<%=request.getContextPath()%>/images/IMG_0005.jpg");
            background-size: 100% 100%;
        }
    </style>
</head>
<body>
<div class="wrapper">
    <form class="form-signin" action="<%=request.getContextPath()%>/login" method="post">
        <h2 class="form-signin-heading">欢迎使用</h2>
        <input type="text" class="form-control" name="username" placeholder="用户名" required="" autofocus=" "/>
        <input type="password" class="form-control" name="password" placeholder="密码" required=""/>
        <label class="checkbox">
            <input type="checkbox" value="remember-me" id="rememberMe" name="rememberMe"> 记住我
       </label>

        <button class="btn btn-lg btn-primary btn-block" type="submit">登陆</button>  
       
		</form>
		
		
		









</div>


</body>
</html>


<!--添加账号 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">账号信息</h4>
			</div>
			<div class="modal-body">
				<form id="account_add_from" class="form-horizontal" role="form">
					<div class="form-group">
						<label for="account_id" class="col-sm-2 control-label">志愿者id</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="account_id" name="account_id" placeholder="请输入学号">
						</div>
					</div>
					<div class="form-group">
						<label for="username" class="col-sm-2 control-label">名字</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="username" id="username" placeholder="请输入名字">
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">性别</label>
						<div class="checkbox-inline">
							<label>
								<input type="radio" id="sex1" name="sex" value="1" checked> 男
							</label>
						</div>
						<div class="checkbox-inline">
							<label>
								<input type="radio" id="sex2" name="sex" value="2"> 女
							</label>
						</div>
					</div>
					<div class="form-group">
						<label for="mobile" class="col-sm-2 control-label">手机号码</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" name="mobile" id="mobile" placeholder="请输入手机号码">
						</div>
					</div>
                    <div class="form-group">
                        <label for="email" class="col-sm-2 control-label">邮件地址</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="email" id="email" placeholder="邮件地址">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="screenName" class="col-sm-2 control-label">昵称</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="screenName" id="screenName" placeholder="昵称">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="type" class="col-sm-2 control-label">账号类型</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="type" id="type" placeholder="账号类型">
                        </div>
                    </div>



				</form>

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button id="account_add_submit" type="button" class="btn btn-primary" data-dismiss="modal">提交</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
<!-- 添加账号结束 -->
<script type="text/javascript">

    $(function(){
        $("#account_add_submit").click(function(){
            $.ajax({
                type: 'post',
                dataType: 'json',
                url: '<%=request.getContextPath()%>/account/add',
                data: $("#account_add_from").serialize(),
                success: function(obj) {
                    if(obj.success == true){
                        window.location.reload();
					}else{
                        alert(obj.message);

					}
                }
            });
        });
    });

    /*查看学生详情*/
    function detail(accountId) {
        $.ajax({
            type: 'post',
            dataType: 'json',
            url: '<%=request.getContextPath()%>/account/detail',
            data: {"account_id": accountId},
            success: function(obj) {
                if(obj.success == true){
                    $("#account_add_btn").click();

                    $("#account_id").val(obj.data.id);
                    $('#account_id').attr("disabled","false");

                    $("#username").val(obj.data.username);
                    $('#username').attr("disabled","false");

                    if(obj.data.sex == "1"){
                        $('#sex1').attr("checked","true");
                    }else{
                        $('#sex2').attr("checked","true");
                    }

                    $("#mobile").val(obj.data.mobile);
                    $('#mobile').attr("disabled","false");

                    $("#email").val(obj.data.email);
                    $('#email').attr("disabled","false");

                    $("#screenName").val(obj.data.screenName);
                    $('#screenName').attr("disabled","false");

                    $("#username").val(obj.data.username);
                    $('#username').attr("disabled","false");

                    if(obj.data.type == 2){
                        $("#type").val("部长");
                    }else if(obj.data.type == 3){
                        $("#type").val("学生");
                    }
                    

                    $("#type").attr("disabled","false");

                    $("#account_add_submit").remove();
                }else{
                    alert(obj.message);
                }
            }
        });
    }

   

</script>