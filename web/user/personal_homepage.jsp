<%@ page import="data.*" %>
<%@ page import="dao.*" %>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>${account.name} Homepage</title>
</head>
<body>
<%@ include file="../head.jsp" %>
<form action="" method="post">
<div style="margin-top: 60px; margin-left: 150px; margin-right: 150px;">
<%
	Account account = (Account) session.getAttribute("account");
	OrderDao dao = new OrderDao();
	ArrayList<Order> orderList = dao.displayMyOwnOrder(account.getId());
	request.setAttribute("orderList", orderList);
	ReviewDao rdao = new ReviewDao();
	ArrayList<Boolean> reviewList = new ArrayList<Boolean>();
	for (int i = 0; i < orderList.size(); i++){
		Order o = orderList.get(i);
		if (o.getOrder_type().equals("F")){
			ArrayList<Review> tmp = rdao.selectReviewsByRequirement(o.getId(), o.getAccount_id(), o.getRoom_type());
			if (tmp.size() > 0){
				reviewList.add(i, true);
			}else{
				reviewList.add(i, false);
			}
		}else{
			reviewList.add(i, false);
		}
	}
	request.setAttribute("reviewList", reviewList);
%>
	<c:if test="${orderList ne null}">
		<h3>所有订单</h3><br/>
		<table class="table table-bordered" style="text-align:center">
			<thead>
				<tr>
					<td>订单号</td>
					<td>身份证号</td>
					<td>房间号</td>
					<td>房间类型</td>
					<td>入住时间</td>
					<td>离店时间</td>
					<td>金额</td>
					<td>评论</td>
				</tr>
			</thead>
			<c:forEach items="${orderList}" var="item" varStatus="status">  
			<tbody>
				  <tr>  
				    <td>${item.id}</td>  
				    <td>${item.account_id}</td>  
				    <td>${item.room_id}</td>
				    <td>${item.room_type}</td>
				    <td>${item.checkin}</td>  
				    <td>${item.checkout}</td>  
				    <td>￥${item.price}</td>
				    <td>
				    <c:if test = "${item.order_type eq 'F'}">
				   		<c:if test = "${reviewList[status.index] eq false}">
				    	<button name="btn" class="btn btn-default" style="height: 20px; padding-top: 0px;" onclick="this.form.action='review.jsp?oid=${item.id}&acc_id=${item.account_id}&type=${item.room_type}';this.form.submit()">评论</button>
				    	</c:if>
				    	<c:if test = "${reviewList[status.index] eq true}">
				    	<button name="btn" class="btn btn-default" style="height: 20px; padding-top: 0px;" onclick="this.form.action='../show_review.jsp?room_type=${item.room_type}';this.form.submit()">查看评论</button>
				    	</c:if>
				    </c:if> 
				    </td>
				  </tr>  
			</tbody>
			</c:forEach>  
		</table>
	</c:if>
</div>
</form>
</body>
</html>