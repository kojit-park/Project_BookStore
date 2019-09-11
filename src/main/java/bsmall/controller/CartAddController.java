package bsmall.controller;


import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import bsmall.cart.MyCartList;

@Controller
public class CartAddController {
	
	private static final String command = "/add.bsmall";
	private static final String gotoPage = "redirect:/list.bsmall";
	
	@RequestMapping(command)
	public String doAction(int bnum,int oqty, HttpSession session,HttpServletResponse response) {
		
		System.out.println("bo"+bnum+","+oqty);
		if(session.getAttribute("loginfo") == null) {
			session.setAttribute("destination","redirect:/detail.bs?pmkey="+bnum);
			return "redirect:/login.bm";
		}
		else {
			MyCartList mycart = (MyCartList)session.getAttribute("mycart");
			
			if(mycart == null) {
				mycart = new MyCartList();
			}
			mycart.AddOrder(bnum,oqty);
			session.setAttribute("mycart", mycart);
			
			return gotoPage;
		}
	}
}
