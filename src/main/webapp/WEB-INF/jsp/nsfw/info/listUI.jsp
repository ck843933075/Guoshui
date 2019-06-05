<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/common/header.jsp"%>
    <title>信息发布管理</title>
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
  		document.forms[0].action = "${basePath}nsfw/info/addUI.action";
  		document.forms[0].submit();
  	}
  	//编辑
  	function doEdit(id){
  		document.forms[0].action = "${basePath}nsfw/info/editUI.action?infoId=" + id;
  		document.forms[0].submit();
  	}
  	//删除
  	function doDelete(id){
  		document.forms[0].action = "${basePath}nsfw/info/deleteUI.action?infoId=" + id;
  		document.forms[0].submit();
  	}
  	//批量删除
  	function doDeleteAll(){
  		document.forms[0].action = "${basePath}nsfw/info/deleteSelected.action";
  		document.forms[0].submit();
  	}
  	//异步发布信息,信息的id及将要改成的信息状态
  	function doPublic(infoId, IStatus){
  		//1、更新信息状态
  		$.ajax({
  			url:"${basePath}nsfw/info/publicInfo.action",
  			data:{"infoId":infoId, "IStatus":IStatus},
  			type:"post",
  			success: function(msg){
  				//2、更新状态栏、操作栏的显示值
  				if("yes" == msg){
  					if(IStatus == 1){//说明信息状态已经被改成 发布，状态栏显示 发布，操作栏显示 停用
  						$("#show_"+infoId).html("发布");
  						$("#oper_"+infoId).html('<a href="javascript:doPublic(\''+infoId+'\',0)">停用</a>');
  					} else {
  						$("#show_"+infoId).html("停用");
  						$("#oper_"+infoId).html('<a href="javascript:doPublic(\''+infoId+'\',1)">发布</a>');
  					}
  				} else {alert("更新信息状态失败！");}
  			},
  			error: function(){
  				alert("更新信息状态失败！");
  			}
  		});
  	}
  	var list_url = "${basePath}nsfw/info/listUI.action";
  	//搜索
  	function doSearch(){
  		//重置页号
  		$("#page").val(1);
  		document.forms[0].action = "${basePath}nsfw/info/search.action";
  		document.forms[0].submit();
  	}
    </script>
</head>
<body class="rightBody">
<form name="form1" action="" method="post">
    <div class="p_d_1">
        <div class="p_d_1_1">
            <div class="content_info">
                <div class="c_crumbs"><div><b></b><strong>信息发布管理</strong></div> </div>
                <div class="search_art">
                    <li>
                        信息标题：<s:textfield name="ITitle" cssClass="s_text" id="infoTitle"  cssStyle="width:160px;"/>
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
                            <td align="center">信息标题</td>
                            <td width="120" align="center">信息分类</td>
                            <td width="120" align="center">创建人</td>
                            <td width="140" align="center">创建时间</td>
                            <td width="80" align="center">状态</td>
                            <td width="120" align="center">操作</td>
                        </tr>
                        <s:iterator value="infos" status="st">
                            <tr <s:if test="#st.odd"> bgcolor="f8f8f8" </s:if> >
                                <td align="center"><input type="checkbox" name="selectedRow" value="<s:property value='infoId'/>"/></td>
                                <td align="center"><s:property value="ITitle"/></td>
                                <td align="center">
                                	<s:property value="infotype.ITypeName"/>	
                                </td>
                                <td align="center"><s:property value="user.UName"/></td>
                                <td align="center"><s:date name="ICreateTime" format="yyyy-MM-dd HH:mm:ss"/></td>
                                <td id="show_<s:property value='infoId'/>" align="center"><s:property value="IStatus==1?'发布':'停用'"/></td>
                                <td align="center">
                                	<span  id="oper_<s:property value='infoId'/>">
                                	<s:if test="IStatus==1">
                                		<a href="javascript:doPublic('<s:property value='infoId'/>',0)">停用</a>
                                	</s:if><s:else>
                                		<a href="javascript:doPublic('<s:property value='infoId'/>',1)">发布</a>
                                	</s:else>
                                	</span>
                                    <a href="javascript:doEdit('<s:property value='infoId'/>')">编辑</a>
                                    <a href="javascript:doDelete('<s:property value='infoId'/>')">删除</a>
                                </td>
                            </tr>
                        </s:iterator>
                    </table>
                </div>
            </div>
        	<%-- <jsp:include page="/common/pageNavigator.jsp"/> --%>
        	总共:${tiao }&nbsp;条记录,
       总页数：${countPage } &nbsp;,当前第${page }页,
       <a href="${basePath}nsfw/info/listUI.action?page=1">首页</a>
       <s:if test="%{page==1 }">上一页</s:if>
       <s:if test="%{page>1 }">
       <a href="${basePath}nsfw/info/listUI.action?page=${page-1}">上一页</a>
       </s:if>
       <s:if test="%{page==countPage}">下一页</s:if>
       <s:if test="%{page<countPage }">
       <a href="${basePath}nsfw/info/listUI.action?page=${page+1}">下一页</a>
       </s:if>
        
        <a href="${basePath}nsfw/info/listUI.action?page=${countPage}">尾页</a>
        </div>
    </div>
</form>

</body>
</html>