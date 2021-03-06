package bookstore.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bmember.model.BmemberBean;
import bmember.model.BmemberDao;
import bookstore.model.BookStore;
import bookstore.model.BookStoreDao;

@Controller
public class BookDetailViewController {

	private static final String getPage = "BookDetailView";
	private static final String command = "/detail.bs";
	Boolean usedBookMarket =false;
	
	@Autowired
	@Qualifier("myBookStoreDao")
	private BookStoreDao bookStoreDao;
	
	@Autowired
	@Qualifier("myBmemberDao")
	private BmemberDao bmemberDao;
	
	@RequestMapping(value = command, method =RequestMethod.GET)
	public String doAction(@RequestParam("bnum") int bnum,
			@RequestParam(value = "category", required = false) String category, 
			@RequestParam(value = "keyword", required = false) String keyword, 
			@RequestParam(value = "pageNumber", required = false ) String pageNumber,
			@RequestParam(value = "pageSize", required = false ) String pageSize,
			Model model, HttpSession session) {
		
		BookStore book = bookStoreDao.GetData(bnum);
		Map<String,String> map = bookStoreDao.GetContent(book);
		usedBookMarket =false;
		if(book.getUsedBook() != null) {
			usedBookMarket = true;
		}
		model.addAttribute("usedBookMarket",usedBookMarket);
		model.addAttribute("book",book);
		model.addAttribute("bookIntroduce",map.get("bookIntroduce"));
		model.addAttribute("category",category);
		model.addAttribute("keyword",keyword);
		model.addAttribute("pageNumber",pageNumber);
		model.addAttribute("pageSize",pageSize);
		
		if(session.getAttribute("mobile") != null && ((String)session.getAttribute("mobile")).equals("1")) {
			return "Mobile_BookDetailView";
		}
		
		return getPage;
	}
	
	@RequestMapping("/mini_detail.bs")
	public String AfterMinigame(@RequestParam("ISBN") String ISBN,
			@RequestParam("result") int result,
			Model model,HttpSession session) {
		System.out.println("여기 들어오냐");
		
		if(result >= 1 && session.getAttribute("loginfo") != null) {
			BmemberBean member = (BmemberBean)(session.getAttribute("loginfo"));
			String id = member.getId();
//			int NoUsage = (result==1) ? bmemberDao.UpdatePoint(id, 100):bmemberDao.UpdatePoint(id, 50);
			member = bmemberDao.GetInfo(id);
			session.setAttribute("loginfo", member);
		}
		
		
		BookStore book = bookStoreDao.GetDataByISBN(ISBN);
		Map<String,String> map = bookStoreDao.GetContent(book);
		usedBookMarket =false;
		if(book.getUsedBook() != null) {
			usedBookMarket = true;
		}
		model.addAttribute("usedBookMarket",usedBookMarket);
		model.addAttribute("book",book);
		model.addAttribute("bookIntroduce",map.get("bookIntroduce"));
		
		//model.addAttribute("bookContent",map.get("bookContent"));
		System.out.println("진행 잘되냐?"+book.getTitle());
		return getPage;
	}
	
	@RequestMapping("bestBook.bs")
	public ModelAndView BestBook(@RequestParam("title") String title) {
		ModelAndView mav = new ModelAndView();
		BookStore book = bookStoreDao.GetBestBookFromMain(title);
		Map<String,String> map = bookStoreDao.GetContent(book);
		usedBookMarket =false;
		if(book.getUsedBook() != null) {
			usedBookMarket = true;
		}
		
		mav.addObject("book", book);
		mav.addObject("usedBookMarket",usedBookMarket);
		mav.addObject("bookIntroduce",map.get("bookIntroduce"));
		
		mav.setViewName(getPage);
		
		return mav;
	}
	
}
