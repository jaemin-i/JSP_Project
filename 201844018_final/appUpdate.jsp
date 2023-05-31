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
%>
<script type="text/javascript">
	function check(){
		var check = false;
		var checkBoxList = document.getElementsByName("appSub");
		for(var i=0; i<checkBoxList.length; i++){
			if(checkBoxList[i].checked){
				check = true;
			}
		}
		if(!check){
			alert("선택된 과목이 없습니다.");
			return false;
		}
	}
</script>

<div class="p-5 mb-4 bg-white rounded-10" style="text-align:center; height:580px;">
	<font style="margin-top:50px; font-size:30px; margin-left:280px; margin-bottom:30px;">❎️&nbsp; 신청 정정</font>
	<div style="display:inline-block; margin-bottom:10px;">
		<input type="text" readonly class="form-control-plaintext" value="학번 : ${stuId }    이름 : ${name}" style="margin-left:90px;">
		
	</div>
	<form class="form-inline" action="appUpdateDelete.jsp" name="frm" method="post" onsubmit="return check()">
	<table class="table table-bordered" style="width:800px; margin-left: auto; margin-right: auto; vertical-align:middle; margin-bottom:0;">
		<tr>
			<th style="background-color:#F2F2F2; width:10%;">강의코드</th>
			<th style="background-color:#F2F2F2; width:50%;">강의명</th>
			<th style="background-color:#F2F2F2; width:10%;">수강학년</th>
			<th style="background-color:#F2F2F2; width:10%;">학점</th>
			<th style="background-color:#F2F2F2; width:10%;">선택</th>
		</tr>
		</table>
		<div style="width:800px; height:370px; overflow:auto; margin-left:272px;">
		<table class="table table-bordered" style="width:800px; margin-left: auto; margin-right: auto; vertical-align:middle;">
		<c:forEach var="app" items="${appList }">
		<tr>
			<td style="width:10%;">${app.getSub_no() }</td>
			<td style="width:50%;">${app.getSub_name() }</td>
			<td style="width:10%;">${app.getSub_grade() }</td>
			<td style="width:10%;">${app.getSub_score() }</td>
			<td style="width:10%;"><input type="checkbox" name="appSub" value="${app.getSub_no()}"></td>
		</tr>
	</c:forEach>
	</table>
	&nbsp;&nbsp;&nbsp;<button type="submit" class="btn btn-outline-danger mb-2" style="margin-top:15px;">수정</button>
	</div>
	</form>
	</div>
</body>
</html>