<%@page import="project_201844018.SubjectVO"%>
<%@page import="project_201844018.EnrolDAO"%>
<%@page import="project_201844018.EnrolVO"%>
<%@page import="java.util.ArrayList"%>
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
	ArrayList<String> errList = (ArrayList<String>)request.getAttribute("fail");
	request.setAttribute("fail", errList);
	EnrolVO evo = new EnrolVO();
	EnrolDAO edao = new EnrolDAO();
	
	int stuNo = (int)session.getAttribute("stuId");
	ArrayList<SubjectVO> appList = edao.getAppList(stuNo);
	if(appList != null && appList.size() != 0){
       	request.setAttribute("appList", appList);
	}
%>
<jsp:forward page="main.jsp?Page=appConfirm.jsp"/>
</body>
</html>