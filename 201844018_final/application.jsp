<%@page import="project_201844018.SubjectVO"%>
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
	ArrayList<SubjectVO> subList = (ArrayList<SubjectVO>)request.getAttribute("subList");
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
			alert("한 과목 이상 선택해주세요.");
			return false;
		}
	}
</script>
<div class="p-5 mb-4 bg-white rounded-10" style="text-align:center; height:580px;">
	<font style="margin-top:50px; font-size:30px; margin-left:400px; margin-bottom:30px;">✅&nbsp; 수강 신청</font>
	<div style="display:inline-block; margin-bottom:10px;">
		<select class="form-select border border-secondary" id="choiceDept" style="width:130px; margin-left:270px;" disabled="disabled">
					<option selected>${stuDept }</option>
		</select>
	</div>
	<form class="form-inline" name="frm" action="applicationInsert.jsp" method="post" onsubmit="return check()">
	<table class="table table-bordered" style="width:1000px; margin-left: auto; margin-right: auto; vertical-align:middle; margin-bottom:0;">
		<tr>
			<th style="background-color:#F2F2F2; width:7%;">강의코드</th>
			<th style="background-color:#F2F2F2; width:40%;">강의명</th>
			<th style="background-color:#F2F2F2; width:7%;">수강학년</th>
			<th style="background-color:#F2F2F2; width:15%;">수강학과</th>
			<th style="background-color:#F2F2F2; width:7%;">신청인원</th>
			<th style="background-color:#F2F2F2; width:4%;">정원</th>
			<th style="background-color:#F2F2F2; width:4%;">학점</th>
			<th style="background-color:#F2F2F2; width:4%;">선택</th>
		</tr>
	</table>
	<div style="margin-left:172px; width:1000px; height:370px; overflow:auto">
		<table class="table table-bordered" style="width:1000px; margin-left: auto; margin-right: auto; vertical-align:middle;">
		<c:forEach var="sub" items="${subList }" varStatus="status">
		<tr>
			<td style="width:7%;">${sub.getSub_no() }</td>
			<td style="width:40%;">${sub.getSub_name() }</td>
			<td style="width:7%;">${sub.getSub_grade() }</td>
			<td style="width:15%;">${sub.getSub_dept() }</td>
			<td style="width:7%;">${sub.getSub_proposer() }</td>
			<td style="width:4%;">${sub.getSub_personnel() }</td>
			<td style="width:4%;">${sub.getSub_score() }</td>
			<td style="width:4%;"><input type="checkbox" name="appSub" value="${sub.getSub_no()}"></td>
		</tr>
	</c:forEach>	
	</table>
	</div>
	<button type="submit" class="btn btn-outline-primary mb-2" style="margin-top:15px;">신청</button>
	</form>
	</div>
</body>
</html>