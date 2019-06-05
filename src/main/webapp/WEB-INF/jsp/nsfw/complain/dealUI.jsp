<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/common/header.jsp"%>
    <title>投诉受理管理</title>
</head>
<body class="rightBody">
<form id="form" name="form" action="${basePath }nsfw/complainhanding/deal.action" method="post" enctype="multipart/form-data">
    <div class="p_d_1">
        <div class="p_d_1_1">
            <div class="content_info">
    <div class="c_crumbs"><div><b></b><strong>投诉受理管理</strong>&nbsp;-&nbsp;投诉受理</div></div>
    <div class="tableH2">投诉详细信息<span style="color:red;">(<s:property value="complainStatusMap[complain.CStatus]"/>)</span></div>
    <table id="baseInfo" width="100%" align="center" class="list" border="0" cellpadding="0" cellspacing="0"  >
    	<tr><td colspan="2" align="center">投诉人信息</td></tr>
        <tr>
            <td class="tdBg" width="250px">是否匿名投诉：</td>
            <td><s:property value="complain.CIsnm?'非匿名投诉':'匿名投诉'"/></td>
        </tr>
        <tr>
            <td class="tdBg">投诉人单位：</td>
            <td>
            <s:if test="complain.CIsnm">
            	<s:property value="complain.userByUId.dept.DName"/>
            </s:if>
            </td>
        </tr>
        <tr>
            <td class="tdBg">投诉人姓名：</td>
            <td>
            <s:if test="complain.CIsnm"><s:property value="complain.userByUId.UName"/></s:if></td>
        </tr>
        <tr>
            <td class="tdBg">投诉人手机：</td>
            <td>
            <s:if test="complain.CIsnm">
            <s:property value="complain.userByUId.UTel"/>
            </s:if><s:elseif test="%{complain.userByUId.UTel.length() > 10}">
            <s:property value="%{complain.userByUId.UTel.substring(0,3) + '****' + complain.userByUId.UTel.substring(7,11)}"/>
            </s:elseif>
            </td>
        </tr>
        <tr><td colspan="2" align="center">投诉信息</td></tr>
        <tr>
            <td class="tdBg">投诉时间：</td>
            <td>
            	<s:date name="complain.CTime" format="yyyy-MM-dd HH:mm:ss"/>
            </td>
        </tr>
        <tr>
            <td class="tdBg">被投诉部门：</td>
            <td><s:property value="complain.userByUedId.dept.DName"/></td>
        </tr>
        <tr>
            <td class="tdBg">被投诉人：</td>
            <td><s:property value="complain.userByUedId.UName"/></td>
        </tr>
        <tr>
            <td class="tdBg">投诉标题：</td>
            <td><s:property value="complain.CTitle"/></td>
        </tr>
        <tr>
            <td class="tdBg">投诉内容：</td>
            <td><s:property value="complain.CContent" escapeHtml="false"/></td>
        </tr>
        <tr><td colspan="2" align="center">受理信息</td></tr>
        <tr>
            <td colspan="2">
            	<s:iterator value="complainhandings" status="st">
            		<fieldset style="border: solid 1px #c0c0c0;margin-top:5px;"><legend style="color:green;font-weight:bold;">回复<s:property value="#st.count"/>&nbsp;</legend>
						<div style="width:100%; text-align:center;color:#ccc;maring-top:5px;">
						回复部门：<s:property value="user.dept.DName"/>&nbsp;&nbsp;
						回复人：<s:property value="user.UName"/>&nbsp;&nbsp;
						回复时间：<s:date name="chTime" format="yyyy-MM-dd HH:mm:ss"/>
						</div>
						<div style="width:100%;maring-top:10px;font-size:13px;padding-left:5px;">
						<s:property value="chContent"/>
						</div>
					</fieldset>
            	</s:iterator>
            </td>
        </tr>
        <tr><td colspan="2" align="center">受理操作</td></tr>
        <tr>
            <td class="tdBg">回复部门：</td>
            <td>
            <s:property value="#session.user.dept.DName"/>
            <s:hidden name="session.user.dept.DName" value="%{#session.user.dept.DName}"/>
            </td>
        </tr>
        <tr>
            <td class="tdBg">回复人：</td>
            <td>
            <s:property value="#session.user.UName"/>
            <s:hidden name="session.user.UName" value="%{#session.user.UName}"/>
            </td>
        </tr>

        <tr>
            <td class="tdBg" width="200px">回复内容：</td>
            <td><s:textarea name="chNewContent" cols="90" rows="8" /></td>
        </tr>
    </table>
    <s:hidden name="CId" value="%{complain.CId}"/>
 
    <div class="tc mt20">
        <input type="submit" class="btnB2" value="保存" />
        &nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button"  onclick="javascript:history.go(-1)" class="btnB2" value="返回" />
    </div>
    </div></div></div>
</form>
</body>
</html>