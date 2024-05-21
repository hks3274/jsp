<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value = "${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>fileUpload1.jsp</title>
	<%@ include file = "/include/bs4.jsp" %>
	<script>
		'use strict';
		
		function fCheck() {
			let fName= document.getElementById("file").value;
			// alert("fName :"+ fName);
			let MaxSize = 1024 * 1024 * 10 //기본단위 : Byte, 1024 * 1024 * 10 = 10MByte 허용
			let ext = fName.substring(fName.lastIndexOf(".")+1).toLowerCase();
			
			if(fName.trim() == ""){
				alert("업로드할 파일을 선택하세요.");
				return false;
			}
			demo.innerHTML = fName;
			
			let fileSize = document.getElementById("file").files[0].size;
			
			if(fileSize > MaxSize) {
				alert("업로드한 파일의 최대용량은 10MByte입니다.")
			}
			else if(ext != 'jpg' && ext != 'png' && ext != 'gif' && ext != 'hwp' && ext != 'ppt' && ext != 'pptx' && ext != 'zip' && ext != 'docx' && ext != 'doc' && ext != 'pdf' && ext != 'xisx' && ext != 'txt'){
				alert("업로드 가능한 파일은 'jpg/png/gif/hwp/ppt/pptx/zip/doc/docx/pdf/xisx/txt'만 가능합니다.");
			}
			else{
				myform.submit();
			}
			
		}
		
		//선택된 그림 미리보기
		function imgCheck(e) {
			if(e.files && e.files[0]) {
				let reader = new FileReader();
				reader.onload = function(e) {
					document.getElementById("demoImg").src = e.target.result;
				}
				
				reader.readAsDataURL(e.files[0]);
			}
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
	<form name="myform" method="post" action="FileUpload1Ok.st" enctype="multipart/form-data">
		파일명 : 
		<input type="file" name="fName" id="file" onchange="imgCheck(this)" class="form-control-file border mb-2" />
		<input type="button" value="파일전송" onclick="fCheck()" class="btn btn-success form-control" />
		<!-- <input type="submit" value="파일전송"  class="btn btn-success form-control" /> -->
		<input type = "hidden" name="nickName" value = "${sNickName}"/>
	</form>
	<hr/>
	<div id = "demo">
		<img id="demoImg" width="200px"/>
	</div>
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