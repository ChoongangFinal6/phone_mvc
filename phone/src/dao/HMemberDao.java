package dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import dto.HMember;
import dto.PersonInfo;

public class HMemberDao {
	private static HMemberDao instance;

	private HMemberDao() {

	}

	static public HMemberDao getInstance() {
		if (instance == null) {
			instance = new HMemberDao();
		}
		return instance;
	}

	private SqlSession getSession() {
		SqlSession session = null;
		Reader r = null;
		try {
			r = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory sf = new SqlSessionFactoryBuilder().build(r);
			session = sf.openSession(true);
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
		return session;
	}

	// 개인정보 인증
	public int chk(PersonInfo pi) {
		int result = 0;
		SqlSession session = null;
		try {
			session = getSession();
			List<PersonInfo> plist = session.selectList("PersonInfo.select",
					pi.getName());
			/*
			 * System.out.println(pi.getName());
			 * System.out.println(pi.getBirthdate());
			 * System.out.println(pi.getGender());
			 */
			if (plist.size() >= 1) {
				for (PersonInfo personInfo : plist) {
					// System.out.println("personinfo검사중 ");
					// System.out.println(personInfo.getBirthdate().substring(0,
					// 10) + " VS " + pi.getBirthdate());
					if (personInfo.getBirthdate().substring(0, 10)
							.equals(pi.getBirthdate())
							&& personInfo.getGender().equals(pi.getGender())) {
						result = 1;
						break;
					} else {
						result = -1;
						// System.out.println("실명x");
					}
				}
			} else {
				result = -1;
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (session != null)
				session.close();
		}
		return result;
	}

	// 회원 가입
	public int insert(HMember hmember) {
		int result = 0;
		SqlSession session = null;
		System.out.print("memberdao : ");
		session = getSession();
		int max = Integer.parseInt(session.selectOne("HMember.max").toString());
		HMember hm = hmember;

		hm.sethNo(max + 1);
		System.out.println("hm :" + max + " / " + hm.gethNo());

		result = session.insert("HMember.insert", hm);
		session.close();

		return result;
	}

	// 아이디 중복 확인
	public int idChk(String id) {
		int result = 0;
		SqlSession session = null;
		session = getSession();
		/*System.out.println("dao id :" + id);*/
		String chkid = "";
		chkid = (String) session.selectOne("HMember.idchk",id);
		System.out.println("chkid:"+chkid);
		if(chkid==null){
			result = 0;
		}else if(chkid.equals("")){ //혹시 모르니까 ""을 해준다. 값이 없고 형태 , " "값은 있고 형태도 있다.  
			result = 0; 
		}else{
			result = 1;
		}
	
		session.close();
		return result;
	}
    // 로그인

	public int loginchk(HMember hm) {
		System.out.println("Dao loginchk :" + hm.getId());
		
		int result = 0;
		SqlSession session = null;
		session = getSession();
		String password = (String) session.selectOne("HMember.loginchk",hm.getId());
		System.out.println("pass :" + password);
		
		if(password==null||password==""){
			result = -1;	// id없는경우	
		} else if( password.equals(hm.getPassword()) ){ 
			result = 1;		// 패스워드일치
		} else{
			result = 0;		// 패스워드 불일치
		}
		
		return result;
	}

	public String namechk(String id) {
		String name = null;
		SqlSession session = null;
		session = getSession();
		
		name = (String) session.selectOne("Hmember.namechk",id);
		
		return name;
	}

}
