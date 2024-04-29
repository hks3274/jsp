<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String mid_ = session.getAttribute("sMid")==null?"" : (String)session.getAttribute("sMid");
%>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <a class="navbar-brand" href="http://192.168.50.51:9090/javaclass">Home</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="#">Guest</a>
      </li>
      <% if( !mid_.equals("")){%>
      <li class="nav-item">
        <a class="nav-link" href="#">Board</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">PDS</a>
      </li>
      <li class="nav-item"> 
         	<div class="dropdown">
    			<button class="btn btn-secondary dropdown-toggle" type="button" data-toggle="dropdown">
    			Study
    			</button>
    			<div class="dropdown-menu">
      			<a class = "dropdown-item" href="<%=request.getContextPath() %>/study/0426/t01.jsp">서버환경</a>
      			<a class = "dropdown-item" href="<%=request.getContextPath() %>/study/0426/t02.jsp">성적계산</a>
      			<a class = "dropdown-item" href="<%=request.getContextPath() %>/study/0427_storage/t1_Cookies.jsp">쿠키연습</a>
      			<a class = "dropdown-item" href="<%=request.getContextPath() %>/study/0427_storage/t2_Session.jsp">세션연습</a>
      			<a class = "dropdown-item" href="<%=request.getContextPath() %>/study/0427_storage/t3_Application.jsp">어플리케이션연습</a>
      			<a class = "dropdown-item" href="<%=request.getContextPath() %>/study/0427_storage/t4_StorageTest.jsp">저장소연습</a>
      			<a class = "dropdown-item" href="<%=request.getContextPath() %>/study/homework/ex1_Login.jsp">아이디저장연습</a>
      			<a class = "dropdown-item" href="<%=request.getContextPath() %>/study/0429_JSTL/el1.jsp">EL연습</a>
      			<a class = "dropdown-item" href="<%=request.getContextPath() %>/study/0429_JSTL/jstl1.jsp">JSTL연습</a>
    			</div>
  				</div>
      </li>
      <% } %>
      <li class="nav-item">
      <% if(!mid_.equals("")){%>
        <a class="nav-link" href="${pageContext.request.contextPath}/j0427/Logout">Logout</a>
      <% }  else {%>
        <a class="nav-link" href="<%=request.getContextPath() %>/study/0428_Login/login.jsp">Login</a>
      <% } %>
      </li>
    </ul>
  </div>  
</nav>