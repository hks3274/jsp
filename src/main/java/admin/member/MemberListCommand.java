package admin.member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.AdminDAO;
import admin.AdminInterface;
import member.MemberDAO;
import member.MemberVO;

public class MemberListCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int level = request.getParameter("level")==null? 999: Integer.parseInt(request.getParameter("level"));
		
		AdminDAO dao = new AdminDAO();
		ArrayList<MemberVO> vos = dao.getMemberList(level);

		request.setAttribute("level", level);
		request.setAttribute("vos", vos);
	}

}
