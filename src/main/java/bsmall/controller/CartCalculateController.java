package bsmall.controller;

import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import bmember.model.BmemberBean;
import bookstore.model.BookStore;
import bookstore.model.BookStoreDao;
import bsmall.cart.MyCartList;
import order.model.OrderDao;

@Controller
public class CartCalculateController {
	
	private static final String command = "/calculate.bsmall"; // MallList.jsp
	private static final String gotoPage = "redirect:/main.bs"; 
	
	@Autowired
	@Qualifier("myBookStoreDao")
	private BookStoreDao bookStoreDao;
	
	@Autowired
	@Qualifier("myOrderDao")
	private OrderDao orderDao;
	
	@RequestMapping(value=command)
	public String doAction(HttpSession session, HttpServletResponse response) {
		
		BmemberBean member = (BmemberBean)session.getAttribute("loginfo");
		
//		int maxoid = orderDao.getMaxOrderId(); 
		
		MyCartList mycart = (MyCartList)session.getAttribute("mycart");
		Map<Integer,Integer> orderlists = mycart.getAllOrder();
		
		Set<Integer> keylist = orderlists.keySet(); 
		
		for(Integer bnum:keylist) { // stock setting
			Integer qty = orderlists.get(bnum);
			
			BookStore bean = bookStoreDao.GetData(bnum);
			int price = bean.getPrice();
			
			orderDao.insertData(member.getId(),bnum,price,qty); 
			
			bookStoreDao.updateStock(bnum,qty);
		}
		
		session.removeAttribute("mycart");
		return gotoPage;
	}
	
}