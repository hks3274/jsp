package study.j0425;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("/j0425/T04Ok")
public class T04Ok extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset= utf-8");
		request.setCharacterEncoding("utf-8");
		
		String name = request.getParameter("name")==null? "":request.getParameter("name"); 
		int age = (request.getParameter("age")==null || request.getParameter("age")=="")? 0 :Integer.parseInt(request.getParameter("age"));
		
		System.out.println("성명 : "+ name + ", 나이 : " + age);
		
		//브라우저에 출력하기
		PrintWriter out = response.getWriter();
		
		out.println("<p>성명 : "+name+"</p>");
		out.println("<p>나이 : "+age+"</p>");
		out.println("<p><a href='"+request.getContextPath()+"/study/0425/t04.jsp'>돌아가기</a></p>");
	}
}

