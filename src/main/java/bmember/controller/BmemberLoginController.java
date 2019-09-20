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
import org.springframework.web.servlet.ModelAndView;

import bmember.model.BmemberBean;
import bmember.model.BmemberDao;

@Controller
public class BmemberLoginController {
	
	private static final String command = "/login.bm";											
	private static final String getPage = "BmemberLoginform";										   
	private static final String gotoPage = "redirect:/main.bs";
	
	@Autowired
	@Qualifier("myBmemberDao")
	private BmemberDao bmemberDao;
	
	@RequestMapping(value=command,method=RequestMethod.GET) 
	public String doAction() {
		return getPage;
	}
	 
	@RequestMapping(value=command,method=RequestMethod.POST) 
	public ModelAndView doAction( BmemberBean Bmember, HttpServletResponse response, HttpSession session) throws IOException{
		System.out.println(this.getClass() + " POST");
		
		System.out.println(Bmember.getId());
		System.out.println(Bmember.getPw());
		
		BmemberBean login = bmemberDao.Login(Bmember.getId(),Bmember.getPw());
		System.out.println("login:"+login);
		
		PrintWriter writer;
		writer = response.getWriter();
		ModelAndView mav = new ModelAndView();
		if(login == null) {
			System.out.println("존재하지 않는 회원");
			writer.print("<script type='text/javascript'>");
			writer.print("alert('해당 아이디가 존재하지 않습니다.');");
			writer.print("</script>");
			writer.flush();
			
			return new ModelAndView(getPage);
			
		}
		else {
			session.setAttribute("loginfo", login);
			if(session.getAttribute("destination") == null || session.getAttribute("destination").equals("")) {
				mav.setViewName(gotoPage);
			}else {
				mav.setViewName((String)session.getAttribute("destination"));
			}
			
		}
		return mav;
	}
	
}













