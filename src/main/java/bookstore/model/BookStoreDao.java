package bookstore.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import bsmall.controller.IncomeViewController;
import order.model.Order;
import orderlist.model.OrderList;
import orderlist.model.OrderListDao;
import utility.PagingList;

@Component("myBookStoreDao")
public class BookStoreDao {

	private final String namespace = "bookstore.model.BookStore";
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	@Autowired
	@Qualifier("myOrderListDao")
	public static OrderListDao orderListDao;
	
	public int GetTotalCount(Map<String, String> map) {
		int cnt = -1;
		cnt = sqlSessionTemplate.selectOne(namespace + ".GetTotalCount", map);
		return cnt;
	}
	
	public List<BookStore> GetDataList(PagingList pageInfo,Map<String, String> map){
		List<BookStore> lists = new ArrayList<BookStore>();
		RowBounds rowBounds = new RowBounds(pageInfo.getOffset(),pageInfo.getLimit());
		
		lists = sqlSessionTemplate.selectList(namespace + ".GetDataList", map,rowBounds );
		
		for(BookStore bs : lists) {
			if(bs.getIntroduce() == null || bs.getIntroduce().equals("")) {
				BookCrawler crawler = new BookCrawler();
				String content = crawler.bookContentCrawler(bs.getISBN());
				Map<String,String> bookInfo = new HashMap<String, String>();
				bookInfo.put("title", bs.getTitle());
				bookInfo.put("introduce", content);
				sqlSessionTemplate.update(namespace+".UpdateIntroduce",bookInfo);
			}
		}
		
		return lists;
		
	}
	
	public void InsertData(String ISBN) {
		BookCrawler crawler = new BookCrawler();
		BookStore bean = crawler.bookCrawlerByISBNResult(ISBN);
		
		sqlSessionTemplate.insert(namespace+".InsertData",bean);
	}
	
	public BookStore GetData(int bnum) {
		BookStore book = sqlSessionTemplate.selectOne(namespace+".GetData",bnum);
		return book;
	}
	
	public Map<String,String> GetContent(BookStore book){
		BookCrawler crawler = new BookCrawler();
		Map<String,String> map =crawler.crawlContent(book.getISBN());
		
		return map;
	}
	
	public BookStore GetDataByISBN(String ISBN) {
		BookStore book = sqlSessionTemplate.selectOne(namespace+".GetDataByISBN",ISBN);
		return book;
	}
	
	public void updateStock(Integer bnum, Integer qty) {
		BookStore bean = new BookStore();
		bean.setBnum(bnum);
		bean.setStock(qty);
		
		sqlSessionTemplate.update(namespace + ".updateStock", bean);
	}
	
	public void DeleteBook(int bnum) {
		sqlSessionTemplate.delete(namespace +".DeleteBook",bnum);
	}
	
	public List<BookStore> BingoCheck(List<Order> books) {
		List<BookStore> lists = new ArrayList<BookStore>();
		System.out.println("북 사이즈::"+books.size());
		for(Order order : books) {
			int bnum = order.getBnum();
			BookStore bs = sqlSessionTemplate.selectOne(namespace+".BingoCheck",bnum);
	//		String title = bs.getTitle();
			lists.add(bs);
			System.out.println("bnum>>"+bnum);
		}
		return lists;
	}
	
	public void InsertUsedBook(String title, String price,String id) {
		
		Map<String, String> map =new HashMap<String, String>();
		System.out.println(id+"///"+price+"///"+title);
		map.put("id", id);
		map.put("price",price);
		map.put("title", title);
		int chk = sqlSessionTemplate.update(namespace+".InsertUsedBook",map);
		System.out.println(chk);
	}
	
	public List<BookStore> GetUsedBookListById(String id) {
		List<BookStore> lists = new ArrayList<BookStore>();
		lists = sqlSessionTemplate.selectList(namespace+".GetUsedBookListById", id);
		return lists;
	}
	
	public void UpdateUsedBook(Map<String,String> map) {
		sqlSessionTemplate.update(namespace+".UpdateUsedBook",map);
	}
	
	public List<String> GetBestSeller(List<OrderList> IncomePerBook) {
		Map<String,Integer> IncomeMapBook = new HashMap<String, Integer>();
		int income=0;
		
		for(OrderList ol : IncomePerBook) {
			//income = ol.getQty()*ol.getPrice();
			income = ol.getPrice();
			if(IncomeMapBook.containsKey(ol.getTitle())) {
				IncomeMapBook.replace(ol.getTitle(), IncomeMapBook.get(ol.getTitle())+income);
			}else {
				IncomeMapBook.put(ol.getTitle(), income);
			}
		}
		
		Map<String, Integer> SortedBookMap = IncomeViewController.sortByVal(IncomeMapBook);
		
		List<String> SortedKeys = new ArrayList<String>(SortedBookMap.keySet());
		List<String> BookTitleTopTen = new ArrayList<String>();
		for(int i=(SortedKeys.size()-1);i>=0;i--) {
			if(((SortedKeys.size()-1)-i)>9) break;
			BookTitleTopTen.add(SortedKeys.get(i));
		}
		
		return BookTitleTopTen;
	}
	
	public BookStore GetBestBookFromMain(String title) {
		
		BookStore book = new BookStore();
		book = sqlSessionTemplate.selectOne(namespace+".GetBestBookFromMain",title);
		return book;
	}
	
	
}
