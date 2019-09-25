package bookstore.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import bmember.model.BmemberBean;
import bookstore.model.BookStore;
import bookstore.model.BookStoreDao;

@Controller
public class DeleteUsedBookController {

	private static final String command = "/deleteUsedBook.bs";
	private static final String getPage= "redirect:/main.bs";
	
	@Autowired
	@Qualifier("myBookStoreDao")
	private BookStoreDao bookStoreDao;

	@RequestMapping(command)
	public String doAction(
			@RequestParam("bnum") int bnum,
			HttpSession session
			) throws IOException{
		
		BmemberBean bean = (BmemberBean)session.getAttribute("loginfo");
		BookStore book = bookStoreDao.GetData(bnum);
		Map<String, String> map = new HashMap<String, String>();
		
		if(book.getUsedBook().contains(",")) {
			
			String[] users = book.getUsedBook().split(",");
			String[] userprice = book.getUsedBookPrice().split(",");
			
			List<String> keys = new ArrayList<String>();
			List<String> vals = new ArrayList<String>();
			
			for(int i=0;i<users.length;i++) {
				if(users[i].equals(bean.getId())) {
					userprice[i] =null;
					users[i] = null;
				}
				if(users[i] !=null && users[i].length()>0) {
					keys.add(users[i]);
					vals.add(userprice[i]);
				}
				
			}
			
			users = keys.toArray(new String[keys.size()]);
			userprice = vals.toArray(new String[vals.size()]);
			
			String user = Arrays.toString(users);
			String userPrices = Arrays.toString(userprice);
			System.out.println(user+"//"+userPrices+"//"+bnum);
			user = user.replace("[", "");
			user = user.replace("]", "");
			userPrices = userPrices.replace("[", "");
			userPrices = userPrices.replace("]", "");
			System.out.println(user+"//"+userPrices+"//"+bnum);
			
			map.put("usedBook", user);
			map.put("usedBookPrice", userPrices);
			map.put("bnum", bnum+"");
		}else {
			map.put("usedBook", null);
			map.put("usedBookPrice", null);
			map.put("bnum", bnum+"");
		}
			
			bookStoreDao.UpdateUsedBook(map);
		
		
		return getPage;
	}
}
