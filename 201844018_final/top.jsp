<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.dropdown:hover .dropdown-menu{
	display: block;
	margin-top: 0;
}
</style>
</head>
<body>
<nav class="navbar navbar-expand-lg rounded" aria-label="Eleventh navbar example">
      <div class="container-fluid" style="background-color: #F2F2F2;">
        <a class="navbar-brand" href="main.jsp">HOME</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample09" aria-controls="navbarsExample09" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarsExample09">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
             <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-expanded="false">신청메뉴</a>
              <ul class="dropdown-menu" style="min-width:120px; widht:120px;">
              <c:if test="${name != null }">
                <li><a class="dropdown-item" href="?Page=applicationProc.jsp">수강신청</a></li>
                <li><a class="dropdown-item" href="?Page=appUpdateProc.jsp">수강신청 정정</a></li>
                <li><a class="dropdown-item" href="?Page=subListProc.jsp">개설강의 목록</a></li>
               </c:if>
               <c:if test="${name == null }">
                <li><a class="dropdown-item" href="login.jsp" onclick="javascript:alert('로그인을 해주세요.')">수강신청</a></li>
                <li><a class="dropdown-item" href="login.jsp" onclick="javascript:alert('로그인을 해주세요.')">수강신청 정정</a></li>
                <li><a class="dropdown-item" href="login.jsp" onclick="javascript:alert('로그인을 해주세요.')">개설강의 목록</a></li>
               </c:if>
              </ul>
            </li>
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-expanded="false">마이페이지</a>
              <ul class="dropdown-menu" style="min-width:120px; widht:120px;">
              <c:if test="${name != null }">
              	<li><a class="dropdown-item" href="?Page=memInfo.jsp">마이페이지</a></li>
                <li><a class="dropdown-item" href="?Page=memInfoUpdate.jsp">개인정보 변경</a></li>
                <li><a class="dropdown-item" href="?Page=appConfirmProc.jsp">수강신청 확인</a></li>
              </c:if>
              <c:if test="${name == null }">
                <li><a class="dropdown-item" href="login.jsp" onclick="javascript:alert('로그인을 해주세요.')">마이페이지</a></li>
                <li><a class="dropdown-item" href="login.jsp" onclick="javascript:alert('로그인을 해주세요.')">개인정보 변경</a></li>
                <li><a class="dropdown-item" href="login.jsp" onclick="javascript:alert('로그인을 해주세요.')">수강신청 확인</a></li>
              </c:if>
              </ul>
            </li>
          </ul>
        </div>
      </div>
    </nav>
</body>
</html>