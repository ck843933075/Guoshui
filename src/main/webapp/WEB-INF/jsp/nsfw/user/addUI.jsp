<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/common/header.jsp"%>
    <title>用户管理</title>
    <script type="text/javascript" src="${basePath }js/datepicker/WdatePicker.js"></script>
    <script type="text/javascript">
   var vResult = true;
    	//校验帐号唯一
     /* 	function doVerify(){
    		//1、获取帐号
    		var UUsername = $("#UUsername").val();
    		if(UUsername != ""){
    			//2、校验 
    			$.ajax({
    				url:"${basePath}nsfw/user_verifyAccount.action",
    				data: {"UUsername": UUsername},
    				type: "post",
    				async: false,//非异步
    				success: function(msg){
    					if("true" != msg){
    						//帐号已经存在
    						alert("帐号已经存在。请使用其它帐号！");
    						//定焦
    						$("#UUsername").focus();
    						vResult = false;
    					} else {
    						vResult = true;
    					}
    				}
    			});
    		}
    	} 
    	//提交表单
    	function doSubmit(){
    		var name = $("UName");
    		if(name.val() == ""){
    			alert("用户名不能为空！");
    			name.focus();
    			return false;
    		}
    		var password = $("UPassword");
    		if(password.val() == ""){
    			alert("密码不能为空！");
    			password.focus();
    			return false;
    		}
    		//帐号校验
    		doVerify();
    		if(vResult){
	    		//提交表单
	    		document.forms[0].submit();
    		}
    	} */
		var flag=false; //在提交的时候使用
    	function doVerify(obj) {
			$.ajax({
				url:'${basePath}nsfw/user/checkUsername.action',
				type:'post',
				data:{
					"UUsername":obj.value
				},
				success:function(msg){
					if(msg=="useable"){
						document.getElementById("s1").innerHTML="<font color=green>该账号不存在,可以添加</font>";
						flag=true;
					}else{
						document.getElementById("s1").innerHTML="<font color=red>该账号已存在,请重新输入</font>";
						$("#username").focus();
					}
				}
			})
		}
    	function doSubmit() {
			if(flag==false){
				$("#username").focus();
				return false;				
			}else{
				return true;
			}
		}
    </script>
</head>
<body class="rightBody">
<form id="form" name="form" onsubmit="return doSubmit()" action="${basePath }nsfw/user/user_addUI1.action" method="post" enctype="multipart/form-data">
    <div class="p_d_1">
        <div class="p_d_1_1">
            <div class="content_info">
    <div class="c_crumbs"><div><b></b><strong>用户管理</strong>&nbsp;-&nbsp;新增用户</div></div>
    <div class="tableH2">新增用户</div>
    <table id="baseInfo" width="100%" align="center" class="list" border="0" cellpadding="0" cellspacing="0"  >
        <tr>
            <td class="tdBg" width="200px">所属部门：</td>
           <%--  <td><s:select name="dept" list="#{'部门A':'部门A','部门B':'部门B' }"/></td> --%>
          <td><%-- <s:select name="dept.DId" list="%{depts}" listValue="%{DName}" listKey="%{DId}"/> --%>
           <select name="dept.DId">
				<s:iterator value="%{depts}">
					<option value="${DId}" ${DId==user.dept.DId?"selected":"" }>${DName}</option>
				</s:iterator>
			</select> 
          </td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">头像：</td>
            <td>
                <input type="file" name="photo"/>
            </td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">用户名：</td>
            <td><s:textfield id="name" name="UName"/> </td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">帐号：</td>
            <td><s:textfield id="username" name="UUsername" onchange="doVerify(this)"/>
            	<span id="s1"></span>
            </td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">密码：</td>
            <td><s:textfield id="UPassword" name="UPassword"/></td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">性别：</td>
            <td><s:radio list="#{'男':'男','女':'女'}" name="USex"/></td>
        </tr>
         <tr>
            <td class="tdBg" width="200px">角色：</td>
            <td>                 
            	<s:checkboxlist list="%{roles}" name="role.RId" listKey="%{RId}" listValue="%{RName}"></s:checkboxlist>
            </td>
        </tr> 
        <tr>
            <td class="tdBg" width="200px">电子邮箱：</td>
            <td><s:textfield name="UMail"/></td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">手机号：</td>
            <td><s:textfield name="UTel"/></td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">生日：</td>
            <td><s:textfield id="UBirth" name="UBirth" readonly="true" onfocus="WdatePicker({'skin':'whyGreen','dateFmt':'yyyy-MM-dd'});" /></td>
        </tr>
		<tr>
            <td class="tdBg" width="200px">状态：</td>
            <td><s:radio list="#{'1':'有效','0':'无效'}" name="UStatus" value="1"/></td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">备注：</td>
            <td><s:textarea name="URemark" cols="75" rows="3"/></td>
        </tr>
    </table>
    <div class="tc mt20">
        <!-- <input type="button" class="btnB2" value="保存" onclick="doSubmit()" /> -->
        <input type="submit" class="btnB2" value="保存 "/>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button"  onclick="javascript:history.go(-1)" class="btnB2" value="返回" />
    </div>
    </div></div></div>
</form>
</body>
</html>