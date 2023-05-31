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
	
	vo.setStu_no(Integer.parseInt(request.getParameter("stuno")));
	vo.setStu_hp(request.getParameter("telephone"));
	vo.setStu_birth(request.getParameter("birthday"));
	vo = dao.findStupw(vo);
	if(vo != null){
		String stupw = vo.getStu_pw();	
		request.setAttribute("stupw", stupw);
		int stuno = vo.getStu_no();	
		request.setAttribute("stuno", stuno);
	}
%>
<script>
window.onload = function(){
	if(${stupw == null}){
		alert("입력을 확인해주세요.");
		history.back();
	}else{
		alert("${stuno }님의 비밀번호는 ${stupw} 입니다.");
		self.close();
	}
}
</script>
</body>
</html>