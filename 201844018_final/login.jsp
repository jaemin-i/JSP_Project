<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function stunoPopup(){
		window.open("lookupStuno.jsp","학번조회","height=200, width=300, left=570, top=330");
	}
	function findPwPopup(){
		window.open("findPw.jsp","비밀번호찾기","height=200, width=300, left=570, top=330");
	}
</script>
</head>
<body style="background-color: #F2F2F2;">
<nav class="navbar navbar-expand-lg rounded" aria-label="Eleventh navbar example">
      <div class="container-fluid" style="background-color: #F2F2F2;">
        <a class="navbar-brand" href="main.jsp">🏠&nbsp;&nbsp;HOME</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample09" aria-controls="navbarsExample09" aria-expanded="false" aria-label="Toggle navigation">
         <span class="navbar-toggler-icon"></span>
        </button>
     </div>
</nav>
<div class="p-5 mb-4 bg-white rounded-10">
      <div class="container-fluid py-5" style="height:480px; width:700px;">
        <main class="form-signin w-50 m-auto">
		  <form action="loginProc.jsp" method="post" name="frmlogin">
		    <h1 class="h3 mb-3 fw-normal" style="text-align:center;">로그인</h1>
		     <h6 align="right" style="color:gray;">초기비밀번호는 생년월일 6자리 입니다.</h6>
		    <div class="form-floating">
		      <input type="text" class="form-control" id="floatingInput" name="stuId" autofocus="autofocus" required="required">
		      <label for="floatingInput">학번</label>
		    </div>
		    <div class="form-floating">
		      <input type="password" class="form-control" id="floatingPassword" name="stuPassword" required="required">
		      <label for="floatingPassword">비밀번호</label>
		    </div>
		    <button class="w-100 btn btn-lg btn-primary" type="submit" style="margin-top:8px;">로그인</button>
		    <hr>
		    <h6 align="right" style="color:lightgray;"><a href="#" onclick="javascript:stunoPopup()">학번조회</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#" onclick="javascript:findPwPopup()">비밀번호 찾기</a></h6>
		  </form>
		</main>
      </div>
</div>
</body>
</html>