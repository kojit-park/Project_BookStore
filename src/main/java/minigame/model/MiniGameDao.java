package minigame.model;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import bookstore.model.BookCrawler;
import bookstore.model.BookStore;

@Component("myMiniGameDao")
public class MiniGameDao {

	private final String namespace = "minigame.model.MiniGame";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public String GetCharacter(Map<String, String> map){
		String ISBN = sqlSessionTemplate.selectOne(namespace+".GetCharacter",map);
		
		return ISBN;
	}
	
	public String GetCollectTitle(Map<String, String> map){
		String Chara = sqlSessionTemplate.selectOne(namespace+".GetCollectTitle",map);
		
		return Chara;
	}
	

}
