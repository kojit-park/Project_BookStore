package bmember.model;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myBmember") 
public class BmemberDao {

	private String namespace = "bmember.BmemberBean";
	
	@Autowired // r.x=>SqlSessionTemplate 객체 주입
	SqlSessionTemplate sqlSessionTemplate ;
	//SqlSessionTemplate : mybatis 관련 메서드를 가지고 있는 클래스
	
	
	public BmemberDao() {
		System.out.println("BmemberDao()"); 
	}	
	
	
	public void insertBmember(BmemberBean bmember) {
		int cnt = -1;
		cnt = sqlSessionTemplate.insert(namespace + ".InsertBmember",bmember);
		System.out.println("insertBmember() cnt : " + cnt);
		
	}
	
	public BmemberBean Login(String id) {
		BmemberBean bean = null;
		bean = sqlSessionTemplate.selectOne(namespace + ".Login",	id);
		return bean;
	}
	
	public BmemberBean findid(BmemberBean bmember) {
		BmemberBean bean = null;
		bean = sqlSessionTemplate.selectOne(namespace + ".findid",	bmember);
		return bean;
	}
	
	public BmemberBean findpw(BmemberBean bmember) {
		BmemberBean bean = null;
		bean = sqlSessionTemplate.selectOne(namespace + ".findpw",	bmember);
		return bean;
	}
	
}







