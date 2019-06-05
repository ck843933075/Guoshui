<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<div class="c_pate" style="margin-top: 5px;">
	<s:if test="tiao > 0">
		<table width="100%" class="pageDown" border="0" cellspacing="0"
			cellpadding="0">
			<tr>
				<td align="right">总共 <s:property value="tiao" /> 条记录，当前第 <s:property
						value="page" /> 页, 共 <s:property value="countPage" /> 页 ， <a
					href="javascript:doGoPage(<s:property value="page=1"/>)">首页,</a> <%-- <a href="${basePath}nsfw/user/user_listUI.action?page=1">首页，</a> --%>
					<s:if test="page>1 ">
						<a href="javascript:doGoPage(<s:property value="page-1"/>)">上一页,</a>
						<%--     <a href="${basePath}nsfw/user/user_listUI.action?page=${page-1}">上一页,</a> --%>
					</s:if> <s:if test="page==countPage">下一页</s:if> <s:if
						test="page<countPage">
						<a href="javascript:doGoPage(<s:property value="page+1"/>)">下一页,</a>
						<%-- <a href="${basePath }nsfw/user/user_listUI.action?page=${page+1}">下一页,</a> --%>
					</s:if> <%-- <a href="${basePath}nsfw/user/user_listUI.action?page=${countPage}">尾页,</a> --%>
					<a href="javascript:doGoPage(<s:property value="countPage"/>)">尾页,</a>
					&nbsp;&nbsp; 到&nbsp;第<input id="page" name="page" type="text"
					style="width: 30px;"
					onkeypress="if(event.keyCode == 13){doGoPage(this.value);}" min="1"
					max="3" value="<s:property value='page'/>" />页 &nbsp;&nbsp;

				</td>
			</tr>
		</table>
	</s:if>
	<s:else>暂无数据！</s:else>
</div>
<script type="text/javascript">
	//翻页
	function doGoPage(page) {
		document.getElementById("page").value = page;
		document.forms[0].action = list_url;
		document.forms[0].submit();
	}

	
</script>