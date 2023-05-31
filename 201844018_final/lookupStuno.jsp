<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>학번 조회</title>
<script type="text/javascript">
	function oninputPhone(target) {
	    target.value = target.value
	        .replace(/[^0-9]/g, '')
	        .replace(/(^02.{0}|^01.{1}|[0-9]{3,4})([0-9]{3,4})([0-9]{4})/g, "$1-$2-$3");
	}
	
	function check(){
		if(!frm.name.value){
			alert("이를을 입력하세요.");
			frm.name.focus();
			return false;
		}
		if(!frm.telephone.value){
			alert("전화번호를 입력하세요.");
			frm.telephone.focus();
			return false;
		}
		if(!frm.birthday.value){
			alert("생일을 입력하세요.");
			frm.birthday.focus();
			return false;
		}
	}
</script>
</head>
<body style="text-align: center; line-height: 30px">
<form action="lookupStunoProc.jsp" style="margin-top:-15px;" name="frm" onsubmit="return check()">
<br>
<div style="margin-bottom:10px;">
<h2 align="center"> 학번 조회 </h2>
이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름&nbsp;&nbsp;:&nbsp;&nbsp;<input type="text" name="name" style="width:140px; height:20px; font-size:13px;" autofocus="autofocus"><br>
전화번호&nbsp;&nbsp;: &nbsp;<input type="text" oninput="oninputPhone(this)" placeholder="'-' 없이 입력하세요" name="telephone" style="width:140px; height:20px; font-size:13px;" maxlength="13"><br>
생년월일 &nbsp;: &nbsp;<input type="date" name="birthday" style="width:140px; height:20px; font-size:13px;"><br>
</div>
<button class="btn btn-primary btn-sm" type="submit">조회</button>
</form>
</body>
</html>