package bookstore.model;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.imageio.ImageIO;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class BookCrawler {
String url="http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=";
	
	public String bookContentCrawler(String isbn){
		url += isbn;
		Document doc=null;
		try {
			doc = Jsoup.connect(url).get();
		}catch(Exception e) {
			System.out.println("Jsoup");
			String ss=" ";
			return ss;
		}
		
		Elements element = doc.select("div.box_detail_article");
		
		
		String bookcontent = element.eq(0).text();
		if(bookcontent.length()>100) bookcontent = element.eq(0).text().substring(0, 100);
		else if(bookcontent.length()<10){
			bookcontent = "contents is Empty";
		}else {
			bookcontent = element.eq(0).text().substring(0, (bookcontent.length()-1));
		}
		url="http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=";

		return bookcontent;
	}
	
	public BookStore bookCrawlerByISBNResult(String ISBN){
		String addr = url+ISBN;
		int domestic = 3;
		int foreign = 5;
		int cnt = 3;
		BookStore bs = new BookStore();
		System.out.println("시작지점:"+addr);
		Document doc;
		try {
			doc = Jsoup.connect(addr).get();
		}catch(Exception e) {
			System.out.println("Jsoup에러남");
			return bs;
		}
		
		Elements elementTitle = doc.select("h1.title");
		String bookTitle = elementTitle.eq(0).text();
		System.out.println("bookTitle "+bookTitle);
		bs.setTitle(bookTitle);
		System.out.println(bookTitle);
		Elements elementPrice = doc.select("span.org_price");
		int bookPrice = Integer.parseInt(elementPrice.eq(0).text().replaceAll("[^0-9]", ""));
		System.out.println("bookPrice:"+bookPrice);
		bs.setPrice(bookPrice);
		
		Elements elementAuthor = doc.select("a.detail_author");
		String bookAuthor = elementAuthor.eq(0).text();
		System.out.println("bookAuthor="+bookAuthor);
		bs.setAuthor(bookAuthor);
		
		Elements elementISBN = doc.select("span[title=ISBN-13]");
		String bookISBN = elementISBN.eq(0).text();
		System.out.println("bookISBN="+bookISBN);
		bs.setISBN(bookISBN);
		
		Elements elementTranslator = doc.select("a.detail_translator");
		String bookTranslator = elementTranslator.eq(0).text();
		System.out.println("bookTranslator"+bookTranslator);
		bs.setTranslator(bookTranslator);
		if(bookTranslator == null || bookTranslator.equals("")) {
			cnt = domestic;
		}else {
			cnt = foreign;
		}
		
		Elements elementPublisher = doc.select("span[class=name]:nth-child("+cnt+")");//출판사
		String bookPublisher = elementPublisher.eq(0).text();
		System.out.println("bookPublisher"+bookPublisher);
		bs.setPublisher(bookPublisher);
		
		Elements elementCategory = doc.select("ul.list_detail_category>li>a");
		String bookCategory = elementCategory.eq(0).text();
		System.out.println("bookCategory:"+bookCategory);
		bs.setCategory(bookCategory);
		
		Elements elementImage = doc.select("div.cover>a>img"); 
		String bookImage = elementImage.eq(0).attr("src");
		System.out.println("bookImage"+bookImage);
		String savePath = "C:\\Spring\\Project_BookStore\\src\\main\\webapp\\resources\\Img\\";
		String fileFormat = "jpg";
		File saveFile = new File(savePath + bookTitle +".jpg");
		saveImage(bookImage, saveFile, fileFormat);
		
		Elements elementPub_date = doc.select("span.date");
		String bookPub_date = elementPub_date.eq(0).text().substring(0, 13).trim();
		System.out.println("bookPub_date"+bookPub_date);
		bs.setPubdate(bookPub_date);
		
		bs.setStock((int)(Math.random()*10));
		
		return bs;
	}
	
	public void saveImage(String imageUrl, File saveFile, String fileFormat) {
		
		URL url = null;
		BufferedImage bi = null;
		
		try {
			url = new URL(imageUrl); // 다운로드 할 이미지 URL
			bi = ImageIO.read(url);
			ImageIO.write(bi, fileFormat, saveFile); // 저장할 파일 형식, 저장할 파일명
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public Map<String,String> crawlContent(String ISBN) {
		String addr = url+ISBN;
		System.out.println("시작지점:"+addr);
		Document doc =null;
		try {
			doc = Jsoup.connect(addr).get();
		}catch(Exception e) {
			System.out.println("Jsoup에러남");
		}
		Map<String,String> map = new HashMap<String, String>();
		
		Elements introduce = doc.select("div.box_detail_article");
		String bookIntroduce = introduce.eq(0).text();
		
		//Elements content = doc.select("div[class='box_detail_article']:nth-of-type(3)");
		//String bookContent = content.text();
		
		//map.put("bookContent", bookContent);
		map.put("bookIntroduce", bookIntroduce);
		
		return map;
		
	}
}
