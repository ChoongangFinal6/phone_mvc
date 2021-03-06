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
		
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("password");
		HttpSession session = request.getSession();
        System.out.println("id :"+id);
		String name = null;
		String resultMsg = "";
		int result = 0;
		HMemberDao hd = HMemberDao.getInstance();
		HMember hm = new HMember();
		hm.setId(id);
		hm.setPassword(pwd);
	/*	name = hd.namechk(id);*/
		result = hd.loginchk(hm);
		String viewPage ="";
		
		if (result == 1) {
			session.setAttribute("id", id);
			viewPage = "/template/home.jsp";
			
		}else{
			viewPage = "/member/login.jsp";
		}
		System.out.println("result : " + result);
		request.setAttribute("result", result);
		//request.setAttribute("resultMsg", resultMsg);
        
		return viewPage;
	}

}
