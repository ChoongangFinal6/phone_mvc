package service.member;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;










import dao.HMemberDao;
import dto.PersonInfo;
import service.CommandProcess;

public class JoinAction implements CommandProcess {

	
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("===============1");
		       request.setCharacterEncoding("utf-8");
		        String name = request.getParameter("name");
				String gender = request.getParameter("gender");
				String birthdate = request.getParameter("birthdate");
				
		
				
	      HMemberDao md = HMemberDao.getInstance(); 			
		  PersonInfo pi = new PersonInfo();
		  pi.setName(name);
		  pi.setGender(gender);
		  pi.setBirthdate(birthdate);
			/*System.out.println(pi.getName());
			System.out.println(pi.getBirthdate());
			System.out.println(pi.getGender());*/
		  int result =  md.chk(pi);
		  
		  if(result>0){
			  return "/member/join.jsp";
			  
		  }else{
			  request.setAttribute("result", result);
			  return "/member/check.jsp";
		  }

		
	}

}
