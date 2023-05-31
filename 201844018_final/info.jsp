<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.bgbg{
	background: linear-gradient(-45deg, #0080FF 50%, #ffffff 50%);
}
</style>
</head>
<body>
<div class="bgbg p-5 mb-4 bg-white rounded-10">
      <div class="container-fluid py-5" style="height:480px; margin-left:50px;">
      <br><br>
        <h1 class="display-5 fw-bold">수강신청 공지사항</h1>
        <p class="col-md-8 fs-3"><br>신청기간 : 2023. 2. 6(월) ~ 8(수)
        						 <br>정정기간 : 2023. 2. 9(목) ~ 10(금)</p>
        <c:if test="${name == null }">
			<button class="btn btn-primary btn-lg" type="button" onclick="location.href='login.jsp'">로그인</button>
		</c:if>
		<c:if test="${name != null }">
			<button class="btn btn-primary btn-lg" type="button" onclick="location.href='applicationProc.jsp'">수강신청</button>
		</c:if>
      </div>
    </div>
</body>
</html>