package service.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.HMemberDao;
import dto.HMember;
import service.CommandProcess;

public class IdCheckAction implements CommandProcess{


	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		   int result = 0 ;
		   String id = request.getParameter("id");
		   System.out.println("id :"+id);
		   HMemberDao hd = HMemberDao.getInstance();
		   
		   result = hd.idChk(id);
		   System.out.println("result : "+result);	  
		   request.setAttribute("result", result);		   
				   
		
		return "/member/idCheck.jsp" ;
	}

}
