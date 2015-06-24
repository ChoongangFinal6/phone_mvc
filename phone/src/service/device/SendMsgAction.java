package service.device;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.device.DeviceDao;
import service.CommandProcess;

public class SendMsgAction implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		String targetId = request.getParameter("targetId");
		String content = request.getParameter("content");
		System.out.println("--SendMsgAction : " + targetId + "에게 전송, 내용-" + content);
		
		DeviceDao ddao = DeviceDao.getInstance();
		
		return "device/device_home.jsp";
	}

}
