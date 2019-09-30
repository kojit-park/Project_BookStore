package bsmall.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import bmember.model.BmemberBean;
import bookstore.model.BookStoreDao;
import orderlist.model.OrderList;
import orderlist.model.OrderListDao;


@Controller
public class OrderMallController {
	private static final String command = "/order.bsmall";
	private static final String getPage = "ShopList"; //주문내역
	
	@Autowired
	@Qualifier("myOrderListDao")
	private OrderListDao orderListDao;
	
	@Autowired
	@Qualifier("myBookStoreDao")
	private BookStoreDao bookStoreDao; 
	
	@RequestMapping(value=command)
	public String doAction(HttpSession session, Model model) {
		System.out.println("orderDao");
		
		BmemberBean loginfo = (BmemberBean)session.getAttribute("loginfo");
		
		if(loginfo == null) {
			session.setAttribute("destination", "redirect:/order.bsmall" );
			return "redirect:/login.bm" ;
		}
		else {
			List<OrderList> lists = orderListDao.OrderList(loginfo.getId());
			
			model.addAttribute("lists",lists);
			
			return getPage;
		}
	}
}
