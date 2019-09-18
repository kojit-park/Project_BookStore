package review.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import review.model.Review;
import review.model.ReviewDao;

@Controller
public class ReviewUpdateController {
	
	private static final String getPage = "redirect:/list.rv";
	private static final String command = "/update.rv";
	
	@Autowired
	@Qualifier("myReviewDao")
	private ReviewDao reviewDao;
	
	@RequestMapping(value = command, method =RequestMethod.POST)
	public ModelAndView doActionPost(
			@ModelAttribute("review") @Valid Review review,
			@RequestParam("category") String category,
			@RequestParam("keyword") String keyword,
			HttpSession session, BindingResult result) {
		System.out.println("업데이트포");
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("category",category);
		mav.addObject("keyword",keyword);
		
		if(result.hasErrors()) {
			System.out.println("뭔가 안썼음");
			mav.setViewName("redirect:/update.rv");
			return mav;
		}
		
		if(review.getBooktitle() == null) {
			review.setBooktitle("잡담");
		}
		reviewDao.UpdateReview(review);
		
		mav.setViewName(getPage);
		return mav;
	}
	
	
	@RequestMapping(value = command, method =RequestMethod.GET)
	public String doAction(@RequestParam("rnum") int rnum, 
			@RequestParam("category") String category,
			@RequestParam("keyword") String keyword,
			Model model, HttpSession session) {
		System.out.println("업데이트겟");
		
		Review review = reviewDao.GetData(rnum);
		
		model.addAttribute("review",review);
		model.addAttribute("category",category);
		model.addAttribute("keyword",keyword);
		
		
		return "Update_Review";
	}
}
