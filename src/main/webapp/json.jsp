<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		//json的语法: 以{}保存对象 ,以[]保存数组,数据在名称/值对中
		//json的对象	此处创建了一个person对象,有两个属性
		/* 	var person={
		 "name":"小明",
		 "age":18
		 }
		 alert(person.name); */

		//数组: []  存放了多个对象
		/* 	var persons=[
		 {"name":"西湖","age":13},{"name":"啦啦","age":16}
		 ]
		 alert(persons[0].name); */

		/*json的常见用法是从web服务器上读取json数据(字符串),将json数据转换为JavaScript对象,
		然后在页面中使用该数据  通过ajax */
		//解析json字符串
		//写一个json字符串,把json对象以字符串的形式来描述
		/* var person = '{"person":' + '{"name":"小明"}' + '}'; // json字符串
		//解析
		var obj=eval("("+person+")");
		alert(obj.person.name); */
		
		var persons='{"person":[' + '{"name":"小米"},' + '{"name":"小红"}' + ']}';
		//解析
		var objs=eval("("+persons+")");
		alert(objs.person[0].name);
		
		
	</script>
</body>
</html>