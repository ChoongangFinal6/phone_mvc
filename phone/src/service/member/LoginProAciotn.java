package service.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.HMemberDao;
import dto.HMember;
import service.CommandProcess;

public class LoginProAciotn implements CommandProcess {

	public String requestPro(HttpServletRequest request,
		HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("--LoginProAciotn : ");
		String id = request.getParameter("id");
		String pwd = request.getParameter("password");
		HttpSession session = request.getSession();

		String name = null;
		int result = 0;
		HMemberDao hd = HMemberDao.getInstance();
		HMember hm = new HMember();
		hm.setId(id);
		hm.setPassword(pwd);
	//	name = hd.namechk(id);
		result = hd.loginchk(hm);

		if (result == 1) {
			session.setAttribute("id", id);
		}
		System.out.println("result : " + result);
		request.setAttribute("result", result);

		return "/member/loginPro.jsp";
	}

}
