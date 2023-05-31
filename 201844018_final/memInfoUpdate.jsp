<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	var pwChk = false;
	function oninputPhone(target) {
	    target.value = target.value
	        .replace(/[^0-9]/g, '')
	        .replace(/(^02.{0}|^01.{1}|[0-9]{3,4})([0-9]{3,4})([0-9]{4})/g, "$1-$2-$3");
	}
	function validate() {
		pw = document.frm.updatePw.value;
		var nameChk = document.getElementById('inputName').value
		var hpChk = document.getElementById('inputHp').value
	    var regExp = /^[a-zA-Zㄱ-힣][a-zA-Zㄱ-힣 ]*$/;
		if (!regExp.test(nameChk)){
			alert('이름 형식이 잘못되었습니다.')
			document.getElementById('inputName').focus();
			return false;
		}
		regExp = /\d{3}-\d{4}-\d{4}/g;
		if (!regExp.test(hpChk)){
			alert('전화번호 형식이 잘못되었습니다.')
			document.getElementById('inputHp').focus();
			return false;
		}
		if (pw.length == 0){
			   pwChk = true;
		   }
		if (!pwChk){
			document.getElementById('inputPwChk').focus();
			return false;
		}
	}
	function isSame() {
	    var pw = document.frm.updatePw.value;
	    var confirmPW = document.frm.updatePwChk.value;
	    var stuPw = '<%=(String)session.getAttribute("stuPw")%>';
	   if (pw.length < 6) {
	        document.getElementById('inputPw').value=document.getElementById('inputPwChk').value='';
	        document.getElementById('same').innerHTML='비밀번호는 6자 이상이어야 합니다.';
	        document.getElementById('same').style.color='#FA5882';
	        document.getElementById('inputPw').focus();
	    }
	   if (pw==stuPw) {
	       document.getElementById('inputPw').value=document.getElementById('inputPwChk').value='';
	       document.getElementById('same').innerHTML='현재 사용중인 비밀번호입니다.';
	       document.getElementById('same').style.color='#FA5882';
	       document.getElementById('inputPw').focus();
	   }
	   
	    if(document.getElementById('inputPw').value!='' && document.getElementById('inputPwChk').value!='') {
	        if(document.getElementById('inputPw').value==document.getElementById('inputPwChk').value) {
	            document.getElementById('same').innerHTML='비밀번호가 일치합니다.';
	            document.getElementById('same').style.color='#298A08';
	            pwChk = true;
	        }
	        else {
	            document.getElementById('same').innerHTML='비밀번호가 일치하지 않습니다.';
	            document.getElementById('same').style.color='#FA5882';
	            document.getElementById('inputPwChk').focus();
	            pwChk = false;
	        }
	    }
	}
</script>
<c:if test ="${stuPwChk == 1 }">
	<div class="p-5 mb-4 bg-white rounded-10" style="text-align:center; height:580px;">
	<h4 style="margin-top:10px; margin-bottom:20px;">🔒 ︎비밀번호 확인</h4>
	<form class="form-inline" action="pwCheckProc.jsp">
	<table class="table table-bordered" style="width:400px; margin-left: auto; margin-right: auto; vertical-align:middle;">
		<tr>
			<th style="background-color:#F2F2F2">비밀번호</th>
			<td><input type="password" class="form-control" id="inputPw" name="inputPw" placeholder="현재 비밀번호" style="margin-left:auto; margin-right:auto;" autofocus="autofocus">
			</td>
		</tr>
	</table>
	<button type="submit" class="btn btn-outline-primary mb-2">확인</button>&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-outline-danger mb-2" onclick="location.href='main.jsp'">취소</button>
	</form>
	</div>
</c:if>
<c:if test ="${stuPwChk == 2 }">
	<div class="p-5 mb-4 bg-white rounded-10" style="text-align:center; height:580px;">
	<h4 style="margin-top:10px; margin-bottom:20px;">🔒 ︎개인정보변경</h4>
	<form class="form-inline" action="memInfoUpdateProc.jsp" method="post" name="frm" onsubmit="return validate()">
	<table class="table table-bordered" style="width:400px; margin-left: auto; margin-right: auto; vertical-align:middle;">
		<tr>
			<th style="background-color:#F2F2F2">학번</th>
			<td><input type="text" readonly class="form-control-plaintext" id="stuno" name="stuNo" value="${stuId }" style="margin-left:10px;"></td>
		</tr>
		<tr>
			<th style="background-color:#F2F2F2">비밀번호</th>
			<td><input type="password" class="form-control" id="inputPw" onchange="isSame()" name="updatePw" placeholder="새 비밀번호" style="margin-left:auto; margin-right:auto; margin-bottom:10px;">
				<input type="password" class="form-control" id="inputPwChk" onKeyup="isSame()" name="updatePwChk" placeholder="새 비밀번호 확인" style="margin-left:auto; margin-right:auto; margin-bottom:5px;">
				 <span id="same" style="font-size:14px;"></span>
			</td>
		</tr>
		<tr>
			<th style="background-color:#F2F2F2">이름</th>
			<td><input type="text" class="form-control sr-only" id="inputName" name="updateName" value="${name }" style="margin-left:auto; margin-right:auto;" required="required">
			</td>
		</tr>
		<tr>
			<th style="background-color:#F2F2F2">전화번호</th>
			<td><input type="text" class="form-control" oninput="oninputPhone(this)" id="inputHp" name="updateHp" value="${stuHp }" placeholder="'-'빼고 입력하세요." style="margin-left:auto; margin-right:auto; margin-bottom:5px;" maxlength="13" required="required"></td>
		</tr>
		<tr>
			<th style="background-color:#F2F2F2">학과</th>
			<td>			 
				<select class="form-select" name="updateDept">
					<c:forEach items="${dept}" varStatus="status">
						<c:if test="${stuDept.equals(status.current)}">
							<option selected>${status.current }</option>
						</c:if>
						<c:if test="${!stuDept.equals(status.current)}">
							<option value="${status.current }">${status.current }</option>
						</c:if>
					</c:forEach>
				</select>
			</td>
		</tr>
	  </table>
	  <button type="submit" class="btn btn-outline-primary mb-2">변경</button>&nbsp;&nbsp;&nbsp;
	  <button type="button" class="btn btn-outline-danger mb-2" onclick="location.href='main.jsp'">취소</button>
	</form>
	</div>
</c:if>
</body>
</html>