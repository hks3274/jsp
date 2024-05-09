package study2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.ajax.AjaxIdCheck0Command;
import study2.ajax.AjaxIdCheck1Command;

@SuppressWarnings("serial")
@WebServlet("*.st")
public class studyController extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudyInterface command = null;
		String viewPage = "WEB-INF/study2";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/")+1, com.lastIndexOf("."));
		
		if(com.equals("ajaxTest1")) {
			viewPage += "/ajax/test1.jsp";
		}
		else if(com.equals("ajaxIdCheck0")) {
			command = new AjaxIdCheck0Command();
			command.excute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("ajaxIdCheck1")) {
			command = new AjaxIdCheck1Command();
			command.excute(request, response);
			// viewPage += "/ajax/test1.jsp";
			return;
		}
		else if(com.equals("ajaxTest2")) {
			viewPage += "/ajax/test2.jsp";
		}
		else if(com.equals("ajaxTest3")) {
			command = new HeowonMainCommand();
			command.excute(request, response);
			viewPage += "/ajax/heowonMain.jsp";
		}
		else if(com.equals("heowonInput")) {
			command = new HeowonInputCommand();
			command.excute(request, response);
			return;
		}
		else if(com.equals("heowonSearch")) {
			command = new HeowonSearchCommand();
			command.excute(request, response);
			return;
		}
		else if(com.equals("heowonUpdate")) {
			command = new HeowonUpdateCommand();
			command.excute(request, response);
			return;
		}
		else if(com.equals("heowonDelete")) {
			command = new HeowonDeleteCommand();
			command.excute(request, response);
			return;
		}
		else if(com.equals("uuidForm")) {
			viewPage += "/uuid/uuidForm.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}
}
