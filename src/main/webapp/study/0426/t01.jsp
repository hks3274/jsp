<%@page import="java.rmi.Remote"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String hostIp = request.getRemoteAddr(); //현재컴퓨터의 호스트아이피를 알아보는 명령
	/* request.setAttribute("hostIp", hostIp); */
	pageContext.setAttribute("hostIp", hostIp);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Insert</title>
	<%@ include file = "/include/bs4.jsp" %>
</head>
<body>
<%@ include file = "/include/header.jsp" %>
<%@ include file = "/include/nav.jsp" %>
<p><br/></p>
<div class = "container">
	<h2>서버의 환경변수값 확인하기</h2>
	<hr/>
	<div>호스트IP1 : ${hostIp}</div>
	<div>호스트IP2 : <%=hostIp%></div>
	<div>전송방식 : <%=request.getMethod()%></div>
	<div>전송프로토콜 : <%=request.getProtocol() %></div>
	<div>전송(서버)포트 : <%=request.getServerPort()%></div>
	<div>접속(서버)이름 : <%=request.getServerName()%></div>
	<div>접속 context이름 : <%=request.getContextPath()%></div>
	<div>접속 URL : <%=request.getRequestURL()%></div>
	<div>접속 URI : <%=request.getRequestURI()%></div>
</div>
<p><br/></p>
<%@ include file = "/include/footer.jsp" %>
</body>
</html>