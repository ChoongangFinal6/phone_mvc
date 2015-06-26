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
	public int getNumOfNew(String userId){
		System.out.print("    Dao getNumOfNew : " + userId + "에게 온 새 메세지 - ");
		
		SqlSession session = getSession();
		int result = 0;
		result = (int) session.selectOne("SMS.getNumOfNew", userId);
		session.close();
		System.out.println(result + "개");
		return result;
	}
	
	// 대화한 상대방 목록 조회
	public List<SMS> listAllMsg(String userId){
		System.out.println("    Dao listAllMsg : ");
		
		SqlSession session = getSession();
		List<SMS> smsList = session.selectList("SMS.listAllMsg", userId);
		List<String> dialogList = null;
		for(SMS sms : smsList){
			// 내게 온 메세지 중 읽지 않은 것들 검사
			if( sms.getRecvId().equals(userId) && sms.getRead().equals('0')){
				
			}
		}
		return smsList;
	}
	
	
	public List<SMS> getDialogList(String userId){
		System.out.println("    Dao getDialogList : ");
		
		SqlSession session = getSession();
		List<SMS> msgList = session.selectList("SMS.listNewSMS", userId);
		
		session.close();
		return msgList;
	}
	
	
	
	// 발신자별로 새 문자 목록 조회
	public List<SMS> listNewSMS(String recvId){
		System.out.println("    Dao listSMS : ");
		
		SqlSession session = getSession();
		// 새 문자를 보낸 발신자들을 조회
		List<SMS> senderList = session.selectList("SMS.listNewSenders", recvId);
		// 모든 새 문자들을 조회
		List<SMS> msgList = session.selectList("SMS.listNewSMS", recvId);

		// 발신자별로, 읽지않은 문자들의 갯수와 가장 최근에 수신한 문자의 정보를 저장
		for(int i = 0; i<senderList.size(); i++){
			int num = 0;
			for(SMS msg : msgList){
				if( senderList.get(i).getSendId().equals(msg.getSendId()) ){
					num++;
					senderList.set(i, msg);
					senderList.get(i).setNumOfNew(num);
				}
			}
			System.out.println("     발신자:"+senderList.get(i).getSendId() +
					", 새문자수:"+senderList.get(i).getNumOfNew() +
					", 최근내용:"+senderList.get(i).getContent());
		}
		session.close();
		return senderList;
	}

	// 선택한 발신자와의 대화 상세 조회
	public List<SMS> detailSMS(String sendId, String recvId) {
		System.out.println("    SMSDao detailSMS : "+recvId);
		
		SqlSession session = getSession();
		SMS sms = new SMS();
		sms.setSendId(sendId);
		sms.setRecvId(recvId);
		List<SMS> smsList = session.selectList("SMS.detailSMS", sms);	// 조회
//		int result = session.update("SMS.setRead", sms); 	// 조회된 문자들을 '읽음(1)'상태로 설정
		return smsList;
	}

	// 새 문자 전송
	public int sendNewMsg(SMS newMsg) {
		System.out.print("    Dao sendNewMsg, 받는사람:" + newMsg.getRecvId());
		
		int result = 0;
		SqlSession session = getSession();
		result = session.insert("SMS.sendNewMsg", newMsg);
		
		System.out.println(", 결과:" + result);
		return result;
	}
	
}
