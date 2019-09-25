package bookstore.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import bmember.model.BmemberBean;
import bookstore.model.BookStore;
import bookstore.model.BookStoreDao;

@Controller
public class RegisteredUsedBookController {

	private static final String command = "/registeredBookList.bs";
	private static final String getPage= "RegisteredUsedBook";
	
	@Autowired
	@Qualifier("myBookStoreDao")
	private BookStoreDao bookStoreDao;
	
	@RequestMapping(command)
	public ModelAndView doAction(
			HttpSession session
			) throws IOException{
		ModelAndView mav = new ModelAndView();
		BmemberBean bean = (BmemberBean)session.getAttribute("loginfo");
		String id = "%"+bean.getId()+"%";
		List<BookStore> lists = bookStoreDao.GetUsedBookListById(id);
		for(BookStore bs : lists) {
			String[] users = bs.getUsedBook().split(",");
			String[] userprice = bs.getUsedBookPrice().split(",");
			
			for(int i=0;i<users.length;i++) {
				if(users[i].equals(bean.getId())) {
					bs.setUsedBookPrice(userprice[i]);
				}
			}
			
			
		}
		
		mav.addObject("usedBook",lists);
		mav.setViewName(getPage);
		
		return mav;
	}
}
