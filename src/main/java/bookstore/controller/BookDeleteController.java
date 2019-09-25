package bookstore.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bookstore.model.BookStoreDao;

@Controller
public class BookDeleteController {
	
	private static final String getPage = "BookList";
	private static final String command = "/delete.bs";
	
	@Autowired
	@Qualifier("myBookStoreDao")
	private BookStoreDao bookStoreDao;
	
	@RequestMapping(command)
	public ModelAndView doAction(
			@RequestParam(value = "pageNumber", required = false ) String pageNumber,
			@RequestParam(value = "pageSize", required = false ) String pageSize,
			@RequestParam(value = "bnum", required = true ) int bnum,
			@RequestParam(value = "category", required = true ) String category,
			@RequestParam(value = "keyword", required = true ) String keyword,
			HttpServletRequest request
			) {
		
		ModelAndView mav = new ModelAndView();
		
		bookStoreDao.DeleteBook(bnum);
		
		mav.addObject("category", category);
		mav.addObject("keyword",keyword);
		mav.addObject("pageSize",pageSize);
		mav.addObject("pageNumber",pageNumber);
		
		mav.setViewName(getPage);
		
		return mav;
	}
}
