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
 *	다른 사람과 주고받은 메세지들을 조회해 [대화상대ID, 최근송수신문자내용, 시간, 아직 읽지않은 문자갯수]로 이루어진 리스트를 구성  
 */
public class ListSMSAction implements CommandProcess{

	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("  ListSMSAction : ");
		
		String userId = (String) request.getSession().getAttribute("id");
		DeviceDao ddao = DeviceDao.getInstance();
//		List<SMS> smsList = ddao.listNewSMS(recvId);		
		List<SMS> smsList = ddao.listAllChat(userId);		
		
		request.setAttribute("smsList", smsList);
		return "device/SMSList.jsp";
	}

}
