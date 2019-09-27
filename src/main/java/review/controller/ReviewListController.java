package review.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import reply.model.ReplyDao;
import review.model.Review;
import review.model.ReviewDao;
import utility.Paging;

@Controller
public class ReviewListController {

	private static final String command = "/list.rv";
	private static final String getPage= "List_Review";
	
	@Autowired
	@Qualifier("myReplyDao")
	private ReplyDao replyDao;
	
	@Autowired
	@Qualifier("myReviewDao")
	private ReviewDao reviewDao;
	
	
	@RequestMapping(command)
	public ModelAndView doAction(
			@RequestParam(value = "category", required = false) String category, 
			@RequestParam(value = "keyword", required = false) String keyword, 
			@RequestParam(value = "pageNumber", required = false ) String pageNumber,
			@RequestParam(value = "pageSize", required = false ) String pageSize,
			@RequestParam(value = "mobile", required = false ) String mobile,
			HttpSession session,
			HttpServletRequest request
			) {
		ModelAndView mav = new ModelAndView();
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("category", category);
		map.put("keyword", "%"+keyword+"%");
		
		int totalCount = reviewDao.GetTotalCount(map);
		System.out.println(totalCount+"ㅏㅏㅏㅏㅏ");
		String url = request.getContextPath() + "/" + command;
		Paging pageInfo = new Paging(pageNumber, pageSize, totalCount, url, category, keyword, null);
		
		List<Review> reviewLists = reviewDao.GetDataList(pageInfo,map);
		
		for(Review rv :reviewLists) {
			//Review missed = reviewDao.GetDataMissed(rv.getRnum());
			
			System.out.println(rv.getBooktitle()+"////"+rv.getRegdate());
			
			int replyCount = replyDao.GetReplyTo(rv.getRnum());
			rv.setReplycount(replyCount);
			//rv.setReg_date(missed.getReg_date());
			//rv.setBook_title(missed.getBook_title());
		}
		
		mav.addObject("reviewList",reviewLists);
		mav.addObject("totalCount",totalCount);
		mav.addObject("pageInfo",pageInfo);
		
		
		
		mav.setViewName(getPage);
		return mav;
	}
	
	
}
