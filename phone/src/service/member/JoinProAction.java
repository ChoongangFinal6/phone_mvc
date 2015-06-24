package service.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.HMemberDao;
import dto.HMember;
import service.CommandProcess;

public class JoinProAction implements CommandProcess {


	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		     request.setCharacterEncoding("utf-8");
			 String id = request.getParameter("id"); 
			 String name = request.getParameter("name");
			 String password = request.getParameter("password");
			 String birthDate = request.getParameter("birthDate");
			 
			 birthDate = birthDate.substring(0, 10);
			 System.out.println("birthDate:"+birthDate);
			/* System.out.println("JoinProAction date - " + request.getParameter("birthDate"));*/
			 String gender = request.getParameter("gen");
			 
			 String post1 = request.getParameter("post1");
			 String post2 = request.getParameter("post2");
			 String addr1 = request.getParameter("addr1");
			 String addr2 = request.getParameter("addr2");
			 String addr3 = request.getParameter("addr3");
			 String jibeon = request.getParameter("jibeon");
			 
			 String address = post1+post2+" "+addr1+" "+addr2+" "+addr3+" "+jibeon;
			 
			 HMember hm = new HMember();
			 HMemberDao md = HMemberDao.getInstance();
			 
			  hm.setId(id);
			  hm.setName(name);
			  hm.setPassword(password);
			  hm.setBirthDate(birthDate);
			  hm.setGender(gender);
			  hm.setAddress(address);
			  int result = md.insert(hm); 
			  request.setAttribute("result", result);
			  request.setAttribute("id", id);
			  
		
		return "/member/joinPro.jsp" ;
		  
	}

}
