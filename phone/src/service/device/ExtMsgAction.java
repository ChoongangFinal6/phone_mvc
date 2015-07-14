package service.device;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CommandProcess;
import dao.device.DeviceDao;
import dto.SMS;
// 외부에서의 문자전송 요청 처리
public class ExtMsgAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// http://211.183.2.53:8181/phone/ext/sendMsg.do?sendId=010-1111-5555&targetId=010-0000-2222&content=ABCDEFGHIJKLMNOP
		String sendId = request.getParameter("sendId");
		String targetId = request.getParameter("targetId");
		String content = request.getParameter("content");
		System.out.println("	ExtMsgAction : from " + sendId + " to " + targetId);
		
		DeviceDao ddao = DeviceDao.getInstance();
		SMS newMsg = new SMS(sendId, targetId, content);
		int result = ddao.sendNewMsg(newMsg);			
	
		return "ext/";
	}

}

/* 		
// Construct data
        String data = URLEncoder.encode("sendId", "UTF-8") + "=" + URLEncoder.encode("010-1111-5555", "UTF-8");
        data += "&" + URLEncoder.encode("targetId", "UTF-8") + "=" + URLEncoder.encode("010-0000-2222", "UTF-8");
        data += "&" + URLEncoder.encode("content", "UTF-8") + "=" + URLEncoder.encode("TEST MSG Content", "UTF-8");
        System.out.println("전송Test:"+data);
        URL url = new URL("http://211.183.2.53:8181/phone/ext/sendMsg.do");
        URLConnection conn = url.openConnection();
        conn.setDoOutput(true);
        OutputStreamWriter wr = new OutputStreamWriter(conn.getOutputStream());
        wr.write(data);
        wr.flush();
		
        // Get the response
        BufferedReader rd = new BufferedReader(new InputStreamReader(conn.getInputStream(),"UTF-8"));
        String line;
        while ((line = rd.readLine()) != null) {
           System.out.println(line);
        }
        wr.close();
        rd.close();
*/