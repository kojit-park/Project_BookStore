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
	
	@RequestMapping(value=command,method=RequestMethod.POST) 
	public ModelAndView doAction( BmemberBean Bmember, HttpServletResponse response, HttpSession session) throws IOException{
		response.setCharacterEncoding("UTF-8"); 
		response.setContentType("text/html; charset=UTF-8");
		
		System.out.println(this.getClass() + " POST");
		
		System.out.println(Bmember.getId());
		System.out.println(Bmember.getPw());
		
		BmemberBean findpw = bmemberDao.findpw(Bmember); 
		System.out.println("findpw:"+findpw);
		
		PrintWriter writer;
		writer = response.getWriter();
		ModelAndView mav = new ModelAndView();
		if(findpw == null) {
			System.out.println("존재하지 않는 패스워드");
			writer.print("<script type='text/javascript'>");
			writer.print("alert('입력한 정보와 일치하는 회원 정보가 없습니다.');");
			writer.print("</script>");
			writer.flush();
			
			return new ModelAndView(getPage);
			
		}
		else {
			System.out.println("존재하는 패스워드");
			writer.print("<script type='text/javascript'>");
			writer.print("alert('가입하신 이메일 주소로 \n 비밀번호가 전송되었습니다.');");
			writer.print("</script>");
			writer.flush();
			BmemberPasswordSender bps = new BmemberPasswordSender();
			String mailAddr = findpw.getEmail1()+"@"+findpw.getEmail2();
			String TempPassword = ((int)(Math.random()*1000)+1000)+"";
			int chk = 0;
			chk = bps.PassSend(mailAddr, TempPassword);
			if(chk == 1) {
				bmemberDao.IssueTempPassword(findpw.getNum(),TempPassword);
			}
			
			mav.setViewName("BmemberLoginform");
		}
		return mav;
	}
	
}
