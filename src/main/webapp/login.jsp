<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + 	request.getServerPort() + request.getContextPath() + "/";
%>

<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath%>">
	<meta charset="UTF-8">
	<link href="jquery/bootstrap_3.3.0/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
	<script type="text/javascript" src="jquery/jquery-1.11.1-min.js"></script>
	<script type="text/javascript" src="jquery/bootstrap_3.3.0/js/bootstrap.min.js"></script>
	<script>
		$(function () {

			if(window.top!=window){
				window.top.location=window.location;
			}

			//用户名默认获得焦点
			$("#userName").focus();
			//用户名在页面加载的时候清空
			$("#userName").val("");

			//绑定登录按钮
			$("#lobut").click(function () {
				/*alert("dosome..")*/
				log();
			})
			//绑定键盘回车键
			$(window).keydown(function (event) {
				//alert(event.keyCode);
				if(13==event.keyCode){
					/*alert("dosome...")*/
					log();
				}
			})



		})
		function log() {
			/*alert("dosome....");*/
			//$("#msg").html("登录请求发送！")
			//取得输入的账号密码
			var username = $.trim($("#userName").val());
			var password = $.trim($("#passWord").val());
			if(username == "" || password == ""){
				$("#msg").html("账号密码不能为空！")
				//如果为空的话，return false，后面的代码则不会执行
				return false;
			}
			$.ajax({
				url:"settings/user/login.do",
				data:{
					"userName" : username,
					"passWord" : password
				},
				type:"post",
				dataType:"json",
				success : function (data) {
					//返回的data中应有data.sucess?true:false，密码成功还是失败
					//如果成功了，正常跳转至网站首页
					//如果失败了，要返回一个消息，失败原因"msg":"失败原因"；
					if(data.success == true){
						window.location.href = "workbench/index.jsp";
					}else {
						//登录失败，向msg输出失败原因
						$("#msg").html(data.msg);
					}
				}

			})

		}


	</script>

</head>
<body>
	<div style="position: absolute; top: 0px; left: 0px; width: 60%;">
		<img src="image/IMG_7114.JPG" style="width: 100%; height: 90%; position: relative; top: 50px;">
	</div>
	<div id="top" style="height: 50px; background-color: #3C3C3C; width: 100%;">
		<div style="position: absolute; top: 5px; left: 0px; font-size: 30px; font-weight: 400; color: white; font-family: 'times new roman'">CRM &nbsp;<span style="font-size: 12px;"></span></div>
	</div>
	
	<div style="position: absolute; top: 120px; right: 100px;width:450px;height:400px;border:1px solid #D5D5D5">
		<div style="position: absolute; top: 0px; right: 60px;">
			<div class="page-header">
				<h1>登录</h1>
			</div>
			<form action="workbench/index.jsp" class="form-horizontal" role="form">
				<div class="form-group form-group-lg">
					<div style="width: 350px;">
						<input id="userName" class="form-control" type="text" placeholder="用户名">
					</div>
					<div style="width: 350px; position: relative;top: 20px;">
						<input id="passWord" class="form-control" type="password" placeholder="密码">
					</div>
					<div class="checkbox"  style="position: relative;top: 30px; left: 10px;">
						
							<span id="msg"style="color: red"></span>
						
					</div>
					<button type="button" id="lobut" class="btn btn-primary btn-lg btn-block"  style="width: 350px; position: relative;top: 45px;">登录</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>