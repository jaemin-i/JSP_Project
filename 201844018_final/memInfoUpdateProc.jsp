<%@page import="org.apache.catalina.ant.JKStatusUpdateTask"%>
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
	request.setCharacterEncoding("utf-8");
	StudentVO vo = new StudentVO();
	StudentDAO dao = new StudentDAO();
	
	String updatePw = request.getParameter("updatePw");
	String updateName = request.getParameter("updateName");
	String updateHp = request.getParameter("updateHp");
	String updateDept = request.getParameter("updateDept");
	
	vo.setStu_no(Integer.parseInt(request.getParameter("stuNo")));
	vo.setStu_pw(updatePw);
	if(updatePw.isEmpty()){
		String stuPw = (String)session.getAttribute("stuPw");
		vo.setStu_pw(stuPw);
	}
	vo.setStu_name(updateName);
	vo.setStu_hp(updateHp);
	vo.setStu_dept(updateDept);
	
	
	int result = dao.updateMemInfo(vo);
	if(result >= 1){
		session.setAttribute("stuPw", vo.getStu_pw());
		session.setAttribute("name", vo.getStu_name());
		session.setAttribute("stuHp", vo.getStu_hp());
		session.setAttribute("stuDept", vo.getStu_dept());
	}
%>
<script>
	if(<%=result %>>=1){
		alert("내 정보 수정이 완료되었습니다.");
		location.href = "main.jsp?Page=memInfoUpdateResult.jsp";
	}else{
		alert("내 정보 수정 실패!");
		history.back();
	}
</script>
</body>
</html>