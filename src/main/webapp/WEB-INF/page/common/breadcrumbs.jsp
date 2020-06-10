<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div>
    <ol class="breadcrumb">
        <li><span class="glyphicon glyphicon-home"></span>&nbsp;<a href="<%=request.getContextPath()%>/" onclick="_hmt.push(['_trackEvent', 'navbar', 'click', 'navbar-首页'])">主页</a></li>
        <li class="active">${modeName }</li>
    </ol>
</div>