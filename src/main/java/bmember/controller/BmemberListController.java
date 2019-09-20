package bmember.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bmember.model.BmemberBean;
import bmember.model.BmemberDao;
import utility.Paging;

@Controller
public class BmemberListController {

	private static final String command="/list.bm";
	private static final String getPage="BmemberList";
	
	@Autowired
	private BmemberDao bmemberDao;
	
	@RequestMapping(value=command)
	public ModelAndView doAction(
			@RequestParam(value="category",required=false) String category,
			@RequestParam(value="keyword",required=false) String keyword,
			@RequestParam(value="pageNumber",required=false) String pageNumber,
			@RequestParam(value="pageSize",required=false) String pageSize,
			HttpServletRequest request, Model model 
			) {
		
		Map<String, String> map = new HashMap<String, String>();
		
		if(category == null) {
			category = "";
			keyword = "";
		}
		map.put("category", category); // category=null
		map.put("keyword", "%"+keyword+"%");  //keyword=null
		 
		int totalCount = bmemberDao.GetTotalCount(map);
		System.out.println("totalCount:"+totalCount);
		
		String url = request.getContextPath() + command; 
		System.out.println("url : " + url); 
	
		Paging pageInfo = new Paging(pageNumber,pageSize,totalCount,url,category,keyword,null);
		System.out.println("offset : " + pageInfo.getOffset()); //2=>2, 5=>8
		System.out.println("limit : " + pageInfo.getLimit());

		List<BmemberBean> memberLists = bmemberDao.GetMemberList(pageInfo,map);
		System.out.println("갯수 : "+memberLists.size()); 
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("memberLists", memberLists);
		mav.addObject("pageInfo", pageInfo);
		
		mav.setViewName(getPage);
		return mav;
	}
}







