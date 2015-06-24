package service.device;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CommandProcess;
import dao.device.DeviceDao;
import dto.SMS;

public class SMSRecvAction implements CommandProcess {
	
	
	
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("-SMSRecvAction");
		
		//int id = Integer.parseInt(request.getParameter("id"));
		int recvId = 2222;
		int newMsg = 0;
		DeviceDao dd = DeviceDao.getInstance();
		newMsg = dd.getNewSMS(recvId);
		request.setAttribute("newMsg", newMsg);
		
		return "device/notify.jsp";
	}

}
