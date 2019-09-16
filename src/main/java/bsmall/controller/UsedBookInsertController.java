package bsmall.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bmember.model.BmemberBean;
import bookstore.model.BookStore;
import bookstore.model.BookStoreDao;

@Controller
public class UsedBookInsertController {
	
	private static final String command = "/usedBook.bsmall";
	private static final String gotoPage = "redirect:/main.bs"; 
	private static final String getPage = "InsertUsedBook";
	
	@Autowired
	@Qualifier("myBookStoreDao")
	private BookStoreDao bookStoreDao;
	
	@RequestMapping(value = command,method=RequestMethod.GET)
	public ModelAndView doAction(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName(getPage);
		System.out.println("중고서적 등록페이지 가는중");
		return mav;
	}
	
	@RequestMapping(value = command ,method=RequestMethod.POST)
	public ModelAndView doAction(
			@RequestParam("ISBN") String ISBN,
			@RequestParam("price") String price,
			HttpSession session,HttpServletResponse response
									)throws IOException {
		ModelAndView mav = new ModelAndView();
		BmemberBean login = (BmemberBean)session.getAttribute("loginfo");
		String id = login.getId();
		PrintWriter writer=response.getWriter();
		BookStore bs = bookStoreDao.GetDataByISBN(ISBN);
		if(bs == null) {
			System.out.println("등록되지 않은 책입니다");
			writer.print("<script type='text/javascript'>");
			writer.print("alert('No such Book Exist.');");
			writer.print("location.href = 'main.bs'");
			writer.print("</script>");
			writer.flush();
			writer.close();
		}
		String usedBook = bs.getUsedBook();
		String usedBookPrice = bs.getUsedBookPrice();
		if(usedBook == null) {
			usedBook = id;
			usedBookPrice = price;
		}else {
			usedBook += (","+ id);
			usedBookPrice += (","+price);
		}
		bookStoreDao.InsertUsedBook(bs.getTitle(),usedBookPrice,usedBook);
		
		mav.setViewName(gotoPage);
		return mav;
		
	}
	
}
