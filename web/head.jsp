<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation"> 
<div class="container-fluid"> 
    <div class="navbar-header" style="margin-top:-14px"> 
        <a class="navbar-brand" href="/HotelManagementSystem/web/main.jsp"><img src="/HotelManagementSystem/img/logo-S.png"/></a> 
    </div> 
    <div>
    <form class="navbar-form navbar-right">
	<c:if test = "${account.id eq null}">
		<div class="btn-group">
			<button type="button" class="btn btn-default btn-sm" onclick="window.location.href='/HotelManagementSystem/web/login.jsp'">
				<span class="glyphicon glyphicon-log-in"></span> 登录
			</button>
			<button type="button" class="btn btn-default btn-sm" onclick="window.location.href='/HotelManagementSystem/web/register.jsp'">
				<span class="glyphicon glyphicon-user"></span> 注册
			</button>
		</div>
	</c:if>

	<c:if test = "${account.id ne null}">
		<div id="head" class="btn-group">
			<button type="button" class="btn btn-default btn-sm" onclick="window.location.href='/HotelManagementSystem/web/user/personal_homepage.jsp'">
		  		<span class="glyphicon glyphicon-user"></span> ${account.name}
			</button>
			<button type="button" class="btn btn-warning btn-sm" onclick="window.location.href='/HotelManagementSystem/web/login.jsp?logout=true'">
				注销
			</button>
		</div>
	</c:if>
	</form>
    </div>
</div>
</nav>