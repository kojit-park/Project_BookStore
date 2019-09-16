package bookstore.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bmember.model.BmemberBean;
import bmember.model.BmemberDao;
import bookstore.model.BookStore;
import bookstore.model.BookStoreDao;
import bookstore.model.UsedBookMarket;

@Controller
public class UsedBookListController {

	private static final String command = "/usedBookList.bs";
	private static final String getPage= "UsedBookList";
	
	@Autowired
	@Qualifier("myBookStoreDao")
	private BookStoreDao bookStoreDao;
	
	@Autowired
	@Qualifier("myBmember")
	private BmemberDao bmemberDao;
	
	@RequestMapping(command)
	public ModelAndView doAction(
			@RequestParam("bnum") int bnum,
			HttpServletResponse response,
			HttpSession session
			) throws IOException{
		ModelAndView mav = new ModelAndView();
		
		BookStore bs = bookStoreDao.GetData(bnum);
		PrintWriter writer=response.getWriter();
		
		if(bs.getUsedBook() == null) {
			System.out.println("중고책 없음");
			writer.print("<script type='text/javascript'>");
			writer.print("alert('중고책이 없습니다.');");
			writer.print("location.href = 'main.bs'");
			writer.print("</script>");
			writer.flush();
			writer.close();
		}
		
		
		String[] users = bs.getUsedBook().split(",");
		String[] usersPrice = bs.getUsedBookPrice().split(",");
		BmemberBean bean = null;
		String Contact = "";
		List<UsedBookMarket> lists = new ArrayList<UsedBookMarket>();
		
	//	Map<String, Integer> usedBook = new HashMap<String, Integer>();
		
		for(int i =0;i<users.length;i++) {
			bean = bmemberDao.GetInfo(users[i]);
			Contact = bean.getEmail1()+"@"+bean.getEmail2();
			UsedBookMarket ubm = new UsedBookMarket();
			ubm.setUser(users[i]);
			ubm.setPriceWanted(Integer.parseInt(usersPrice[i]));
			ubm.setContactNumber(Contact);
			lists.add(ubm);
		}
		
		mav.addObject("usedBook", lists);
		mav.addObject("title",bs.getTitle());

		mav.setViewName(getPage);
		
		return mav;
	}
	
}
