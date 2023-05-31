<%@page import="java.util.ArrayList"%>
<%@page import="project_201844018.DeptDAO"%>
<%@page import="project_201844018.DeptVO"%>
<%@page import="project_201844018.SubjectDAO"%>
<%@page import="project_201844018.SubjectVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	SubjectVO svo = new SubjectVO();
	SubjectDAO sdao = new SubjectDAO();
	
	String stuDept = (String)session.getAttribute("stuDept");
	ArrayList<SubjectVO> subject = sdao.getSubject(stuDept);
	if(subject != null && subject.size() != 0){
       	request.setAttribute("subList", subject);
	}
%>
<jsp:forward page="main.jsp?Page=subList.jsp"/>
</body>
</html>