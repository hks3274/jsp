package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.SecurityUtil;

public class MemberDeleteCheckOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		String pwd = request.getParameter("pwd")==null? "" : request.getParameter("pwd");
		
		MemberDAO dao =  new MemberDAO();
		MemberVO vo = dao.getMemberIdCheck(mid);
		
		//저장된 비밀번호에서 salt키를 분리시켜서 다시 암호화 시킨 후 맞는지 비교한다.
		String salt = vo.getPwd().substring(0,8);
			
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(salt + pwd);
			
			
		if(!vo.getPwd().substring(8).equals(pwd)) {
			request.setAttribute("message", "비밀번호를 확인하세요");
			request.setAttribute("url", "MemberDelete.mem");
			return;
		} 
			
		int res = dao.setMemberDeleteUpdate(mid);
			
		if(res != 0) {
			request.setAttribute("message", "회원탈퇴되셨습니다.\\n같은 아이디로 한달간 재가입불가입니다.");
//			request.setAttribute("url", "MemberLogout.mem");
			request.setAttribute("url", request.getContextPath()+"/Main");
		} else {
			request.setAttribute("message", "회원탈퇴실패");
			request.setAttribute("url", "MemberMain.mem");
		}	
	}

}
