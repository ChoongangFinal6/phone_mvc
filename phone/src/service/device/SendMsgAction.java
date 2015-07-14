package service.device;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CommandProcess;
import dao.device.DeviceDao;
import dto.SMS;

// 핸드폰 모듈에서의 문자전송 처리
public class SendMsgAction implements CommandProcess{

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		String sendId = (String) request.getSession().getAttribute("id");
		String targetId = request.getParameter("targetId");
		String content = request.getParameter("content");
		System.out.println("  SendMsgAction : " + targetId + "에게 문자전송");
		
		DeviceDao ddao = DeviceDao.getInstance();
		SMS newMsg = new SMS(sendId, targetId, content);
		// 문자 전송
		int result = ddao.sendNewMsg(newMsg);			
		// 전송 후 다시 문자송수신내역 조회
		List<SMS> smsList = ddao.detailSMS(targetId, sendId);
		
		request.setAttribute("id", sendId);
		request.setAttribute("sendId", targetId);
		request.setAttribute("smsList", smsList);
		if(result==1){
			request.setAttribute("resultMsg", "전송 완료");
		}else {
			request.setAttribute("resultMsg", "전송 실패");
		}
		
		
		
        
		return "device/SMSDetail.jsp";
	}

}
