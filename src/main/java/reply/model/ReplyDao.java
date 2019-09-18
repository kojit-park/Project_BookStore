package reply.model;

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

}
