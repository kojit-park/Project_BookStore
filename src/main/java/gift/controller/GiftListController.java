package gift.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import gift.model.Gift;
import gift.model.GiftDao;
import utility.Paging;

@Controller
public class GiftListController {
	
	private static final String getPage = "GiftList";
	private static final String command = "/list.gt";
	
	@Autowired
	@Qualifier("MyGiftDao")
	private GiftDao giftDao;
	
	@RequestMapping(value = command)
	public ModelAndView doAction(@RequestParam(value = "whatColumn", required = false ) String whatColumn,
			@RequestParam(value = "keyword", required = false ) String keyword,
			@RequestParam(value = "pageNumber", required = false ) String pageNumber,
			@RequestParam(value = "pageSize", required = false ) String pageSize,
			HttpServletRequest request) {
		
		System.out.print("whatColumn" + whatColumn + ", ");
		System.out.print("keyword : " + keyword + ", ");
		System.out.print("pageNumber : " + pageNumber + ", ");
		System.out.print("pageSize : " + pageSize + ", ");

		Map<String, String> map = new HashMap<String, String>() ;	

		map.put("whatColumn", whatColumn ) ;
		map.put("keyword", "%" + keyword + "%" ) ;

		int totalCount = giftDao.GetTotalCount( map );
		System.out.print("totalCount : " + totalCount); 

		String url = request.getContextPath() +  this.command ;

		Paging pageInfo 
		= new Paging( pageNumber, pageSize, totalCount, url, whatColumn, keyword, null);

		System.out.print( "offset : " + pageInfo.getOffset() + ", " ) ; 
		System.out.print( "limit : " + pageInfo.getLimit() + ", " ) ;  

		List<Gift> giftLists = giftDao.GetDataList( pageInfo, map );

		ModelAndView mav = new ModelAndView();
		System.out.println("조회된 건수: " + giftLists.size());
		mav.addObject( "giftLists", giftLists );		
		mav.addObject( "pageInfo", pageInfo );
		mav.setViewName(getPage); // GiftList
		return mav;//GiftList.jsp

	}
}
