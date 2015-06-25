package service.device;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import service.CommandProcess;
import dao.device.DeviceDao;
import dto.SMS;

/**
 * @author 
 *	선택한 사용자와의 문자 대화목록을 조회
 */
public class DetailSMSAction implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		System.out.print("  DetailSMSAction : ");
		String id = (String) request.getSession().getAttribute("id");		
		String sendId = request.getParameter("sendId");
	
		
		DeviceDao ddao = DeviceDao.getInstance();
		List<SMS> smsList = ddao.detailSMS(sendId, id);
		System.out.println("대화목록-" + smsList.size());
		
		request.setAttribute("id", id);
		request.setAttribute("sendId", sendId);
		request.setAttribute("smsList", smsList);
		return "device/SMSDetail.jsp";
	} 
 
}
