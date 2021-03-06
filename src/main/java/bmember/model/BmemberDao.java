package bmember.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("myBmemberDao") 
public class BmemberDao {

	private final String namespace = "bmember.model.BmemberBean";
	
	@Autowired // r.x=>SqlSessionTemplate 객체 주입
	SqlSessionTemplate sqlSessionTemplate ;
	//SqlSessionTemplate : mybatis 관련 메서드를 가지고 있는 클래스
	
	
	public void insertBmember(BmemberBean bmember) {
		int cnt = -1;
		cnt = sqlSessionTemplate.insert(namespace + ".InsertBmember",bmember);
		System.out.println("insertBmember() cnt : " + cnt);
		
	}
	
	public BmemberBean Login(String id,String pw) {
		Map<String,String> map = new HashMap<String,String>();
		map.put("id", id);
		map.put("pw", pw);
		BmemberBean bean = null;
		bean = sqlSessionTemplate.selectOne(namespace + ".Login",	map);
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
	
	public BmemberBean GetInfo(String id) {
		BmemberBean bean = null;
		bean = sqlSessionTemplate.selectOne(namespace+".GetInfo",id);
		return bean;
	}
	
	public int IDJB(String id) {
		System.out.println("dao 도착");
		
		return sqlSessionTemplate.selectOne(namespace + ".IDJB",id);
		
	}

	public int GetTotalCount(Map<String, String> map){
		int cnt = sqlSessionTemplate.selectOne(namespace+".GetTotalCount",map);
		return cnt;
	}
	
	public List<BmemberBean> GetMemberList(Paging pageInfo,Map<String, String> map){
		
		List<BmemberBean> lists = new ArrayList<BmemberBean>();
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		lists = sqlSessionTemplate.selectList(namespace+".GetMemberList",map,rowBounds);
		System.out.println(lists.size());
		return lists;
	}
	
	public int UpdatePoint(String id,int point) {
		Map<String,String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("point", ""+point);
		int ud =sqlSessionTemplate.update(namespace+".UpdatePoint",map);
		return ud;
	}
	
	public List<BmemberBean> GetAll(){
		List<BmemberBean> lists = new ArrayList<BmemberBean>();
		lists = sqlSessionTemplate.selectList(namespace+".GetAll");
		return lists;
	}
	
	public int IssueTempPassword(int num,String TempPassword) {
		int cnt = 0;
		Map<String, String> map = new HashMap<String, String>();
		map.put("num", num+"");
		map.put("TempPassword", TempPassword);
		cnt = sqlSessionTemplate.update(namespace+".IssueTempPassword",map);
		System.out.println("1이면 성공임~ ㅅㄱ "+cnt);
		return cnt;
	}
	
	public void UpdatePassword(BmemberBean bean) {
		sqlSessionTemplate.update(namespace+".UpdatePassword",bean);
	}
	
	
}







