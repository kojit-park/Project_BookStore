package review.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import utility.Paging;

@Component("myReviewDao") 
public class ReviewDao {
	
	private String namespace = "review.model.Review";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public void InsertReview(Review review) {
		sqlSessionTemplate.insert(namespace + ".InsertReview",review);
	}
	
	public int GetTotalCount(Map<String, String> map) {
		int cnt = -1;
		cnt = sqlSessionTemplate.selectOne(namespace + ".GetTotalCount", map);
		return cnt;
	}
	
	public List<Review> GetDataList(Paging pageInfo,Map<String, String> map){
		List<Review> lists = new ArrayList<Review>();
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		
		lists = sqlSessionTemplate.selectList(namespace + ".GetDataList", map,rowBounds );
		
		return lists;
	}
	
	public Review GetData(int rnum) {
		Review review = sqlSessionTemplate.selectOne(namespace+".GetData",rnum);
		System.out.println(review.getBooktitle()+"//"+review.getRegdate()+"//"+review.getReplycount());
		return review;
	}
	
	public void UpdateReadCount(int rnum) {
		sqlSessionTemplate.update(namespace+".UpdateReadCount",rnum);
	}
	
	public void DeleteReview(int rnum) {
		sqlSessionTemplate.delete(namespace+".DeleteReview",rnum);
	}
	
	public void UpdateReview(Review review) {
		sqlSessionTemplate.update(namespace+".UpdateReview",review);
	}
	
	public Review GetDataMissed(int rnum) {
		Review rv = sqlSessionTemplate.selectOne(namespace+".GetDataMissed",rnum);
		return rv; 
	}
}
