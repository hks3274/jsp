package study2.pdstest;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.StudyInterface;

public class FileDownLoadCommand implements StudyInterface {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/images/pdstest");
		
		String[] files = new File(realPath).list(); //자바의 파일목록을 생성하고 가져온다.
		
		for (String file : files) {
			System.out.println("file : "+ file);
		}
		
		request.setAttribute("files", files);
	}
}
