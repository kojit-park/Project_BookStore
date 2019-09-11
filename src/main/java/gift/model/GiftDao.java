package gift.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("MyGiftDao")
public class GiftDao {
	private final String namespace = "gift.model.Gift";
	
	@Autowired	
	SqlSessionTemplate sqlSessionTemplate;
	
	public int GetTotalCount(Map<String, String> map) {
		int cnt = -1;
		cnt = sqlSessionTemplate.selectOne(namespace+".GetTotalCount", map);
		return cnt;
	}

	public List<Gift> GetDataList(Paging pageInfo, Map<String, String> map) {
		List<Gift> lists = new ArrayList<Gift>();
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(), pageInfo.getLimit() );
		lists = sqlSessionTemplate.selectList(namespace + ".GetDataList", map, rowBounds);
		return lists;
	}

	public Gift GetData(int gnum) {
		Gift bean = sqlSessionTemplate.selectOne(namespace + ".GetData", gnum);
		return bean;
	}

	public void DeleteData(int gnum) {
		sqlSessionTemplate.delete(namespace+".DeleteData", gnum);
		
	}

	public void InsertData(Gift gift) {
		sqlSessionTemplate.insert(namespace + ".InsertData", gift);
	}

	public void UpdateData(Gift gift) {
		sqlSessionTemplate.update(namespace + ".UpdateData", gift);
		
	}
	
}
