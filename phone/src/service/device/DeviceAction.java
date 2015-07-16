package service.device;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CommandProcess;

public class DeviceAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.print("  DeviceAction : ");
		
		String userId = (String) request.getSession().getAttribute("id");
		System.out.println(userId + "의 휴대폰 실행");
		
		request.setAttribute("id", userId);
		return "device/device_home.jsp";
	}

}
