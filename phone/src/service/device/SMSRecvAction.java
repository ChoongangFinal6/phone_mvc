package service.device;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CommandProcess;
import dao.device.DeviceDao;
import dto.SMS;

/**
 * @author 우진
 *	새로온 메세지가 몇 개인지 조회
 */
public class SMSRecvAction implements CommandProcess {
	
	
	
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		System.out.println("  SMSRecvAction");
		
		String recvId = (String) request.getSession().getAttribute("id");
		DeviceDao dd = DeviceDao.getInstance();
		int newMsg = dd.getNumOfNew(recvId);
		request.setAttribute("newMsg", newMsg);
		
		return "device/notify.jsp";
	}

}
