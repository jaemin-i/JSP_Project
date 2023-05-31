<%@page import="java.util.ArrayList"%>
<%@page import="project_201844018.DeptDAO"%>
<%@page import="project_201844018.DeptVO"%>
<%@page import="project_201844018.StudentDAO"%>
<%@page import="project_201844018.StudentVO"%>
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
	
	int stuNo = (int)session.getAttribute("stuId");
	vo.setStu_no(stuNo);
	vo = dao.stuInfo(vo);
	if(vo != null){
		session.setAttribute("stuGrade", vo.getStu_grade());
		session.setAttribute("stuDept", vo.getStu_dept());
		session.setAttribute("stuHp", vo.getStu_hp());
		session.setAttribute("stuBirth", vo.getStu_birth());
	}
	
	DeptVO dvo = new DeptVO();
	DeptDAO ddao = new DeptDAO();
	
	ArrayList<String> dept = ddao.getDept();
	if(dept != null && dept.size() != 0){
       	session.setAttribute("dept", dept);
    }
	
	String inputPwChk = request.getParameter("inputPw");
	String StuPw = (String)session.getAttribute("stuPw");
	if(inputPwChk.equals(StuPw)){
		session.setAttribute("stuPwChk", 2);
		response.sendRedirect("main.jsp?Page=memInfoUpdate.jsp");
	}
%>
<script>
	alert('인증에 실패했습니다.');
	location.href = 'main.jsp?Page=memInfo.jsp';
</script>
</body>
</html>