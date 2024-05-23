package pds;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class PdsDeleteCheckCommand implements PdsInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null? 0 : Integer.parseInt(request.getParameter("idx"));
		String[] fSNames = request.getParameter("fSName").split("/");
		
		String realPath = request.getServletContext().getRealPath("/images/pds/");
		
		//서버에 존재하는 파일을 삭제한다.
		for(String fSName : fSNames) {
			new File(realPath + fSName).delete();
		}
		
		//서버에 파일에 삭제 후 DB에서 자료를 삭제한다.
		PdsDAO dao = new PdsDAO();
		int res = dao.setPdsDeleteCheck(idx);
		
		response.getWriter().write(res+"");
	}
}
