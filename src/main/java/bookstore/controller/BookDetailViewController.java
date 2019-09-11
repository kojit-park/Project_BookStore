package bookstore.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import bookstore.model.BookStore;
import bookstore.model.BookStoreDao;

@Controller
public class BookDetailViewController {

	private static final String getPage = "BookDetailView";
	private static final String command = "/detail.bs";
	
	@Autowired
	@Qualifier("myBookStoreDao")
	private BookStoreDao bookStoreDao;
	
	@RequestMapping(value = command, method =RequestMethod.GET)
	public String doAction(@RequestParam("bnum") int bnum, Model model) {
		
		BookStore book = bookStoreDao.GetData(bnum);
		Map<String,String> map = bookStoreDao.GetContent(book);
		model.addAttribute("book",book);
		model.addAttribute("bookIntroduce",map.get("bookIntroduce"));
		//model.addAttribute("bookContent",map.get("bookContent"));
		
		return getPage;
	}
	
	@RequestMapping("/mini_detail.bs")
	public String AfterMinigame(@RequestParam("ISBN") String ISBN, Model model) {
		System.out.println("여기 들어오냐");
		BookStore book = bookStoreDao.GetDataByISBN(ISBN);
		Map<String,String> map = bookStoreDao.GetContent(book);
		model.addAttribute("book",book);
		model.addAttribute("bookIntroduce",map.get("bookIntroduce"));
		//model.addAttribute("bookContent",map.get("bookContent"));
		System.out.println("진행 잘되냐?"+book.getTitle());
		return getPage;
	}
	
}
