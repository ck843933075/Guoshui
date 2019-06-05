<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/common/header.jsp"%>
    <title>信息发布管理</title>
    <script type="text/javascript" charset="utf-8" src="${basePath }js/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${basePath }js/ueditor/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="${basePath }js/ueditor/lang/zh-cn/zh-cn.js"></script>

    <script>
   		window.UEDITOR_HOME_URL = "${basePath }js/ueditor/";
    	var ue = UE.getEditor('editor');
    </script>

</head>
<body class="rightBody">
<form id="form" name="form" action="${basePath}nsfw/info/edit.action" method="post" enctype="multipart/form-data">
    <div class="p_d_1">
        <div class="p_d_1_1">
            <div class="content_info">
    <div class="c_crumbs"><div><b></b><strong>信息发布管理</strong>&nbsp;-&nbsp;修改信息</div></div>
    <div class="tableH2">修改信息</div>
    <table id="baseInfo" width="100%" align="center" class="list" border="0" cellpadding="0" cellspacing="0"  >
        <tr>
            <td class="tdBg" width="200px">信息分类：</td>
            <td>
			<select name="infotype.ITypeId">
				<s:iterator value="%{infotypes}">
					<option value="${ITypeId}" ${ITypeId==info.infotype.ITypeId?"selected":"" }>${ITypeName}</option>
				</s:iterator>
			</select>
			</td>
            <td class="tdBg" width="200px">来源：</td>
            <td><s:textfield name="ISource" value="%{info.ISource}"/></td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">信息标题：</td>
            <td colspan="3"><s:textfield name="ITitle" cssStyle="width:90%" value="%{info.ITitle}"/></td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">信息内容：</td>
            <td colspan="3"><s:textarea id="editor" name="IContent" cssStyle="width:90%;height:160px;" value="%{info.IContent}"/></td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">备注：</td>
            <td colspan="3"><s:textarea name="IRemark" value="%{info.IRemark}" cols="90" rows="3"/></td>
        </tr>
        <tr>
            <td class="tdBg" width="200px">创建人：</td>
            <td>
                <s:property value="info.user.UName"/>
            	<input type="hidden" name="user.UId" value="${user.UId}"/>
            </td>
            <td class="tdBg" width="200px">创建时间：</td>
            <td>
            	<s:date name="info.createTime" format="yyyy-MM-dd HH:mm:ss"/>
            	<s:property value="%{info.ICreateTime}"/>
             	<%-- <s:hidden name="ICreateTime" value="%{info.createTime}"/> --%>
            </td>
        </tr>
    </table>
    <!-- 暂存查询条件值 -->
    <%-- <s:hidden name="strTitle"/>
    <s:hidden name="page"/> --%>
    <s:hidden name="infoId" value="%{info.infoId}"/>
    <s:hidden name="IStatus" value="%{info.IStatus}"/>
    <div class="tc mt20">
        <input type="submit" class="btnB2" value="保存" />
        &nbsp;&nbsp;&nbsp;&nbsp;
        <input type="button"  onclick="javascript:history.go(-1)" class="btnB2" value="返回" />
    </div>
    </div></div></div>
</form>
</body>
</html>