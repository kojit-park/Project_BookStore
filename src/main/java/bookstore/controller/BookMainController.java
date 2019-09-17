package bookstore.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BookMainController {
	
	private static final String command = "/main.bs";
	private static final String getPage = "BookStore_Main";
	
	@RequestMapping(value=command , method=RequestMethod.GET)
	public ModelAndView doAction(@RequestParam(value = "mobile", required = false ) String mobile,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		System.out.println("메인 가는중");
		
		if(session.getAttribute("mobile") == null) {
			session.setAttribute("mobile", mobile);
					if(session.getAttribute("mobile") != null && ((String)session.getAttribute("mobile")).equals("1")) {
						System.out.println("모바일 페이지로");
						mav.setViewName("BookStore_Mobile_Main");
						return mav;
					}
					
		}else {
			System.out.println("모바일 페이지로");
			mav.setViewName("BookStore_Mobile_Main");
			return mav;
		}
		
		mav.setViewName(getPage);
		return mav;
	}
}
