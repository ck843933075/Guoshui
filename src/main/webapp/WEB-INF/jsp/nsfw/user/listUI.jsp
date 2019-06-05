<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>用户管理</title>
    <%@include file="/common/header.jsp" %>
    <script type="text/javascript">
      	//全选、全反选
		function doSelectAll(){
			// jquery 1.6 前
			//$("input[name=selectedRow]").attr("checked", $("#selAll").is(":checked"));
			//prop jquery 1.6+建议使用
			$("input[name=selectedRow]").prop("checked", $("#selAll").is(":checked"));		
		}
      	//新增
      	function doAdd(){
      		document.forms[0].action = "${basePath}nsfw/user/user_addUI.action";
      		document.forms[0].submit();
      	}
      	//编辑
      	function doEdit(UId){
      		document.forms[0].action = "${basePath}nsfw/user/user_editUI.action?UId=" + UId;
      		document.forms[0].submit();
      	}
      	//删除
      	function doDelete(UId){
      		document.forms[0].action = "${basePath}nsfw/user/user_delete.action?UId=" + UId;
      		document.forms[0].submit();
      	}
      	//批量删除
      	function doDeleteAll(){
      		document.forms[0].action = "${basePath}nsfw/user/user_deleteSelected.action";
      		document.forms[0].submit();
      	}
      	//导出用户列表
      	function doExportExcel(){
      		var page=document.getElementById("page").value;
      		window.open("${basePath}nsfw/user/export.action?page="+page);
      	}
      	//导入
      	function doImportExcel(){
      		document.forms[0].action = "${basePath}nsfw/user/importExcel.action";
      		document.forms[0].submit();
      	}
      	var list_url = "${basePath}nsfw/user/user_listUI.action";
    	//搜索
      	function doSearch(){
      		//重置页号
      		$("#page").val(1);
      		document.forms[0].action = "${basePath}nsfw/user/user_findByName.action";
      		document.forms[0].submit();
      	}
    </script>
</head>
<body class="rightBody">
<form name="form1" action="" method="post" enctype="multipart/form-data">
    <div class="p_d_1">
        <div class="p_d_1_1">
            <div class="content_info">
                <div class="c_crumbs"><div><b></b><strong>用户管理</strong></div> </div>
                <div class="search_art">
                    <li>
                        用户名：<s:textfield name="UName" cssClass="s_text" id="UName"  cssStyle="width:160px;"/>
                    </li>
                    <li><input type="button" class="s_button" value="搜 索" onclick="doSearch()"/></li>
                    <li style="float:right;">
                        <input type="button" value="新增" class="s_button" onclick="doAdd()"/>&nbsp;
                        <input type="button" value="删除" class="s_button" onclick="doDeleteAll()"/>&nbsp;
                        <input type="button" value="导出" class="s_button" onclick="doExportExcel()"/>&nbsp;
                    	<input name="file" type="file"/>
                        <input type="button" value="导入" class="s_button" onclick="doImportExcel()"/>&nbsp;

                    </li>
                </div>

                <div class="t_list" style="margin:0px; border:0px none;">
                    <table width="100%" border="0">
                        <tr class="t_tit">
                            <td width="30" align="center"><input type="checkbox" id="selAll" onclick="doSelectAll()" /></td>
                            <td width="140" align="center">用户名</td>
                            <td width="140" align="center">帐号</td>
                            <td width="160" align="center">所属部门</td>
                            <td width="80" align="center">性别</td>
                            <td align="center">电子邮箱</td>
                            <td width="100" align="center">操作</td>
                        </tr>
                        <s:iterator value="users" status="st">
                            <tr <s:if test="#st.odd">bgcolor="f8f8f8"</s:if> >
                                <td align="center"><input type="checkbox" name="selectedRow" value="<s:property value='UId'/>" /></td>
                                <td align="center"><s:property value="UName"/></td>
                                <td align="center"><s:property value="UUsername"/></td>
                                <td align="center"><s:property value="dept.DName"/></td>
                                <td align="center"><s:property value="USex"/></td>
                                <td align="center"><s:property value="UMail"/></td>
                                <td align="center">
                                    <a href="javascript:doEdit('<s:property value='UId'/>')">编辑</a>
                                    <a href="javascript:doDelete('<s:property value='UId'/>')">删除</a>
                                </td>
                            </tr>
                        </s:iterator>
                    </table>
                </div>
            </div>
            <!-- 向上面传值  , 向导出用户列表传-->
            <s:hidden value="%{page}" id="page"></s:hidden>
        <%-- <jsp:include page="/common/pageNavigator.jsp"/> --%>
        
        总共:${tiao }&nbsp;条,
       总页数：${countPage } &nbsp;,当前第${page }页,
       <a href="${basePath}nsfw/user/user_listUI.action?page=1">首页</a>
       <s:if test="%{page==1 }">上一页</s:if>
       <s:if test="%{page>1 }">
       <a href="${basePath}nsfw/user/user_listUI.action?page=${page-1}">上一页</a>
       </s:if>
       <s:if test="%{page==countPage}">下一页</s:if>
       <s:if test="%{page<countPage }">
       <a href="${basePath}nsfw/user/user_listUI.action?page=${page+1}">下一页</a>
       </s:if>
        
        <a href="${basePath}nsfw/user/user_listUI.action?page=${countPage}">尾页</a>
        </div>
    </div>
</form>

</body>
</html>