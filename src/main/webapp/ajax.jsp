<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    application.setAttribute("basePath",basePath);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${basePath }/js/jquery/jquery-1.10.2.min.js"></script>
<script type="text/javascript">
	function checkUsername(obj) {
		$.ajax({
			url:'${basePath}test/ajax.action',
			type:'post',
			data:{
				"username":obj.value
			},
			success:function(msg){
				alert("成功了"+msg);
			}
		})
	}
</script>
</head>
<body>
<input type="text" name="username" onblur="checkUsername(this)">

</body>
</html>