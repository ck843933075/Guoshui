<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/common/header.jsp"%>
    <title>角色管理</title>
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
  		document.forms[0].action = "${basePath}nsfw/role/addUI.action";
  		document.forms[0].submit();
  	}
  	//编辑
  	function doEdit(id){
  		document.forms[0].action = "${basePath}nsfw/role/editUI.action?RId=" + id;
  		document.forms[0].submit();
  	}
  	//删除
  	function doDelete(id){
  		document.forms[0].action = "${basePath}nsfw/role/delete.action?RId=" + id;
  		document.forms[0].submit();
  	}
  	//批量删除
  	function doDeleteAll(){
  		document.forms[0].action = "${basePath}nsfw/role/deleteSelected.action";
  		document.forms[0].submit();
  	}
  	var list_url = "${basePath}nsfw/role/listUI.action";
	//搜索
  	function doSearch(){
  		//重置页号
  		$("#page").val(1);
  		document.forms[0].action = "${basePath}nsfw/role/search.action";
  		document.forms[0].submit();
  	}
    </script>
</head>
<body class="rightBody">
<form name="form1" action="" method="post">
    <div class="p_d_1">
        <div class="p_d_1_1">
            <div class="content_info">
                <div class="c_crumbs"><div><b></b><strong>角色管理 </strong></div> </div>
                <div class="search_art">
                    <li>
                        角色名称：<s:textfield name="RName" cssClass="s_text" id="roleName"  cssStyle="width:160px;"/>
                    </li>
                    <li><input type="button" class="s_button" value="搜 索" onclick="doSearch()"/></li>
                    <li style="float:right;">
                        <input type="button" value="新增" class="s_button" onclick="doAdd()"/>&nbsp;
                        <input type="button" value="删除" class="s_button" onclick="doDeleteAll()"/>&nbsp;
                    </li>
                </div>

                <div class="t_list" style="margin:0px; border:0px none;">
                    <table width="100%" border="0">
                        <tr class="t_tit">
                            <td width="30" align="center"><input type="checkbox" id="selAll" onclick="doSelectAll()" /></td>
                            <td width="120" align="center">角色名称</td>
                            <td align="center">权限</td>
                            <td width="80" align="center">状态</td>
                            <td width="120" align="center">操作</td>
                        </tr>
                       		<s:iterator value="roles" status="st">
                            <tr <s:if test="#st.odd">bgcolor="f8f8f8"</s:if> >
                                <td align="center"><input type="checkbox" name="selectedRow" value="<s:property value='RId'/>"/></td>
                                <td align="center"><s:property value="RName"/></td>
                                <td align="center">
                                	<s:iterator value="%{privileges}">
                                		<s:property value="PName"/>
                                	</s:iterator>	
                                </td>
                                <td align="center"><s:property value="RStatus==1?'有效':'无效'"/></td>
                                <td align="center">
                                    <a href="javascript:doEdit('<s:property value='RId'/>')">编辑</a>
                                    <a href="javascript:doDelete('<s:property value='RId'/>')">删除</a>
                                </td>
                            </tr>
                           </s:iterator>
                    </table>
                </div>
            </div>
			<%-- <jsp:include page="/common/pageNavigator.jsp"/> --%>
			总共:${tiao }&nbsp;条记录,
       总页数：${countPage } &nbsp;,当前第${page }页,
       <a href="${basePath}nsfw/role/listUI.action?page=1">首页</a>
       <s:if test="%{page==1 }">上一页</s:if>
       <s:if test="%{page>1 }">
       <a href="${basePath}nsfw/role/listUI.action?page=${page-1}">上一页</a>
       </s:if>
       <s:if test="%{page==countPage}">下一页</s:if>
       <s:if test="%{page<countPage }">
       <a href="${basePath}nsfw/role/listUI.action?page=${page+1}">下一页</a>
       </s:if>
        
        <a href="${basePath}nsfw/role/listUI.action?page=${countPage}">尾页</a>
        </div>
    </div>
</form>

</body>
</html>