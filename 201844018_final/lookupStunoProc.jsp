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
	
	vo.setStu_name(request.getParameter("name"));
	vo.setStu_hp(request.getParameter("telephone"));
	vo.setStu_birth(request.getParameter("birthday"));
	vo = dao.findStuno(vo);
	if(vo != null){
		int stuno = vo.getStu_no();	
		request.setAttribute("stuno", stuno);
		String stuname = vo.getStu_name();	
		request.setAttribute("stuname", stuname);
	}
%>
<script>
window.onload = function(){
	let no = ${stuno};
	if(${stuno == 0}){
		alert("입력을 확인해주세요.");
		history.back();
	}else{
		alert("${stuname }님의 학번은 ${stuno} 입니다.");
		opener.document.frmlogin.stuId.value = no;
		self.close();
	}
}
</script>
</body>
</html>