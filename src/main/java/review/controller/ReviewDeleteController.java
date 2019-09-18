package review.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import review.model.ReviewDao;

@Controller
public class ReviewDeleteController {

	private static final String getPage = "redirect:/list.rv";
	private static final String command = "/delete.rv";
	
	@Autowired
	@Qualifier("myReviewDao")
	private ReviewDao reviewDao;
	
	@RequestMapping(command)
	public String doAction(@RequestParam("rnum") int rnum, 
			@RequestParam("category") String category,
			@RequestParam("keyword") String keyword,
			Model model, HttpSession session) {
		
		reviewDao.DeleteReview(rnum);
		model.addAttribute("category",category);
		model.addAttribute("keyword",keyword);
		
		return getPage;
	}
}
