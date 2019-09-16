package bmember.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class BmembermainController {

	private static final String command = "/main.bm";
	private static final String getPage = "BmemberMain";

	@RequestMapping(value=command, method = RequestMethod.GET)
	public String doAction(Model model) {
		
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName(getPage);
		return null; 
		
		
	}
}








