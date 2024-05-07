package study2.mapping;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test4DeleteOkCommand implements Test4InterFace {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("이곳은 Test4DeleteOkCommand 입니다.");
		System.out.println("이곳에서는 회원의 정보를 DB에서 삭제 합니다.");
		
		//DB에 저장하러 다녀옵니다.
		
		String message = "자료가 DB에 삭제되었습니다.";
		
		request.setAttribute("message", message);
		request.setAttribute("url","test4.do4");
	}

}
