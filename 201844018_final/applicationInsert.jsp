<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="project_201844018.SubjectDAO"%>
<%@page import="project_201844018.SubjectVO"%>
<%@page import="project_201844018.EnrolDAO"%>
<%@page import="project_201844018.EnrolVO"%>
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
	String[] list = request.getParameterValues("appSub");
	int stuNo = (int)session.getAttribute("stuId");
	
	EnrolVO vo = null;
	EnrolDAO dao = new EnrolDAO();
	SubjectDAO sdao = new SubjectDAO();
	
	ArrayList<String> errList = new ArrayList<>();
	for(int i = 0; i<list.length; i++){
		if(sdao.chkPer(list[i]) || dao.chkSub(list[i], stuNo)){
			errList.add(sdao.getSubName(list[i]));
			continue;
		}
		vo = new EnrolVO();
		vo.setSub_no(list[i]);
		vo.setStu_no(stuNo);
		if(dao.appInsert(vo) < 0){
			return;
		}else{
			sdao.proUpdate(list[i]);
		}
	}
	request.setAttribute("fail", errList);
%>
<jsp:forward page="appConfirmProc.jsp"/>
</body>
</html>