<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctp" value = "${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>boardList.jsp</title>
	<%@ include file = "/include/bs4.jsp" %>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class = "container">
	<table class ="table table-borderless m-0 p-0 ">
		<tr>
			<td colspan = "2" class ="text-center"><h2>게 시 판 리 스 트</h2></td>
		</tr>
		<tr>
			<td><c:if test="${sLevel != 1}"><a href ="BoardInput.bo" class ="btn btn-success btn-sm">글쓰기</a></c:if></td>
			<td></td>
		</tr>
	</table>
	<table class ="table table-hover m-0 p-0 text-center">
		<tr class ="text-dark table-dark">
			<th>글번호</th>
			<th>글제목</th>
			<th>글쓴이</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="vo" items = "${vos}" varStatus="st">
			<tr>
				<td>${vo.idx}</td>
				<td class ="text-left">
					<a href="BoardContent.bo?idx=${vo.idx}">${vo.title}</a>
					<c:if test="${vo.hour_diff <= 24 }"><img src="${ctp}/images/new.gif"/></c:if>
				</td>
				<td>${vo.nickName}</td>
				<td>
					<!--1일(24시간) 이내는 시간만 표시, 이후는 날짜와 시간을 표시-->
					<!--단, 24시간안에 만족하는 자료에 대해서는 날짜가 '오늘날짜'만 표시하고, 어제날짜는 '날짜시간'으로 표시하시오. -->			
					${vo.date_diff==0?fn:substring(vo.wDate,11,19) : fn:substring(vo.wDate,0,10)}								
				</td> 
				<td>${vo.readNum}</td>
			</tr>
		</c:forEach>
		<tr><td colspan="5" class ="m-0 p-0"></td></tr>
	</table>
	<br/>
	<!-- 블록페이지 시작 -->
  <div class = "text-center">
  	<ul class="pagination justify-content-center" style="margin:20px 0">
	  	<c:if test="${pag > 1}"><li class="page-item"><a class="page-link text-secondary" href ="${ctp}/BoardList.bo?pag=1&pageSize=${pageSize}">첫페이지</a></li></c:if>
	  	<c:if test="${curBlock > 0}"><li class="page-item"><a class="page-link text-secondary" href ="${ctp}/BoardList.bo?pag=${(curBlock-1)*blockSize+1}&pageSize=${pageSize}">이전블록</a></li></c:if>
	  	<c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}" varStatus="st">
	  		<c:if test="${i <=totPage && i != pag}"><li class="page-item"><a class="page-link text-secondary" href="${ctp}/BoardList.bo?pag=${i}&pageSize=${pageSize}">${i}</a></li></c:if>
	  		<c:if test="${i <=totPage && i == pag}"><li class="page-item active"><a class="page-link bg-secondary border-secondary" href="${ctp}/BoardList.bo?pag=${i}&pageSize=${pageSize}">${i}</a></li></c:if>
	  	</c:forEach>
	  	<c:if test="${curBlock < lastBlock}"><li class="page-item"><a class="page-link text-secondary" href ="${ctp}/BoardList.bo?pag=${(curBlock+1)*blockSize+1}&pageSize=${pageSize}">다음블록</a></li></c:if>
	  	<c:if test="${pag < totPage}"><li class="page-item"><a class="page-link text-secondary" href ="${ctp}/BoardList.bo?pag=${totPage}&pageSize=${pageSize}">마지막페이지</a></li></c:if>
  	</ul>
  </div>
  <!-- 블록페이지 끝 -->
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>