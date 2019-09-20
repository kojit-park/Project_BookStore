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
public class CartAddController {
	
	private static final String command = "/add.bsmall";
	private static final String gotoPage = "redirect:/list.bsmall";
	private static final String getPage = "redirect:/list.bs";
	
	@Autowired
	@Qualifier("myBookStoreDao")
	private BookStoreDao bookStoreDao;
	
	@RequestMapping(command)
	public String doAction(@RequestParam(value="bnum")int bnum,@RequestParam(value="oqty") int oqty, HttpSession session,HttpServletResponse response) {
		
		BookStore book = bookStoreDao.GetData(bnum);
		System.out.println("bo"+bnum+","+oqty);
		int flag = 0;
		
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
			flag = mycart.AddOrder(bnum,oqty,book.getStock());
			session.setAttribute("mycart", mycart);
			session.setAttribute("mycart", mycart);
			session.setAttribute("title", book.getTitle());
			
			if(flag==0) {
				return getPage;
			}
			
			return gotoPage;
		}
	}
}

