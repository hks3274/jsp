package admin.complaint;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.AdminDAO;
import admin.AdminInterface;

public class ComplaintCheckCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int partIdx = request.getParameter("partIdx")==null? 0 : Integer.parseInt(request.getParameter("partIdx"));
		String complaint = request.getParameter("complaint")==null? "" : request.getParameter("complaint");
		
		AdminDAO dao = new AdminDAO();
		
		if(complaint.equals("NO")) complaint = "OK";
		else complaint = "NO";
		
		dao.setUpdateComplaint(partIdx, complaint);
	}

}
