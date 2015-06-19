package dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;



import dto.PersonInfo;

public class MemberDao {
	private static MemberDao instance;

	private MemberDao() {

	}

	static public MemberDao getInstance() {
		if (instance == null) {
			instance = new MemberDao();
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


	public int chk(PersonInfo pi) {
		int result = 0;
		SqlSession session = null;
		try {
			session = getSession();
			List<PersonInfo> plist = session.selectList("PersonInfo.select",
					pi.getName());
			
			System.out.println(pi.getName());
			System.out.println(pi.getBirthdate());
			System.out.println(pi.getGender());
			
			
			if(plist.size() >= 1) {
				for (PersonInfo personInfo : plist) {
					//System.out.println("personinfo검사중 ");
					//System.out.println(personInfo.getBirthdate().substring(0, 10) + " VS " + pi.getBirthdate());
				if (personInfo.getBirthdate().substring(0, 10).equals(pi.getBirthdate()) && 
						personInfo.getGender().equals(pi.getGender())) {
					result = 1;
					break;
				}else{
					result = -1;
					//System.out.println("실명x");
				}
				}
			}else{
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

}
