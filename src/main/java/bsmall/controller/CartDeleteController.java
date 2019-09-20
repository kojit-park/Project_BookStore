package bsmall.controller;



import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import bookstore.model.BookStore;
import bookstore.model.BookStoreDao;
import bsmall.cart.MyCartList;

@Controller
public class CartDeleteController {
	
	private static final String command = "/delete.bsmall";
	private static final String gotoPage = "redirect:/list.bsmall";
	private static final String getPage = "redirect:/list.bs";
	
	
	@Autowired
	@Qualifier("myBookStoreDao")
	private BookStoreDao bookStoreDao;
	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public String doAction(@RequestParam(value="bnum")int bnum,@RequestParam(value="oqty") int oqty, HttpSession session,HttpServletResponse response) {
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
			mycart.removeOrder(bnum);
			session.setAttribute("mycart", mycart);
			
			return gotoPage;
		}
	}
	
	@RequestMapping(value="/deleteall.bsmall")
	public @ResponseBody String doAction(HttpSession session, HttpServletResponse response,
			@RequestParam(value="bnum",required=true) List<Integer> bnum) {
		System.out.println(bnum);
		String result = null;
		
		if(session.getAttribute("loginfo") == null) {
			session.setAttribute("destination","redirect:/detail.bs?pmkey="+bnum);
			return result;
		}
		
		
		else {
			
			MyCartList mycart = (MyCartList)session.getAttribute("mycart");
			
			if(mycart == null) {
				mycart = new MyCartList();
			}
			
			mycart.removeAll(bnum);
			
			session.setAttribute("mycart", mycart);
			return result;
		}
	}
}