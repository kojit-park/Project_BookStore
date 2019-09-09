package bmember.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import bmember.model.BmemberBean;
import bmember.model.BmemberDao;

@Controller
public class BmemberInsertController {
	
	private static final String command = "/insert.bm";
	private static final String getPage = "BmemberInsertform";
	private static final String gotoPage = "redirect:/main.bm";
	
	@Autowired
	private BmemberDao bmemberDao;
	
	@RequestMapping(value=command,method=RequestMethod.GET) 
	public String doAction() {
		return getPage;
	}
	
	@RequestMapping(value=command,method=RequestMethod.POST) 
	public ModelAndView doAction(  @ModelAttribute("bmember") @Valid BmemberBean bmember , BindingResult result ) { 
		// BindingResult 하나의 bean으로 묶을때 문제가 발생했는지 아닌지
		ModelAndView mav = new ModelAndView();
		if(result.hasErrors()) {
			System.out.println("유효성 검사 오류");
			mav.setViewName(getPage);
			return mav;
		}
		
		bmemberDao.insertBmember(bmember);
		mav.setViewName(gotoPage);
		return mav;
		
		
	}
	
}













