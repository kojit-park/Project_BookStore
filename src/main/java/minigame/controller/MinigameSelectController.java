package minigame.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import minigame.model.MiniGame;
import minigame.model.MiniGameDao;

@Controller
public class MinigameSelectController {
	
	private static final String command = "/minigame_select.mg";
	private static final String getPage= "MiniGame";
	
	@Autowired
	@Qualifier("myMiniGameDao")
	private MiniGameDao miniGameDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doActionGET() {
		return "Select_Char";
	}
	
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public ModelAndView doAction(
			@RequestParam(value = "category", required = false) String category, 
			@RequestParam(value = "keyword", required = false) String keyword, 
			@RequestParam(value = "category2", required = false) String category2, 
			@RequestParam(value = "keyword2", required = false) String keyword2, 
			HttpServletRequest request
			) {
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("category", category);
		map.put("keyword", "%"+keyword+"%");
		System.out.println("카테고리 키워드"+category+"//"+keyword);
		String char1 = miniGameDao.GetCharacter(map);
		
		char1 = (char1 ==null) ? "1111111111111" : char1;
		
		keyword = miniGameDao.GetCollectTitle(map);
		keyword = (keyword ==null) ? "그런 책 없음" : keyword;
		
		System.out.println("잘나왔나 확인1"+char1+"//"+keyword);
		map.put("category", category2);
		map.put("keyword", "%"+keyword2+"%");
		System.out.println("카테고리2 키워드2"+category2+"//"+keyword2);
		String char2 = miniGameDao.GetCharacter(map);
		keyword2 = miniGameDao.GetCollectTitle(map);
		System.out.println("잘나왔나 확인2"+char2+"//"+keyword2);
		
		MiniGame mini1 = new MiniGame(keyword,char1);
		MiniGame mini2 = new MiniGame(keyword2,char2);
		
		
		ModelAndView mav = new ModelAndView();
		
		
		mav.addObject("mini1", mini1);
		mav.addObject("mini2", mini2);
		
		mav.setViewName(getPage);
		System.out.println("출발출발");
		return mav;
	}

}
