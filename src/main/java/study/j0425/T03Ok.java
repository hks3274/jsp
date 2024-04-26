package study.j0425;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
//@WebServlet("/T03Ok")
public class T03Ok extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.setContentType("text/html; charset= utf-8");
		request.setCharacterEncoding("utf-8");
		
		//Front에서 넘어온 값들을 변수에 담아서 처리한다
		String name = request.getParameter("name"); //_가 있으면 임시라고 생각하기
//		int age = Integer.parseInt(request.getParameter("age"));
		String age_ = request.getParameter("age");
		int age;
		
		if(name.equals("") || name == null) {
			System.out.println("성명이 공백입니다. 다시 처리할 수 있도록 합니다......");
		} else if (age_.equals("") || age_ == null) {
			System.out.println("나이가 공백입니다. 다시 처리할 수 있도록 합니다......");
		} else {			
			age = Integer.parseInt(age_);
			System.out.println("성명 : "+ name + ", 나이 : " + age);
		}
	}
}
