package control;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CommandProcess;


/**
 * @author 윤동혁
 * 요청된 명령을 처리하기 위한 컨트롤러
 */
public class Controller extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private Map<String, Object> commandMap = new HashMap<String, Object>();
	// inti은 doget, dopost 실행하기 직전에 실행된다.
	public void init(ServletConfig config) throws ServletException { 
	   	//web.xml에서 propertyConfig에 해당하는 init-param 의 값을 읽어옴
	   	String props = config.getInitParameter("config");
	    Properties pr = new Properties();//명령어와 처리클래스의 매핑정보를 저장할 Properties객체 생성
	    // Properties는 map계열인데 키 value 가 아니라 key=값이다
	    FileInputStream f = null;
	    try {
	          String configFilePath = 
	         		config.getServletContext().getRealPath(props);
	          f = new FileInputStream(configFilePath);
	          pr.load(f);//Command.properties파일의 정보를  Properties객체에 저장
	     } catch (IOException e) { throw new ServletException(e);
	     } finally {
	          if (f != null) try { f.close(); } catch(IOException ex) {}
	     }
	     Iterator keyIter = pr.keySet().iterator();//Iterator객체는 Enumeration객체를 확장시킨 개념의 객체
	     while( keyIter.hasNext() ) {//객체를 하나씩 꺼내서 그 객체명으로 Properties객체에 저장된 객체에 접근
	          String command = (String)keyIter.next(); // /list.do
	          String className = pr.getProperty(command); // controlls.MessageProcess
	                                          //key를 주면 값이 들어온다.        
	          try {
	               Class commandClass = Class.forName(className);//해당 문자열을 클래스로 만든다.
	               Object commandInstance = commandClass.newInstance();//해당클래스의 객체를 생성
	               commandMap.put(command, commandInstance);// Map객체인 commandMap에 객체 저장
	          } catch (Exception e) {
	               throw new ServletException(e);
	          }
	     }
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	        requestPro(request, response);
	}
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	       requestPro(request, response);
	}
	//시용자의 요청을 분석해서 해당 작업을 처리
	private void requestPro(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String view = null;
	    CommandProcess com = null;
	    try {	String command = request.getRequestURI();
			System.out.println("command: " + command);  // /ch15/message.do
			//	System.out.println(request.getContextPath()); // /ch15
			//	System.out.println(command.indexOf(request.getContextPath()));  // 0
	       //  if (command.indexOf(request.getContextPath()) == 0) {
	              command = command.substring(request.getContextPath().length());
	              System.out.println("command2: " + command);
	         // }
	              
	          com = (CommandProcess)commandMap.get(command);  
	          view = com.requestPro(request, response);
	    } catch(Throwable e) { throw new ServletException(e); }
	    
	    System.out.println("===========1" + view);
	    RequestDispatcher dispatcher;
	    request.setAttribute("viewPage", view);
	    dispatcher=request.getRequestDispatcher("/template/index.jsp");

	    dispatcher.forward(request, response);
	}
}
