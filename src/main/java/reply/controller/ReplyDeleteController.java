package reply.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import reply.model.ReplyDao;
import review.model.ReviewDao;

@Controller
public class ReplyDeleteController {

	private static final String command = "/delete.rpl";
	
	@Autowired
	@Qualifier("myReplyDao")
	private ReplyDao replyDao;
	
	@Autowired
	@Qualifier("myReviewDao")
	private ReviewDao reviewDao;
	
	@RequestMapping(command)
	public String doAction(
			@RequestParam("rnum") int rnum,
			@RequestParam("rpnum") int rpnum,
			@RequestParam("category") String category,
			@RequestParam("keyword") String keyword
			) {
		System.out.println("잘 들어옴?"+rpnum+"//"+category+"//"+rnum);
		replyDao.DeleteReply(rpnum);
		reviewDao.UpdateDeletedReply(rnum);
		
		String address = "redirect:/detail.rv?rnum="+rnum;
		address += "&category="+category+"&keyword="+keyword;
		
		return address;
	}
	
}
