package dao.device;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import dto.SMS;

public class DeviceDao {
	private static DeviceDao instance;
	
	public static DeviceDao getInstance() {
		if (instance == null) {
			instance = new DeviceDao();
		}
		return instance;
	}

	
	private SqlSession getSession() {
		SqlSession session = null;
		Reader r = null;

		try {
			r = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory sf = new SqlSessionFactoryBuilder().build(r);
			session = sf.openSession(true); 	// true : auto commit 설정
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return session;
	}
	
	// 새로 수신된 문자의 수를 조회
	public int getNewSMS(int recvId){
		System.out.print("--SMSDao newSMS : ");
		SqlSession session = getSession();
		int result = 0;
		result = (int) session.selectOne("SMS.newSMS", recvId);
		session.close();
		System.out.println("result: " + result);
		return result;
	}
	

	// 새로 수신된 문자 목록 조회
	public List<SMS> listNewSMS(int recvId){
		System.out.println("--SMSDao listSMS : "+recvId);
		
		SqlSession session = getSession();		
		List<SMS> senderList = session.selectList("SMS.listNewSenders", recvId);
		List<SMS> msgList = session.selectList("SMS.listNewSMS", recvId);

		for(int i = 0; i<senderList.size(); i++){
			int num = 0;
			for(SMS msg : msgList){
				if(senderList.get(i).getSendId()==msg.getSendId()){
					num++;
					senderList.set(i, msg);
					senderList.get(i).setNumOfNew(num);
				}
			}
			System.out.println("발신자:"+senderList.get(i).getSendId() +
					", 새문자수:"+senderList.get(i).getNumOfNew() +
					", 내용:"+senderList.get(i).getContent());
		}
		session.close();		
		return senderList;
	}

	// 선택한 발신자와의 대화목록 조회
	public List<SMS> detailSMS(int sendId, int recvId) {
		System.out.println("--SMSDao detailSMS : "+recvId);
		
		SqlSession session = getSession();
		SMS sms = new SMS();
		sms.setSendId(sendId);
		sms.setRecvId(recvId);
		List<SMS> smsList = session.selectList("SMS.detailSMS", sms);	// 조회
//		int result = session.update("SMS.setRead", sms); 	// 조회된 문자들을 '읽음(1)'상태로 설정
		return smsList;
	}
	
}
