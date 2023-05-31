<%@page import="project_201844018.SubjectVO"%>
<%@page import="project_201844018.EnrolVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	ArrayList<SubjectVO> appList = (ArrayList<SubjectVO>)request.getAttribute("appList");
	ArrayList<String> errList = (ArrayList<String>)request.getAttribute("fail");
	boolean result = true;
	if(errList == null || errList.size() == 0){
		result = false;
	}
%>
<script>
	window.onload = function(){
			if(<%=result%>){
				var subList = "";
				<c:forEach var="err" items="${fail }">
					subList += "${err}";
					subList += " ";
				</c:forEach>
				alert(subList + '외의 과목이 신청완료됐습니다. \n(' + subList + '과목은 정원초과 또는 중복선택 입니다)');
			}
		
		var scoreHTML = document.getElementsByClassName("score");
		var scores = [];
		
		for(var i=0; i< scoreHTML.length; i++){
			scores.push(Number(scoreHTML[i].innerText));
		}
		document.getElementById("totalScore").innerText = scores.reduce(function add(x, y){return x+y;});
		
		document.getElementById("listCnt").innerText = document.getElementsByName("list").length;
	}
</script>
<div class="p-5 mb-4 bg-white rounded-10" style="text-align:center; height:580px;">
	<font style="margin-top:50px; font-size:30px; margin-left:280px; margin-bottom:30px;">📋️ 신청수강목록</font>
	<div style="display:inline-block; margin-bottom:10px;">
		<input type="text" readonly class="form-control-plaintext" value="학번 : ${stuId }    이름 : ${name}" style="margin-left:90px;">
		
	</div>
	<form class="form-inline">
	<table class="table table-bordered" style="width:800px; margin-left: auto; margin-right: auto; vertical-align:middle; margin-bottom:0;">
		<tr>
			<th style="background-color:#F2F2F2; width:10%;">강의코드</th>
			<th style="background-color:#F2F2F2; width:50%;">강의명</th>
			<th style="background-color:#F2F2F2; width:10%;">수강학년</th>
			<th style="background-color:#F2F2F2; width:10%;">학점</th>
		</tr>
		</table>
		<div style="width:800px; height:370px; overflow:auto; margin-left:272px;">
		<table class="table table-bordered" style="width:800px; margin-left: auto; margin-right: auto; vertical-align:middle;">
		<c:forEach var="app" items="${appList }">
		<tr name="list">
			<td style="width:10%;">${app.getSub_no() }</td>
			<td style="width:50%;">${app.getSub_name() }</td>
			<td style="width:10%;">${app.getSub_grade() }</td>
			<td class="score" style="width:10%;">${app.getSub_score() }</td>
		</tr>
	</c:forEach>
	<tr>
		<td colspan="4" style="text-align:right;">총 신청과목 : <span id="listCnt"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;총 신청학점 : <span id="totalScore"></span></td>
	</tr>
	</table>
	</div>
	<button type="button" class="btn btn-outline-success mb-2" style="margin-top:15px;" onclick="location.href='main.jsp'">돌아가기</button>
	</form>
	</div>
</body>
</html>