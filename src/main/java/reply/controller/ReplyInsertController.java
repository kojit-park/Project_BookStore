package reply.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import reply.model.Reply;
import reply.model.ReplyDao;
import review.model.ReviewDao;

@Controller
public class ReplyInsertController {

	private static final String command = "/reply.rpl";
	
	@Autowired
	@Qualifier("myReplyDao")
	private ReplyDao replyDao;
	
	@Autowired
	@Qualifier("myReviewDao")
	private ReviewDao reviewDao;
	
	@RequestMapping(command)
	public String doAction(
			@ModelAttribute("reply") @Valid Reply reply,
			@RequestParam("category") String category,
			@RequestParam("keyword") String keyword
			) {
		
		replyDao.InsertReply(reply);
		reviewDao.UpdateReplyCount(reply.getReplyto());
		
		String address = "redirect:/detail.rv?rnum="+reply.getReplyto();
		address += "&category="+category+"&keyword="+keyword;
		
		return address;
	}
}

