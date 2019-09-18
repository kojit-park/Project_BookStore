package reply.controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import reply.model.Reply;
import reply.model.ReplyDao;

@Controller
public class ReplyInsertController {

	private static final String command = "/reply.rpl";
	
	@Autowired
	@Qualifier("myReplyDao")
	private ReplyDao replyDao;
	
	@RequestMapping(command)
	public ModelAndView doAction(
			@ModelAttribute("reply") @Valid Reply reply, 
			HttpServletRequest request, BindingResult result
			) {
		ModelAndView mav = new ModelAndView();
		
		int totalReplyCount = replyDao.GetReplyTo(reply.getRpnum());
		
		if(totalReplyCount >0) {
			
			
			
		}
		
		return mav;
	}
}

