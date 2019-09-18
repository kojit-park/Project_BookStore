package bookstore.model;

import javax.validation.constraints.NotNull;

import org.apache.ibatis.type.Alias;

@Alias("MyBS")
public class BookStore {

	private int bnum;
	private String title;
	private String category;
	private String author;
	private String translator;
	private String publisher;
	@NotNull(message="필수")
	private String ISBN;
	private int page;
	private String pubdate;
	private int price;
	private int stock;
	private String introduce;
	private int count;
	private String usedBook;
	private String usedBookPrice;
	private int reputation;
	
	public String getPubdate() {
		return pubdate;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getUsedBook() {
		return usedBook;
	}
	public void setUsedBook(String usedBook) {
		this.usedBook = usedBook;
	}
	public String getUsedBookPrice() {
		return usedBookPrice;
	}
	public void setUsedBookPrice(String usedBookPrice) {
		this.usedBookPrice = usedBookPrice;
	}
	public int getReputation() {
		return reputation;
	}
	public void setReputation(int reputation) {
		this.reputation = reputation;
	}
	public void setPubdate(String pubdate) {
		this.pubdate = pubdate;
	}
	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	
	
	
}
