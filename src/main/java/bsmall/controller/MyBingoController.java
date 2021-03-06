package bsmall.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import bmember.model.BmemberBean;
import bmember.model.BmemberDao;
import bookstore.model.BookStore;
import bookstore.model.BookStoreDao;
import order.model.Order;
import order.model.OrderDao;

@Controller
public class MyBingoController {

	private static final String command = "/bingo.bsmall";
	private static final String getPage = "Bingo";
	
	@Autowired
	@Qualifier("myOrderDao")
	private OrderDao orderDao;
	
	@Autowired
	@Qualifier("myBookStoreDao")
	private BookStoreDao bookStoreDao;
	
	@Autowired
	@Qualifier("myBmemberDao")
	private BmemberDao bmemberDao;
	
	@RequestMapping(command)
	public ModelAndView doAction(HttpSession session) {
		Boolean[] bingo = new Boolean[9];
			Arrays.fill(bingo, Boolean.FALSE);
		ModelAndView mav = new ModelAndView();
		BmemberBean loginfo = (BmemberBean)session.getAttribute("loginfo");
		List<String> checkCategory1 = new ArrayList<String>();
			checkCategory1.add("총류");
			checkCategory1.add("철학");
			checkCategory1.add("언어");
			checkCategory1.add("사회과학");
			
		List<String> checkCategory2 = new ArrayList<String>();
			checkCategory2.add("역사");
			checkCategory2.add("예술");
		
		List<Order> lists = orderDao.OrderMall(loginfo.getId());
		List<BookStore> books = bookStoreDao.BingoCheck(lists);
		
		int conditions = books.size();
		
		switch(conditions) {
		case 0:
			break;
		case 1:
			bingo[0] = true;
			break;
		case 2:
			bingo[0] = true; bingo[3] = true;
			break;
		default:
			bingo[0] = true; bingo[3] = true; bingo[6] = true;
		}
		
		for(BookStore bs:books) {
				bingo[1] = bs.getCategory().contains("문학");
				bingo[8] = bs.getCategory().contains("과학");
				bingo[2] = checkCategory1.contains(bs.getCategory());
				bingo[7] = checkCategory2.contains(bs.getCategory());
			
			System.out.println(bs.getPubdate());
				bingo[5] = bs.getPubdate().contains("2019");
				String month = bs.getPubdate().substring(5,8);
				
				if(month.contains("7") || month.contains("8") || month.contains("9") ) {
					bingo[4] = true;
				}
				
		}
		int count = 0;
		if(bingo[0] && bingo[1] && bingo[2]) {
			count ++;
		}
		if(bingo[3] && bingo[4] && bingo[5]) {
			count ++;
		}
		if(bingo[6] && bingo[7] && bingo[8]) {
			count ++;
		}
		if(bingo[0] && bingo[3] && bingo[6]) {
			count ++;
		}
		if(bingo[1] && bingo[4] && bingo[7]) {
			count ++;
		}
		if(bingo[2] && bingo[5] && bingo[8]) {
			count ++;
		}
		if(bingo[0] && bingo[4] && bingo[8]) {
			count ++;
		}
		if(bingo[2] && bingo[4] && bingo[6]) {
			count ++;
		}
		
		if(session.getAttribute("bingoCheck") == null) {
			BmemberBean member = (BmemberBean)(session.getAttribute("loginfo"));
			String id = member.getId();
			int point = count * 500;
			bmemberDao.UpdatePoint(id, point);
			member = bmemberDao.GetInfo(id);
			session.setAttribute("bingoCheck", 1);
			session.setAttribute("loginfo",member);
		}
		
		mav.addObject("count",count);
		mav.addObject("bingo", bingo);
		
		mav.setViewName(getPage);
		
		return mav;
	}
	
}
