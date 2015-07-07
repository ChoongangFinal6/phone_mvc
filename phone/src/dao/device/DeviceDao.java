package dao.device;

import java.io.Reader;
import java.util.Date;
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
/*	
	// 내가 주고 받은 모든 메세지 조회
	public List<SMS> allMsg(String userId){
		System.out.println("    Dao allMsg : " + userId);
		
		SqlSession session = getSession();
		List<SMS> smsList = session.selectList("SMS.allMsg", userId);
		session.close();
		return smsList;
	}
	*/
	// 대화방 목록 구성
	public List<SMS> listAllChat(String userId){
		System.out.println("    Dao listAllChat : " + userId);
		
		SqlSession session = getSession();
		//List<SMS> allMsgList = session.selectList("SMS.allMsg", userId);	// 모든 문자 조회
		List<SMS> chatList = session.selectList("SMS.listAllChat", userId);		// 문자를 주고 받았던 상대방ID목록 조회	
		
		if(chatList==null ||chatList.size()<0){
			
		} else {
			for( int i = 0; i < chatList.size(); i++) {
				String otherId = chatList.get(i).getRecvId();
				System.out.println(    otherId + "와의 최근 문자 조회");
				SMS temp = new SMS();
				temp.setRecvId(userId);
				temp.setSendId(otherId);
				// 상대방과 주고받은 문자들 중 가장 최근것의 내용 조회
				chatList.set(i,	(SMS) session.selectOne("SMS.lastMsgWith", temp));
				// 그 상대방이 보내온 문자중 아직 읽지 않은 메세지의 갯수
				int numOfNew = (int) session.selectOne("SMS.numOfNewWith", temp);
				chatList.get(i).setNumOfNew(numOfNew);
			}
			// 대화방 리스트를 마지막 메세지의 전송시간을 기준으로 최근순으로 정렬
			for( int i = 0; i < chatList.size(); i++ ){
				SMS temp = null;
				for( int j=i+1; j < chatList.size(); j++ ){
					if( chatList.get(i).getSendDate().before( chatList.get(j).getSendDate() ) ){
						temp = chatList.get(j);
						chatList.set(j, chatList.get(i));
						chatList.set(i, temp);
					}
				}				
			}
			
			// 간략표시용으로 문자내용중 일부분만 잘라냄
			for(SMS sms : chatList){
				sms.setContent( sms.getContent().substring(0, 20)+"..." );
			}
		}
		
		int k=0;
		for(SMS temp: chatList){
			System.out.println(k++ +"_조회 : "+temp );
		}
		
		session.close();
		return chatList;
	}
	
	/*
	public List<SMS> getDialogList(String userId){
		System.out.println("    Dao getDialogList : ");
		
		SqlSession session = getSession();
		List<SMS> msgList = session.selectList("SMS.listNewSMS", userId);
		
		session.close();
		return msgList;
	}
	
	*/
/*	
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
*/
	// 선택한 발신자와의 대화 상세 조회
	public List<SMS> detailSMS(String sendId, String recvId) {
		System.out.println("    SMSDao detailSMS : "+recvId);
		
		SqlSession session = getSession();
		SMS sms = new SMS();
		sms.setSendId(sendId);
		sms.setRecvId(recvId);
		List<SMS> smsList = session.selectList("SMS.detailSMS", sms);	// 조회
		int result = session.update("SMS.setRead", sms); 	// 조회된 문자들을 '읽음(1)'상태로 설정
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
