<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>수강신청 사이트</title>
</head>
<body style="background-color: #F2F2F2;">

<% String connPage = request.getParameter("Page");
	if(connPage == null){
		connPage="info.jsp";
		}
%>

	<table width="100%" cellpadding="0" cellspacing="0">
		<tr>
			<td colspan="2">
				<jsp:include page="top.jsp"/>
			</td>
		</tr>
		<tr>
			<td colspan="2" valign="top">
				<jsp:include page="<%=connPage %>"/>
			</td>
		</tr>
	</table>
	<c:if test="${name == null }">
		<h6 align="center" style="color:gray;">로그인을 해주세요.</h6>
	</c:if>
	<c:if test="${name != null }">
		<h6 align="center" style="color:gray;">${name }님 환영합니다! &nbsp;&nbsp;<a href="logout.jsp">로그아웃</a></h6>
	</c:if>
</body>
</html>