<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value = "${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>memberPwdCheck.jsp</title>
	<%@ include file = "/include/bs4.jsp" %>
	<script>
		'use strict';
		
		$(function(){
			$("#pwdDemo").hide();
		
		});
		
		function pwdReCheck() {
			let pwd = $("#pwd").val().trim();
			if(pwd == "") {
				alert("현재 비밀번호를 입력하세요.");
				$("#pwd").focus;
				return false;
			}
			
			$.ajax({
				url : "MemberPwdCheckAjax.mem",
				type : "post",
				data : {pwd : pwd},
				success : function(res) {
					if(res != "0") $("#pwdDemo").show();
					else alert("비밀번호가 틀립니다.. 확인해주세요");
				},
				error : function() {
					alert("전송오류...");
				}
			});
		} 
		
		function pwdChangeCheck() {
			let pwdCheck = $("#pwdCheck").val()
			let pwdCheckRe = $("#pwdCheckRe").val()
			
			if(pwdCheck.trim() == "" || pwdCheckRe.trim() == ""){
				alert("변경할 비밀번호를 입력하세요.");
				$("#pwdCheck").focus();
				return false;
			} 
			else if(pwdCheck.trim() != pwdCheckRe.trim() ){
				alert("새로 입력한 비밀번호가 틀립니다. 확인하세요.")
				$("#pwdCheck").focus();
				return false;
			}
			else {
				pwdForm.submit();
			}
		}
	</script>
	
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class = "container">
	<form name = "myform" method="post" action="MemberPwdCheckOk.mem">
		<table class ="table table-bordered text-center">
			<tr>
				<td colspan="2">
					<h3>비밀번호 확인</h3>
					<div>(회원 정보 수정을 하기 위해 현재 비밀번호를 확인합니다.)</div>
				</td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type ="password" name ="pwd" id ="pwd" class ="form-control" autofocus required /></td>
			</tr>
			<tr>
				<td colspan="2" class ="text-center">
					<input type ="button" value="비밀번호변경" onclick ="pwdReCheck()" class ="btn btn-success mr-2"/>
					<input type ="submit" value="회원정보변경"  class ="btn btn-primary mr-2"/>
					<input type ="reset" value="다시입력" class ="btn btn-info mr-2"/>
					<input type ="button" value="돌아가기" onclick ="location.href='MemberMain.mem'" class ="btn btn-warning mr-2"/>
				</td>
			</tr>
		</table>
	</form>
	<br/>
	<div id ="pwdDemo">
		<form name ="pwdForm" method = "post" action="MemberPwdChangeCheck.mem">
			<table>
				<tr>
					<td>변경할 비밀번호를 입력하세요</td>
					<td><input type ="password" name ="pwdCheck"  id ="pwdCheck" class="form-control"/></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td><input type ="password" name ="pwdCheckRe" id ="pwdCheckRe" class="form-control"/></td>
				</tr>
				<tr>
					<td colspan = "2" class ="text-center">
						<input type ="button" value ="비밀번호 변경하기" onclick="pwdChangeCheck()" class ="btn btn-secondary"/>
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>