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
			let fName1 = document.getElementById("file1").value;
			let fName2 = document.getElementById("file2").value;
			let fName3 = document.getElementById("file3").value;
			// alert("fName :"+ fName);
			let ext1 = fName1.substring(fName1.lastIndexOf(".")+1).toLowerCase();
			let ext2 = fName2.substring(fName2.lastIndexOf(".")+1).toLowerCase();
			let ext3 = fName3.substring(fName3.lastIndexOf(".")+1).toLowerCase();
			let MaxSize = 1024 * 1024 * 10 //기본단위 : Byte, 1024 * 1024 * 10 = 10MByte 허용
			
			if(fName1.trim() == "" || fName2.trim() == "" || fName3.trim() == ""){
				alert("업로드할 파일을 선택하세요.");
				return false;
			}
			
			let fileSize1 = document.getElementById("file1").files[0].size;
			let fileSize2 = document.getElementById("file2").files[0].size;
			let fileSize3 = document.getElementById("file3").files[0].size;
			
			if(fileSize1 > MaxSize || fileSize2 > MaxSize || fileSize3 > MaxSize) {
				alert("업로드한 1개 파일의 최대용량은 10MByte입니다.")
			}
			else if(ext1 != 'jpg' && ext1 != 'png' && ext1 != 'gif' && ext1 != 'hwp' && ext1 != 'ppt' && ext1 != 'pptx' && ext1 != 'zip' && ext1 != 'docx' && ext1 != 'doc' && ext1 != 'pdf' && ext1 != 'xisx' && ext1 != 'txt'){
				alert("업로드 가능한 파일은 'jpg/png/gif/hwp/ppt/pptx/zip/doc/docx/pdf/xisx/txt'만 가능합니다.(첫번째 파일)");
			}
			else if(ext2 != 'jpg' && ext2 != 'png' && ext2 != 'gif' && ext2 != 'hwp' && ext2 != 'ppt' && ext2 != 'pptx' && ext2 != 'zip' && ext2 != 'docx' && ext2 != 'doc' && ext2 != 'pdf' && ext2 != 'xisx' && ext2 != 'txt'){
				alert("업로드 가능한 파일은 'jpg/png/gif/hwp/ppt/pptx/zip/doc/docx/pdf/xisx/txt'만 가능합니다.(두번째 파일)");
			}
			else if(ext3 != 'jpg' && ext3 != 'png' && ext3 != 'gif' && ext3 != 'hwp' && ext3 != 'ppt' && ext3 != 'pptx' && ext3 != 'zip' && ext3 != 'docx' && ext3 != 'doc' && ext3 != 'pdf' && ext3 != 'xisx' && ext3 != 'txt'){
				alert("업로드 가능한 파일은 'jpg/png/gif/hwp/ppt/pptx/zip/doc/docx/pdf/xisx/txt'만 가능합니다.(세번째 파일)");
			}
			else{
				myform.submit();
			}
			
		}
	</script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class = "container">
	<h2>파일 업로드 연습(멀티파일처리)</h2>
	<p>COS라이브러리를 이용한 파일 업로드</p>
	<div>(http://www.servlets.com/cos/)</div>
	<hr/>
	<form name="myform" method="post" action="FileUpload2Ok.st" enctype="multipart/form-data">
		파일명 : 
		<input type="file" name="fName1" id="file1" class="form-control-file border mb-2" />
		<input type="file" name="fName2" id="file2" class="form-control-file border mb-2" />
		<input type="file" name="fName3" id="file3" class="form-control-file border mb-2" />
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