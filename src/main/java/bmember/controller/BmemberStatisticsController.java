package bmember.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.support.StaticMessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import bmember.model.BmemberBean;
import bmember.model.BmemberDao;

@Controller
public class BmemberStatisticsController {

	private static final String command = "/statisticsMember.bm";
	private static final String getPage = "BmemberStatisticsView";
	
	@Autowired
	@Qualifier("myBmemberDao")
	private BmemberDao bmemberDao;
	
	@RequestMapping(command)
	public ModelAndView doAction() {
		ModelAndView mav = new ModelAndView();
		
		List<BmemberBean> list = bmemberDao.GetAll();
		Map<String,Integer> memberBySex = new HashMap<String, Integer>();
		memberBySex.put("남", 0);
		memberBySex.put("여", 0);
		Map<String,Integer> memberByGenre = new HashMap<String, Integer>();
		Map<String,Integer> memberByBirth = new HashMap<String, Integer>();
		String sex ="";
		String genre = "";
		String ageGroup = "";
		int birth = 0;
		
		for(BmemberBean bean: list) {
			sex = bean.getGender();
			genre = bean.getGenre();
			birth = (2019-Integer.parseInt(bean.getBirth().substring(0,4))+1)/10;
			ageGroup = (birth*10)+"대";
			
			if(birth == 0) {
				ageGroup = "10세 이하";
			}else if(birth >6) {
				ageGroup = "70대 이상";
			}
			System.out.println(sex);
			memberBySex.replace(sex, (memberBySex.get(sex)+1));
			
			if(!memberByGenre.containsKey(genre)) {
				memberByGenre.put(genre, 1);
			}else {
				memberByGenre.replace(genre, (memberByGenre.get(genre)+1));
			}
			
			if(memberByBirth.containsKey(ageGroup)) {
				memberByBirth.replace(ageGroup, (memberByBirth.get(ageGroup)+1));
			}else {
				memberByBirth.put(ageGroup, 1);
			}
			
		}
		
		Map<String, Integer> SortedAgeMap = new TreeMap<String, Integer>(memberByBirth);
		
		mav.addObject("memberByBirth",SortedAgeMap);
		mav.addObject("memberByGenre",memberByGenre);
		mav.addObject("memberBySex", memberBySex);
		
		mav.setViewName(getPage);
		
		return mav;
	}
	
	
	
}
