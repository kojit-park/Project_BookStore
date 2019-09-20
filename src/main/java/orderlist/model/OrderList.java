package orderlist.model;

import org.apache.ibatis.type.Alias;

@Alias("MyOrderList")
public class OrderList {
	private int oid;
	private int bnum;
	private String mid;
	private int qty;
	private String oaddr;
	private String orderdate;
	private String title;
	private String category;
	private String author;
	private String translator;
	private String publisher;
	private String ISBN;
	private int page;
	private String pub_date;
	private int price;
	
	public int getOid() {
		return oid;
	}
	public void setOid(int oid) {
		this.oid = oid;
	}
	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public String getOaddr() {
		return oaddr;
	}
	public void setOaddr(String oaddr) {
		this.oaddr = oaddr;
	}
	public String getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getTranslator() {
		return translator;
	}
	public void setTranslator(String translator) {
		this.translator = translator;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getISBN() {
		return ISBN;
	}
	public void setISBN(String iSBN) {
		ISBN = iSBN;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public String getPub_date() {
		return pub_date;
	}
	public void setPub_date(String pub_date) {
		this.pub_date = pub_date;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public OrderList() {
		super();
	}
	public OrderList(int oid, int bnum, String mid, int qty, String oaddr, String orderdate, String title,
			String category, String author, String translator, String publisher, String iSBN, int page, String pub_date,
			int price) {
		super();
		this.oid = oid;
		this.bnum = bnum;
		this.mid = mid;
		this.qty = qty;
		this.oaddr = oaddr;
		this.orderdate = orderdate;
		this.title = title;
		this.category = category;
		this.author = author;
		this.translator = translator;
		this.publisher = publisher;
		ISBN = iSBN;
		this.page = page;
		this.pub_date = pub_date;
		this.price = price;
	}
	
	
	
}