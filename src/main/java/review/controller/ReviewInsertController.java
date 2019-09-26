package review.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import review.model.Review;
import review.model.ReviewDao;

@Controller
public class ReviewInsertController {

	private static final String command = "/insert.rv";
	
	@Autowired
	@Qualifier("myReviewDao")
	private ReviewDao reviewDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public ModelAndView doActionGET(@RequestParam(value="booktitle",required=false) String booktitle) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("booktitle", booktitle);
		mav.setViewName("Insert_Review");
		return mav;
	}
	
	@RequestMapping(value=command, method=RequestMethod.POST)
	public ModelAndView doAction(
			@ModelAttribute("review") @Valid Review review, 
			HttpServletRequest request, BindingResult result
			) {
		
		ModelAndView mav = new ModelAndView();
		
		if(result.hasErrors()) {
			System.out.println("뭔가 안썼음");
			mav.setViewName("Insert_Review");
			return mav;
		}
		
		if(review.getBooktitle() == null) {
			review.setBooktitle("잡담");
		}
		System.out.println(review.getBooktitle()+"//"+review.getWriter()+"//"+review.getContent()+"//"+review.getRnum()+"//"+review.getSubject());
		
		reviewDao.InsertReview(review);
		mav.setViewName("redirect:/list.rv");
		
		return mav;
	}
}
