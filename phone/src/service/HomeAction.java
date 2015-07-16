package service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HomeAction implements CommandProcess {

	
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	
		return "/template/home.jsp";
	}

}
