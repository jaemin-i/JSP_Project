<%@page import="java.util.Date"%>
<%@page import="project_201844018.StudentVO"%>
<%@page import="project_201844018.StudentDAO"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	StudentVO vo = new StudentVO();
	StudentDAO dao = new StudentDAO();
	int inputId = Integer.parseInt(request.getParameter("stuId"));
	String inputPw = request.getParameter("stuPassword");
	vo.setStu_no(inputId);
	vo.setStu_pw(inputPw);
	vo = dao.login(vo);
	if(vo != null){
		session.setAttribute("name", vo.getStu_name());
		session.setAttribute("stuId", vo.getStu_no());
		session.setAttribute("stuPw", vo.getStu_pw());
		session.setAttribute("stuHp", vo.getStu_hp());
		session.setAttribute("stuDept", vo.getStu_dept());
		session.setAttribute("stuPwChk", 1);
		response.sendRedirect("main.jsp");
	}
	
%>
<script>
	alert('로그인에 실패했습니다.');
	location.href = 'login.jsp';
</script>
</body>
</html>