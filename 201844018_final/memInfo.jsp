<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="p-5 mb-4 bg-white rounded-10" style="text-align:center; height:580px;">
	<h4 style="margin-top:100px; margin-bottom:20px;">ℹ&nbsp; 내 정보</h4>
	<form class="form-inline" action="main.jsp">
	<table class="table table-bordered" style="width:400px; margin-left: auto; margin-right: auto; vertical-align:middle;">
		<tr>
			<th style="background-color:#F2F2F2">학번</th>
			<td>${stuId }</td>
		</tr>
		<tr>
			<th style="background-color:#F2F2F2">이름</th>
			<td>${name }</td>
		</tr>
		<tr>
			<th style="background-color:#F2F2F2">전화번호</th>
			<td>${stuHp }</td>
		</tr>
		<tr>
			<th style="background-color:#F2F2F2">학과</th>
			<td>${stuDept }</td>
		</tr>
	  </table>
	  <button type="button" class="btn btn-outline-success mb-2" onclick="location.href='?Page=memInfoUpdate.jsp'">정보변경</button>
	  &nbsp;&nbsp;&nbsp;<button type="submit" class="btn btn-outline-primary mb-2">확인</button>
	</form>
	</div>
</body>
</html>