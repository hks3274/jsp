<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value = "${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>fileUpload3.jsp</title>
	<%@ include file = "/include/bs4.jsp" %>
	<script>
		'use strict';
		
		function fCheck() {
			let fName1 = document.getElementById("file1").value;
			let ext1 = fName1.substring(fName1.lastIndexOf(".")+1).toLowerCase();
			let MaxSize = 1024 * 1024 * 10 //기본단위 : Byte, 1024 * 1024 * 10 = 10MByte 허용
			
			if(fName1.trim() == ""){
				alert("업로드할 파일을 선택하세요.");
				return false;
			}
			
			let fileSize1 = document.getElementById("file1").files[0].size;
			
			if(fileSize1 > MaxSize) {
				alert("업로드한 1개 파일의 최대용량은 10MByte입니다.")
			}
			else if(ext1 != 'jpg' && ext1 != 'png' && ext1 != 'gif' && ext1 != 'hwp' && ext1 != 'ppt' && ext1 != 'pptx' && ext1 != 'zip' && ext1 != 'docx' && ext1 != 'doc' && ext1 != 'pdf' && ext1 != 'xisx' && ext1 != 'txt'){
				alert("업로드 가능한 파일은 'jpg/png/gif/hwp/ppt/pptx/zip/doc/docx/pdf/xisx/txt'만 가능합니다.(첫번째 파일)");
			}
			else{
				myform.submit();
			}
			
		}
		
		
		//파일박스추가하기
		let cnt = 1;
		function fileBoxAppend() {
			cnt++;
			let fileBox = '';
			fileBox += '<div id="fBox'+cnt+'">';
			fileBox += '<input type ="file" name="fileName'+cnt+'" id="fileName'+cnt+'" class="form-control-file border mb-2" style= "float:left; width:85%" />';
			fileBox += '<input type="button" value="삭제" onclick="deleteBox('+cnt+')" class="btn btn-danger mb-2 ml-3" style= "width:10%" />';
			fileBox += '</div>';
			
			$("#fileBox").append(fileBox); //html(), text(), append();
		}
		
		//파일박스삭제하기
		function deleteBox(cnt) {
			$("#fBox"+cnt).remove();
		}
		
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class = "container">
	<h2>파일 업로드 연습(싱글파일처리)</h2>
	<p>COS라이브러리를 이용한 파일 업로드</p>
	<div>(http://www.servlets.com/cos/)</div>
	<hr/>
	<form name="myform" method="post" action="FileUpload3Ok.st" enctype="multipart/form-data">
		파일명 : 
		<div>
			<input type ="button" value="파일박스추가" onclick = "fileBoxAppend()" class="btn btn-primary mb-2"/>
			<input type="file" name="fName1" id="file1" class="form-control-file border mb-2" />		
		</div>
		<div id = "fileBox"></div>
		<input type="button" value="파일전송" onclick="fCheck()" class="btn btn-success form-control" />
		<input type = "hidden" name="nickName" value = "${sNickName}"/>
	</form>
	<hr/>
	<div class ="row">
		<div class="col"><a href="FileDownLoad.st" class="btn btn-primary form-control">다운로드 폴더로 이동하기</a></div>
		<div class="col text-center"><a href="FileUpload.st" class="btn btn-warning form-control">돌아가기</a></div>
	</div>
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>