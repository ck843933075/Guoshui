<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>查看信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    

  </head>
  
  <body>
    <div align="center " style="text-align: center; width: 100%;height: 100%;overflow: hidden">
    	<!-- 标题 -->
        <div style="text-align: center; width: 100%;">
        	<h1><s:property value="%{info.ITitle}"/></h1>
        </div>
        <hr/>
        <!-- 时间、作者 -->
        <div style="text-align: center; width: 100%;color:#ccc;font-size:12px;">
                                    信息分类：<s:property value="%{info.infoType.ITypeName}"/>&nbsp;&nbsp;&nbsp;&nbsp;
        	创建人：<s:property value="%{info.user.UName}"/>&nbsp;&nbsp;&nbsp;&nbsp;
        	创建时间：<s:date name="ICreateTime" format="yyyy-MM-dd HH:mm:ss" />	
        	<s:property value="%{info.ICreateTime}"/>
        </div>
        <div style="text-align: center; width: 100%;padding:8px;">
        	<s:property value="%{info.IContent}" escapeHtml="false"/>
        </div>
    </div>
    
  </body>
</html>
