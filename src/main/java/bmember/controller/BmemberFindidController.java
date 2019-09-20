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

import bmember.model.BmemberBean;
import bmember.model.BmemberDao;

@Controller
public class BmemberFindidController {
	
	private static final String command = "/findid.bm";
	private static final String getPage = "findid";
	
	@Autowired
	@Qualifier("myBmemberDao")
	private BmemberDao bmemberDao;
	
	@RequestMapping(value=command,method=RequestMethod.GET) 
	public String doAction() {
		return getPage;
	}
	
	@RequestMapping(value=command,method=RequestMethod.POST) 
	public ModelAndView doAction( 
			@RequestParam(value = "name", required = false) String name,
			@RequestParam(value = "email1", required = false) String email1, 
			@RequestParam(value = "email2", required = false) String email2, 
			HttpServletResponse response, HttpSession session) throws IOException{
		System.out.println(this.getClass() + " POST");
		
		response.setCharacterEncoding("UTF-8"); 
		response.setContentType("text/html; charset=UTF-8");
		
		System.out.println(name+"//"+email1+email2);
		BmemberBean Bmember = new BmemberBean();
		Bmember.setName(name);
		Bmember.setEmail1(email1);
		Bmember.setEmail2(email2);
		
		BmemberBean findid = bmemberDao.findid(Bmember);
		System.out.println("findid:"+findid);
		
		PrintWriter writer;
		writer = response.getWriter();
		ModelAndView mav = new ModelAndView();
		if(findid == null) {
			System.out.println("존재하지 않는 아이디");
			writer.print("<script type='text/javascript'>");
			writer.print("alert('입력한 정보와 일치하는 회원 정보가 없습니다.');");
			writer.print("</script>");
			writer.flush();
			
			return new ModelAndView(getPage);
			
		}
		else {
			System.out.println("존재하는 아이디");
			
			writer.print("<script type='text/javascript'>");
			writer.print("alert('입력한 정보와 일치하는 회원 정보가 있습니다.');");
			writer.print("</script>");
			writer.flush();
			
			mav.addObject("findid", findid);
			mav.setViewName("resultid");
		}
		return mav;
	}
	
}













