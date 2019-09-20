package reply.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myReplyDao")
public class ReplyDao {
	
	private final String namespace = "reply.model.Reply";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public int GetReplyTo(int rnum) {
		int cnt = -1;
		cnt = sqlSessionTemplate.selectOne(namespace + ".GetReplyTo", rnum);
		return cnt;
	}
	
	public List<Reply> GetReplyList(int rnum){
		List<Reply> lists = new ArrayList<Reply>();
		lists = sqlSessionTemplate.selectList(namespace+".GetReplyList",rnum);
		return lists;
	}
	
	public void InsertReply(Reply reply) {
		sqlSessionTemplate.insert(namespace+".InsertReply",reply);
	}
	
	public void DeleteReply(int rpnum) {
		sqlSessionTemplate.delete(namespace+".DeleteReply",rpnum);
	}

	public Reply GetReply(int rpnum) {
		Reply reply = sqlSessionTemplate.selectOne(namespace+".GetReply",rpnum);
		return reply;
	}
}
