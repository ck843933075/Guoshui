<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/js/jquery/jquery-1.10.2.min.js"></script>
<script type="text/javascript">
	function testJson() {
		$.ajax({
		url:'JsonServlet',
		type:'post',
		success:function(msg){
		//接收数据并传到页面
		var str;
		for (var i = 0; i < msg.length; i++) {
			str+="姓名:"+msg[i].name+"<br>";
		}		
			$("#d1").html(str);
		}
		})
	}
</script>
</head>
<body>
	<input type="button" onclick="testJson()">
	<div id="d1">
	
	</div>
</body>
</html>