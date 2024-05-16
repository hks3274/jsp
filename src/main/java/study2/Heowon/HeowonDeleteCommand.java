package study2.Heowon;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.database.LoginDAO;
import study.database.LoginVO;
import study2.StudyInterface;

public class HeowonDeleteCommand implements StudyInterface {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null? 0: Integer.parseInt(request.getParameter("idx"));
		LoginDAO dao = new LoginDAO();
		
		
		LoginVO vo = dao.getLoginIdxSearch(idx);
		
		dao.setLoginDelete(vo.getMid());
			
		response.getWriter().write("1");
	}

}
