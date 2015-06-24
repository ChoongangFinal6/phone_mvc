package service.device;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CommandProcess;
import dao.device.DeviceDao;
import dto.SMS;

public class ReadSMSAction implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("-ReadSMSAction : ");
		
		int sendId = Integer.parseInt(request.getParameter("sendId"));
		DeviceDao ddao = DeviceDao.getInstance();
		List<SMS> smsList = ddao.readSMS(sendId);
		
		return "device/SMSDetail.jsp";
	} 
 
}
