<%@page import="data.Review"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Review</title>
</head>
<body>
<c:if test="${account.group ne 'Receptionist' && account.group ne 'Manager'}">
<%@ include file="head.jsp" %>
</c:if>
<c:if test="${account.group eq 'Receptionist'}">
<%@ include file="receptionist/rhead.jsp" %>
</c:if>
<c:if test="${account.group eq 'Manager'}">
<%@ include file="u-mhead.jsp" %>
</c:if>
<%
	String room_type = request.getParameter("room_type");
	ReviewDao dao = new ReviewDao();
	ArrayList<Review> list = dao.selectReviewsByType(room_type);
	request.setAttribute("reviewList", list);
%>
<div style="margin-top: 100px; margin-left: 150px; margin-right: 150px;">
	<h3><%=room_type%></h3>
	<c:if test = "${reviewList != null && !reviewList.isEmpty()}">
		<table class="table table-bordered table-hover" style="text-align:center">
		<thead>
		<tr>
			<td>评论</td>
			<td>评分</td>
			<td>评价日期</td>
		</tr>
		</thead>
		<c:forEach items="${reviewList}" var="item">  
		<tbody>
		  <tr>  
		    <td>${item.comment}</td>  
		    <td>${item.rate}</td>  
		    <td>${item.review_time}</td>  
		  </tr>  
		  </tbody>
		</c:forEach> 
		</table>
	</c:if>
</div>
</body>
</html>