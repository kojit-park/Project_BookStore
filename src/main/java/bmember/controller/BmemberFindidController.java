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
public class BmemberFindidController {
	
	private static final String command = "/findid.bm";
	private static final String getPage = "findid";
	private static final String gotoPage = "redirect:/main.bm";
	
	@Autowired
	@Qualifier("myBmemberDao")
	private BmemberDao bmemberDao;
	
	@RequestMapping(value=command,method=RequestMethod.GET) 
	public String doAction() {
		return getPage;
	}
	
	@RequestMapping(value=command,method=RequestMethod.POST) 
	public ModelAndView doAction( BmemberBean Bmember, HttpServletResponse response, HttpSession session) throws IOException{
		System.out.println(this.getClass() + " POST ��� ����");
		
		System.out.println(Bmember.getName());
		System.out.println(Bmember.getEmail1());
		
		BmemberBean login = bmemberDao.findid(Bmember);
		System.out.println("login:"+login);
		
		PrintWriter writer;
		writer = response.getWriter();
		ModelAndView mav = new ModelAndView();
		if(login == null) {
			System.out.println("�������� �ʴ� ���̵�");
			writer.print("<script type='text/javascript'>");
			writer.print("alert('�Է��� ������ ��ġ�ϴ� ȸ�� ������ �����ϴ�.');");
			writer.print("</script>");
			writer.flush();
			
			return new ModelAndView(getPage);
			
		}
		else {
			System.out.println("�����ϴ� ���̵�");
			
			session.setAttribute("loginfo", login);
			mav.setViewName((String)session.getAttribute("destination"));
			
		}
		return mav;
	}
	
}













