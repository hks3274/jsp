<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<%
	int level = session.getAttribute("sLevel") == null ? 999 : (int)session.getAttribute("sLevel");
	pageContext.setAttribute("level", level);
%>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <a class="navbar-brand" href="http://192.168.50.51:9090/javaclass/Main">Home</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="${ctp}/GuestList">Guest</a>
      </li>
      <c:if test="${level <= 4}">
	      <li class="nav-item">
	        <a class="nav-link" href="#">Board</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="#">PDS</a>
	      </li>
	      
	      <li class="nav-item mr-3"> 
	         	<div class="dropdown">
	    			<button class="btn btn-secondary dropdown-toggle" type="button" data-toggle="dropdown">
	    			Study
	    			</button>
	    			<div class="dropdown-menu">
	      			<a class = "dropdown-item" href="<%=request.getContextPath() %>/study/0426/t01.jsp">서버환경</a>
	      			<a class = "dropdown-item" href="<%=request.getContextPath() %>/study/0426/t02.jsp">성적계산</a>
	      			<a class="dropdown-item" href="<%=request.getContextPath()%>/study/homework/ex2_GuGuDan.jsp">구구단계산</a>
	      			<a class = "dropdown-item" href="<%=request.getContextPath() %>/study/0427_storage/t1_Cookies.jsp">쿠키연습</a>
	      			<a class = "dropdown-item" href="<%=request.getContextPath() %>/study/0427_storage/t2_Session.jsp">세션연습</a>
	      			<a class = "dropdown-item" href="<%=request.getContextPath() %>/study/0427_storage/t3_Application.jsp">어플리케이션연습</a>
	      			<a class = "dropdown-item" href="<%=request.getContextPath() %>/study/0427_storage/t4_StorageTest.jsp">저장소연습</a>
	      			<a class = "dropdown-item" href="<%=request.getContextPath() %>/study/homework/ex1_Login.jsp">아이디저장연습</a>
	      			<a class = "dropdown-item" href="<%=request.getContextPath() %>/study/0429_JSTL/el1.jsp">EL연습</a>
	      			<a class = "dropdown-item" href="<%=request.getContextPath() %>/study/0429_JSTL/jstl1.jsp">JSTL연습</a>
	      			<a class = "dropdown-item" href="<%=request.getContextPath() %>/study/0430_web_xml/filter/t1_Filter.jsp">Filter한글연습</a>
	      			<%-- <a class = "dropdown-item" href="<%=request.getContextPath() %>/study/0430_web_xml/filter/t2_Certification.jsp">인증코드발행(관리자)</a> --%>
	      			<a class = "dropdown-item" href="<%=request.getContextPath() %>/study/0430_web_xml/init/t03_Init.jsp">초기값확인</a>
	      			<a class = "dropdown-item" href="<%=request.getContextPath() %>/study/0430_web_xml/lifeCycle/lifeCycle2.jsp">서블릿생명주기</a>
	      			<a class = "dropdown-item" href="<%=request.getContextPath() %>/study/database/LoginList">데이터베이스연습</a>
	    			</div>
	  				</div>
	      </li>
	      <li class="nav-item mr-3"> 
	         	<div class="dropdown">
	    			<button class="btn btn-secondary dropdown-toggle" type="button" data-toggle="dropdown">
	    			Study2
	    			</button>
	    			<div class="dropdown-menu">
	      			<a class = "dropdown-item" href="${ctp}/study/password/passCheck.jsp">비밀번호 암호화</a>
	      			<a class = "dropdown-item" href="${ctp}/mapping/test1">url매핑-디렉토리패턴연습</a>
	      			<a class = "dropdown-item" href="${ctp}/mapping/test2.do">url매핑-확장자패턴연습1</a>
	      			<a class = "dropdown-item" href="${ctp}/mapping/test3.do3">url매핑-확장자패턴연습2</a>
	      			<a class = "dropdown-item" href="${ctp}/mapping/test4.do4">url매핑-확장자패턴연습3</a>
	      			<a class = "dropdown-item" href="${ctp}/ajaxTest1.st">AJAX연습(일반)</a>
	      			<a class = "dropdown-item" href="${ctp}/ajaxTest2.st">AJAX연습(응용)</a>
	      			<a class = "dropdown-item" href="${ctp}/ajaxTest3.st">AJAX연습(회원)</a>
	      			<a class = "dropdown-item" href="${ctp}/uuidForm.st">UUID연습</a>
	      			<a class = "dropdown-item" href="${ctp}/study/database/login.jsp">로그인연습</a>
	    			</div>
	  				</div>
	      </li>
			</c:if>
      <li class="nav-item">
	      <c:if test="${level <= 4}"><a class="nav-link" href="${ctp}/MemberLogout.mem">Logout</a></c:if>
	      <c:if test="${level > 4}"><a class="nav-link" href="${ctp}/MemberLogin.mem">Login</a></c:if>
      </li>
      <li class="nav-item">
         <c:if test="${level > 4}"><a class="nav-link" href="${ctp}/MemberJoin.mem">Join</a></c:if>
      </li>
    </ul>
  </div>  
</nav>