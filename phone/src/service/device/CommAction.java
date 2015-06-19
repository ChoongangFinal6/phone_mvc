package service.device;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CommandProcess;
import dao.device.DeviceDao;
import dto.SMS;

public class CommAction implements CommandProcess {
	
	
	
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("CommAction --");
		
		//int id = Integer.parseInt(request.getParameter("id"));
		int id = 1111;
		int newMsg = 0;
		DeviceDao dd = DeviceDao.getInstance();
		List<SMS> smsList = dd.getNewSMS(id);
		request.setAttribute("smsList", smsList);
		System.out.println(smsList.get(0).getContent() );
		return "device/notify.jsp";
	}

}
