package bookstore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bookstore.model.BookStoreDao;

@Controller
public class BookInsertController {

	private static final String command = "/insert.bs";
	private static final String gotoPage = "redirect:/list.bs"; 
	private static final String getPage = "InsertBook"; 
	
	@Autowired
	@Qualifier("myBookStoreDao")
	private BookStoreDao bookStoreDao;
	
	@RequestMapping(value = command,method=RequestMethod.GET)
	public ModelAndView doAction(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName(getPage);
		System.out.println("인서트 가는중");
		return mav;
	}
	
	
	@RequestMapping(value = command ,method=RequestMethod.POST)
	public ModelAndView doAction(@RequestParam("ISBN") String ISBN) {
		ModelAndView mav = new ModelAndView();
		bookStoreDao.InsertData(ISBN);
		
		mav.setViewName(gotoPage);
		return mav;
		
	}
	
	
	
}
