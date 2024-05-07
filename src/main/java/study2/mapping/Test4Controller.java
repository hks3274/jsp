package study2.mapping;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("*.do4")
public class Test4Controller extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Test4InterFace command = null;
		String viewPage = "/WEB-INF/study2/mapping/";
		
		String uri = request.getRequestURI();
		
		String com = uri.substring(uri.lastIndexOf("/")+1, uri.lastIndexOf("."));
		
		
		if(com.equals("test4")) {
			viewPage += "test4.jsp";
		}
		else if(com.equals("List")) {
//			viewPage = "/WEB-INF/study2/mapping/list.jsp";
			command = new Test4ListCommand();
			command.excute(request, response);
			viewPage += "list.jsp";
		}
		else if(com.equals("Input")){ //view만 보여주고 돌아감
			viewPage += "input.jsp";
		}
		else if(com.equals("inputOk")) {
			command = new Test4InputOkCommand();
			command.excute(request, response);
			viewPage = "/WEB-INF/common/message.jsp";
		}
		else if(com.equals("Update")){
			command = new Test4UpdateCommand();
			command.excute(request, response);
			viewPage += "update.jsp";
		}
		else if(com.equals("updateOk")){
			command = new Test4UpdateOkCommand();
			command.excute(request, response);
			viewPage = "/WEB-INF/common/message.jsp";
		}
		else if(com.equals("Delete")){
			command = new Test4DeleteCommand();
			command.excute(request, response);
			viewPage += "delete.jsp";
		}
		else if(com.equals("deleteOk")){
			command = new Test4DeleteOkCommand();
			command.excute(request, response);
			viewPage = "/WEB-INF/common/message.jsp";
		}
		else if(com.equals("Search")){
			command = new Test4SearchCommand();
			command.excute(request, response);
			viewPage += "search.jsp";
		}
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}
}
