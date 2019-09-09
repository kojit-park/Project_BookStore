package bookstore.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BookMainController {
	
	private static final String command = "/main.bs";
	private static final String getPage = "BookStore_Main";
	
	@RequestMapping(value=command , method=RequestMethod.GET)
	public ModelAndView doAction() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName(getPage);
		System.out.println("메인 가는중");
		return mav;
	}
}
