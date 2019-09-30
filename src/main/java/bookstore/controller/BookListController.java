package bookstore.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bookstore.model.BookStore;
import bookstore.model.BookStoreDao;
import utility.PagingList;

@Controller
public class BookListController {
	
	private static final String command = "/list.bs";
	private static final String getPage= "BookList";
	
	@Autowired
	@Qualifier("myBookStoreDao")
	private BookStoreDao bookStoreDao;
	
	@RequestMapping(command)
	public ModelAndView doAction(
			@RequestParam(value = "category", required = false) String category, 
			@RequestParam(value = "keyword", required = false) String keyword, 
			@RequestParam(value = "sorting", required = false) String sorting, 
			@RequestParam(value = "pageNumber", required = false ) String pageNumber,
			@RequestParam(value = "pageSize", required = false ) String pageSize,
			@RequestParam(value = "mobile", required = false ) String mobile,
			HttpSession session,
			HttpServletRequest request
			) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("category", category);
		map.put("keyword", "%"+keyword+"%");
		map.put("sorting",sorting);
		
		ModelAndView mav = new ModelAndView();
		
		int totalCount = bookStoreDao.GetTotalCount(map);
		String url = request.getContextPath() + "/" + command;
		
		PagingList pageInfo = new PagingList(pageNumber, pageSize, totalCount, url, category, keyword, null);
		
		List<BookStore> bookLists = bookStoreDao.GetDataList(pageInfo,map); 
		mav.addObject("bookLists",bookLists);
		mav.addObject("totalCount",totalCount);
		mav.addObject("pageInfo",pageInfo);
		
		if(keyword != null) {
			mav.addObject("keyword",keyword);
		}
		
		if(session.getAttribute("mobile") == null ||((String)session.getAttribute("mobile")).equals("")) {
			session.setAttribute("mobile", mobile);
				if(session.getAttribute("mobile") != null && ((String)session.getAttribute("mobile")).equals("1")) {
					mav.setViewName("Mobile_BookList");
					return mav;
				}
		}else {
			mav.setViewName("Mobile_BookList");
			return mav;
		}
		
		if(mobile !=null) {
			System.out.println("여기는리스트2////"+mobile);
		}
		if(session.getAttribute("mobile")!= null) {
			System.out.println((String)session.getAttribute("mobile"));
		}
		
		
		
		mav.setViewName(getPage);
		return mav;
		
	}
	
	
	
	
	
	
}
