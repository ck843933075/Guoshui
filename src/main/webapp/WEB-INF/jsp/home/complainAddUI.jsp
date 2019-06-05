<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("basePath", request.getContextPath()+"/") ;
%>
<html>
<head>
    <%@include file="/common/header.jsp"%>
    <title>我要投诉</title>
    <script type="text/javascript" charset="utf-8" src="${basePath }js/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${basePath }js/ueditor/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="${basePath }js/ueditor/lang/zh-cn/zh-cn.js"></script>

    <script>
   		window.UEDITOR_HOME_URL = "${basePath }js/ueditor/";
    	var ue = UE.getEditor('editor');
    	
    	//页面加载事件:
    		function bodyOnload() {
				$.ajax({
					type:'post',
					url:'${basePath}/nsfw/dept/findAll.action', // 获取所有的部门
					success:function(msg){
						/* alert(msg); */
						var str="";
						for (var i = 0; i < msg.length; i++) {
							str+="<option value="+msg[i].DId+"> "+msg[i].DName+" </option>"; 							
						}
						 $("#s1").html(str); 						
					}
					
				})
			}
    	function findUser(obj) {
    		/* alert(obj.value); */
			 $.ajax({
				type:'post',
				url:'${basePath}/nsfw/dept/findUserByDeptId.action', 
				data:{
					"DId":obj.value
				},
				success:function(msg){
					/* alert(msg); */
					var str="<option>请选择</option>";
					for (var i = 0; i < msg.length; i++) {
						str+="<option value="+msg[i].UId+">"+msg[i].UName+"</option>";
					}
					$("#s2").html(str); 
				}
			}) 
			
		}
    	
    	
    </script>
    
</head>
<body onload="bodyOnload()">
<form id="form" name="form" action="${basePath }/home/complain/add.action" method="post" enctype="multipart/form-data">
    <div class="vp_d_1">
        <div style="width:1%;float:left;">&nbsp;&nbsp;&nbsp;&nbsp;</div>
        <div class="vp_d_1_1">
            <div class="content_info">
    <div class="c_crumbs"><div><b></b><strong>工作主页</strong>&nbsp;-&nbsp;我要投诉</div></div>
    <div class="tableH2">我要投诉</div>
    <table id="baseInfo" width="100%" align="center" class="list" border="0" cellpadding="0" cellspacing="0"  >
        <tr>
            <td class="tdBg" width="250px">投诉标题：</td>
            <td><s:textfield name="CTitle"/></td>
        </tr>
        <tr>
            <td class="tdBg">被投诉人部门：</td>
            <td>
            <select id="s1" name="depts" onchange="findUser(this)">  
            </select>
            <%-- <s:select id="toCompDept" name="comp.toCompDept" list="#{'':'请选择','部门A':'部门A','部门B':'部门B' }" onchange="doSelectDept()"/> --%></td>
        </tr>
        <tr>
            <td class="tdBg">被投诉人姓名：</td>
            <td>
                <select id="s2" name="userByUedId.UId" >
            	<option>请选择</option>
            	</select> 
            </td>
        </tr>
        <tr>
            <td class="tdBg">投诉内容：</td>
            <td><s:textarea id="editor" name="CContent" cssStyle="width:90%;height:160px;" /></td>
        </tr>
        <tr>
            <td class="tdBg">是否匿名投诉：</td>
            <td><s:radio name="CIsnm" list="#{2:'非匿名投诉',1:'匿名投诉' }" value="1"/></td>
        </tr>
       
    </table>

    <div class="tc mt20">
        <input type="submit" class="btnB2" value="保存" />
        &nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button"  onclick="javascript:window.close()" class="btnB2" value="关闭" />
    </div>
    </div></div>
    <div style="width:1%;float:left;">&nbsp;&nbsp;&nbsp;&nbsp;</div>
    </div>
</form>
</body>
</html>