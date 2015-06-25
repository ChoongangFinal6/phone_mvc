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
 * @author 장우진
 *	DB에서 수신된 전체 문자를 조회 
 */
public class ListSMSAction implements CommandProcess{

	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("  ListSMSAction : ");
		
		String recvId = (String) request.getSession().getAttribute("id");
		DeviceDao ddao = DeviceDao.getInstance();
		List<SMS> smsList = ddao.listNewSMS(recvId);		
		
		request.setAttribute("smsList", smsList);
		return "device/SMSList.jsp";
	}

}
