package study2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import study2.Heowon.HeowonDeleteCommand;
import study2.Heowon.HeowonInputCommand;
import study2.Heowon.HeowonMainCommand;
import study2.Heowon.HeowonSearchCommand;
import study2.Heowon.HeowonUpdateCommand;
import study2.ajax.AjaxIdCheck0Command;
import study2.ajax.AjaxIdCheck1Command;
import study2.modal.ModalTestCommand;
import study2.pdstest.FileDeleteCheckCommand;
import study2.pdstest.FileDeleteCommand;
import study2.pdstest.FileDownLoadCommand;
import study2.pdstest.FileUpload1OkCommand;
import study2.pdstest.FileUpload2OkCommand;
import study2.pdstest.FileUpload3OkCommand;
import study2.pdstest.FileUpload4OkCommand;
import study2.pdstest.JavaFileDownLoadCommand;

@SuppressWarnings("serial")
@WebServlet("*.st")
public class studyController extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		StudyInterface command = null;
		String viewPage = "WEB-INF/study2";
		
		String com = request.getRequestURI();
		com = com.substring(com.lastIndexOf("/")+1, com.lastIndexOf("."));
		
		// 인증....처리.....
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel")==null ? 999 : (int) session.getAttribute("sLevel");
		
		
		if(level > 4) {
			request.setAttribute("message", "로그인후 사용하세요");
			request.setAttribute("url", request.getContextPath()+"/MemberLogin.mem");
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("ajaxTest1")) {
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
		else if(com.equals("Modal1")) {
			viewPage += "/modal/modal1.jsp";
		}
		else if(com.equals("Modal2")) {
			command = new ModalTestCommand();
			command.excute(request, response);
			viewPage += "/modal/modal2.jsp";
		}
		else if(com.equals("FileUpload1")) {
			viewPage += "/pdstest/fileUpload1.jsp";
		}
		else if(com.equals("FileUpload1Ok")) {
			command = new FileUpload1OkCommand();
			command.excute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("FileUpload2")) {
			viewPage += "/pdstest/fileUpload2.jsp";
		}
		else if(com.equals("FileUpload2Ok")) {
			command = new FileUpload2OkCommand();
			command.excute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("FileUpload3")) {
			viewPage += "/pdstest/fileUpload3.jsp";
		}
		else if(com.equals("FileUpload3Ok")) {
			command = new FileUpload3OkCommand();
			command.excute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("FileUpload4")) {
			viewPage += "/pdstest/fileUpload4.jsp";
		}
		else if(com.equals("FileUpload4Ok")) {
			command = new FileUpload4OkCommand();
			command.excute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("FileUpload5")) {
			viewPage += "/pdstest/fileUpload5.jsp";
		}
		else if(com.equals("FileUpload6")) {
			viewPage += "/pdstest/fileUpload6.jsp";
		}
		else if(com.equals("FileDownLoad")) {
			command = new FileDownLoadCommand();
			command.excute(request, response);
			viewPage += "/pdstest/fileDownLoad.jsp";
		}
		else if(com.equals("JavaFileDownload")) {
			command = new JavaFileDownLoadCommand();
			command.excute(request, response);
			return;
		}
		else if(com.equals("FileDelete")) {
			command = new FileDeleteCommand();
			command.excute(request, response);
			return;
		}
		else if(com.equals("FileDeleteCheck")) {
			command = new FileDeleteCheckCommand();
			command.excute(request, response);
			return;
		}
		else if(com.equals("FileUpload")) {
			viewPage += "/pdstest/fileUpload.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}
}
