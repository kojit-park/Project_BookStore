package bsmall.controller;


import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import bookstore.model.BookStore;
import bookstore.model.BookStoreDao;
import bsmall.cart.MyCartList;

@Controller
public class CartUpdateController {
	
	private static final String command = "/update.bsmall";
	private static final String gotoPage = "redirect:/list.bsmall";
	private static final String getPage = "redirect:/list.bs";
	
	
	@Autowired
	@Qualifier("myBookStoreDao")
	private BookStoreDao bookStoreDao;
	
	@RequestMapping(command)
	public String doAction(@RequestParam(value="bnum")int bnum,
			@RequestParam(value="qty") int oqty, 
			HttpSession session,HttpServletResponse response) {
		System.out.println("cartDelete");
		System.out.println();
		
		BookStore book = bookStoreDao.GetData(bnum);
		
		if(oqty>book.getStock()){
			return getPage;
		}
		
		if(session.getAttribute("loginfo") == null) {
			session.setAttribute("destination","redirect:/detail.bs?pmkey="+bnum);
			return "redirect:/login.bm";
		}
		
		
		else {
			
			MyCartList mycart = (MyCartList)session.getAttribute("mycart");
			
			if(mycart == null) {
				mycart = new MyCartList();
			}
			mycart.updateOrder(bnum,oqty);
			session.setAttribute("mycart", mycart);
			
			return gotoPage;
		}
	}
}
