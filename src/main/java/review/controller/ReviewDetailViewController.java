package review.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import review.model.Review;
import review.model.ReviewDao;

@Controller
public class ReviewDetailViewController {
	
	private static final String command = "/detail.rv";
	private static final String getPage= "DetailView_Review";
	
	@Autowired
	@Qualifier("myReviewDao")
	private ReviewDao reviewDao;
	
	@RequestMapping(value = command, method =RequestMethod.GET)
	public String doAction(@RequestParam("rnum") int rnum, 
			@RequestParam("category") String category,
			@RequestParam("keyword") String keyword,
			Model model, HttpSession session) {
		
		Review review = reviewDao.GetData(rnum);
		reviewDao.UpdateReadCount(rnum);
		model.addAttribute("review",review);
		model.addAttribute("category",category);
		model.addAttribute("keyword",keyword);
		return getPage;
	}
		
		
	
	
}
