package bmember.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BmemberLogOutController {

	private static final String command = "/logOut.bm";
	private static final String getPage = "redirect:/main.bs";
	
	@RequestMapping(command)
	public String doAction(HttpSession session) {
		session.invalidate();
		return getPage;
	}
}
