package bmember.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sun.org.glassfish.gmbal.GmbalMBeanNOPImpl;

import bmember.model.BmemberBean;
import bmember.model.BmemberDao;
import bmember.model.BmemberPasswordSender;

@Controller
public class BmemberFindpwController {
	
	private static final String command = "/findpw.bm";
	private static final String getPage = "findpw";
	
	@Autowired
	@Qualifier("myBmemberDao")
	private BmemberDao bmemberDao;
	
	@RequestMapping(value=command,method=RequestMethod.GET) 
	public String doAction() {
		return getPage;
	}
	
	@RequestMapping(value="/newPassWord.bm",method=RequestMethod.GET) 
	public ModelAndView doAction( 
			@RequestParam("id") String id,
			@RequestParam("name") String name,
			@RequestParam("email1") String email1,
			@RequestParam("email2") String email2,
			HttpServletResponse response, HttpSession session) throws IOException{
		ModelAndView mav = new ModelAndView();
		mav.addObject("name",name);
		mav.addObject("id",id);
		mav.addObject("email1",email1);
		mav.addObject("email2",email2);
		
			mav.setViewName("resultpw");
		return mav;
	}
	
	@RequestMapping(value="/changePassword.bm",method=RequestMethod.POST) 
	public ModelAndView ChangePassword(
			BmemberBean Bmember
			) throws IOException{
		ModelAndView mav = new ModelAndView();
		
		bmemberDao.UpdatePassword(Bmember);
		
		mav.setViewName("redirect:/login.bm");
		return mav;
	}
	
	
	
}
