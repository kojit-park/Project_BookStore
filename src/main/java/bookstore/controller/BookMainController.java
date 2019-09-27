package bookstore.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bookstore.model.BookStoreDao;
import orderlist.model.OrderList;
import orderlist.model.OrderListDao;

@Controller
public class BookMainController {
	
	private static final String command = "/main.bs";
	private static final String getPage = "BookStore_Main";
	
	@Autowired
	@Qualifier("myBookStoreDao")
	private BookStoreDao bookStoreDao;

	@Autowired
	@Qualifier("myOrderListDao")
	private OrderListDao orderListDao;

	
	@RequestMapping(value=command , method=RequestMethod.GET)
	public ModelAndView doAction(@RequestParam(value = "mobile", required = false ) String mobile,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		if(mobile !=null) {
			System.out.println("여기는메인////"+mobile);
		}
		if(session.getAttribute("mobile")!= null) {
			System.out.println("메인체크1"+(String)session.getAttribute("mobile"));
		}
		
		
		if(session.getAttribute("mobile") == null ||((String)session.getAttribute("mobile")).equals("")) {
			System.out.println("메인체크2"+(String)session.getAttribute("mobile"));
			session.setAttribute("mobile", mobile);
					if(session.getAttribute("mobile") != null && ((String)session.getAttribute("mobile")).equals("1")) {
						System.out.println("모바일 페이지로");
						mav.setViewName("BookStore_Mobile_Main");
						return mav;
					}
					
		}else {
			System.out.println("메인체크3"+(String)session.getAttribute("mobile"));
			System.out.println("모바일 페이지로");
			mav.setViewName("BookStore_Mobile_Main");
			return mav;
		}
		if(mobile !=null) {
			System.out.println("여기는메인2////"+mobile);
		}
		if(session.getAttribute("mobile")!= null) {
			System.out.println((String)session.getAttribute("mobile"));
		}
		
		
		
		List<OrderList> IncomePerBook = new ArrayList<OrderList>();
		IncomePerBook =orderListDao.IncomeCheckByBook();
		
		List<String> bestSellers = new ArrayList<String>();
		bestSellers = bookStoreDao.GetBestSeller(IncomePerBook);
		mav.addObject("BestSellers",bestSellers);
		
		mav.setViewName(getPage);
		return mav;
	}
}
