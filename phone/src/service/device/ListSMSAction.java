package service.device;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		
		System.out.println("-ListSMSAction : ");
		
		//int recvId = Integer.parseInt(request.getParameter("recvId"));
		int recvId = 2222;
		
		DeviceDao ddao = DeviceDao.getInstance();
		List<SMS> smsList = ddao.listNewSMS(recvId);		
		
		/*
		HashMap<Long , Integer> sendIdMap = new HashMap<Long , Integer>();
		HashMap<Long , String> newestMsgMap = new HashMap<Long , String>();
		
		for(int i=0; i < smsList.size(); i++){
			// 해시맵에 [발신자 : 그 발신자가 보낸 메세지의 수]를 저장하고 가장 최근의 메세지의 내용을 저장
			sendIdMap.put((long) smsList.get(i).getSendId(), sendIdMap.getOrDefault((long)smsList.get(i).getSendId(), 0)+1);
			newestMsgMap.put((long) smsList.get(i).getSendId(), smsList.get(i).getContent());
		}*/
		
		request.setAttribute("smsList", smsList);
		return "device/SMSList.jsp";
	}

}
