package bsmall.controller;

import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import orderlist.model.OrderList;
import orderlist.model.OrderListDao;

@Controller
public class IncomeViewController {

	private static final String command = "/incomeView.bsmall";
	private static final String getPage = "IncomeView";
	
	
	@Autowired
	@Qualifier("myOrderListDao")
	private OrderListDao orderListDao;
	
	@RequestMapping(command)
	public ModelAndView doAction() {
		ModelAndView mav = new ModelAndView();
		List<OrderList> IncomeByDate = new ArrayList<OrderList>();
		List<OrderList> IncomePerBook = new ArrayList<OrderList>();
		List<OrderList> IncomePerCategory = new ArrayList<OrderList>();
		
		
		IncomePerBook =orderListDao.IncomeCheckByBook();
		IncomeByDate = orderListDao.IncomeCheckByDate();
		IncomePerCategory = orderListDao.IncomeCheckByCategory();
		
		Map<String,Integer> IncomeMapDay = new HashMap<String, Integer>();
		Map<String,Integer> IncomeMapMonth = new HashMap<String, Integer>();
		Map<String,Integer> IncomeMapYear = new HashMap<String, Integer>();
		Map<String,Integer> IncomeMapBook = new HashMap<String, Integer>();
		Map<String,Integer> IncomeMapCategory = new HashMap<String, Integer>();
		
		String byDay="";
		String byMonth = "";
		String byYear ="";
		int income=0;
		LocalDate DateCheck = null;

		for(OrderList ol : IncomeByDate) {
			income=ol.getQty()*ol.getPrice();
			String od=ol.getOrderdate().replaceAll("-", "").replaceAll("/", "").replaceAll("년", "")
					.replaceAll("월", "").replaceAll("일", "").replaceAll(" ", "");
			
			String byDate = "20"+od.substring(0, 6);
			byDay = "20"+od.substring(0, 2)+"-"+od.substring(2,4)+"-"+od.substring(4,6);
			byMonth = "20"+od.substring(0, 2)+"-"+od.substring(2,4);
			byYear = "20"+od.substring(0, 2);
			DateCheck = LocalDate.parse(byDate, DateTimeFormatter.BASIC_ISO_DATE);
			System.out.println(DateCheck.toString());
			
			if(DateCheck.isAfter(LocalDate.now().minus(Period.ofDays(10)))) {
				if(IncomeMapDay.containsKey(byDay)) {
					IncomeMapDay.replace(byDay, IncomeMapDay.get(byDay)+income);
				}else {
					IncomeMapDay.put(byDay, income);
				}
			}
			
			if(DateCheck.isAfter(LocalDate.now().minus(Period.ofMonths(6)))) {
				if(IncomeMapMonth.containsKey(byMonth)) {
					IncomeMapMonth.replace(byMonth, IncomeMapMonth.get(byMonth)+income);
				}else {
					IncomeMapMonth.put(byMonth, income);
				}
			}
			if(DateCheck.isAfter(LocalDate.now().minus(Period.ofYears(5)))) {
				if(IncomeMapYear.containsKey(byYear)) {
					IncomeMapYear.replace(byYear, IncomeMapYear.get(byYear)+income);
				}else {
					IncomeMapYear.put(byYear, income);
				}
			}
			
		}
		if(IncomeMapYear.size() ==0) {
			IncomeMapYear.put("2019",0);
		}
		if(IncomeMapMonth.size() ==0) {
			IncomeMapMonth.put("2019-10",0);
		}
		if(IncomeMapDay.size() ==0) {
			IncomeMapDay.put("2019-10-01",0);
		}
		
		
		
		
		for(OrderList ol : IncomePerBook) {
			//income = ol.getQty()*ol.getPrice();
			income = ol.getPrice();
			if(IncomeMapBook.containsKey(ol.getTitle())) {
				IncomeMapBook.replace(ol.getTitle(), IncomeMapBook.get(ol.getTitle())+income);
			}else {
				IncomeMapBook.put(ol.getTitle(), income);
			}
		}
		
		for(OrderList ol : IncomePerCategory) {
			income = ol.getPrice();
			if(IncomeMapCategory.containsKey(ol.getCategory())) {
				IncomeMapCategory.replace(ol.getCategory(), IncomeMapCategory.get(ol.getCategory())+income);
			}else {
				IncomeMapCategory.put(ol.getCategory(), income);
			}
		}
		
		Map<String, Integer> SortedBookMap = sortByVal(IncomeMapBook);
		List<Integer> SortedValues = new ArrayList<Integer>(SortedBookMap.values());
		List<String> SortedKeys = new ArrayList<String>(SortedBookMap.keySet());
		
		Collections.reverse(SortedValues);
		Collections.reverse(SortedKeys);
		
		Map<String, Integer> SortedCategoryMap = sortByVal(IncomeMapCategory);
		List<String> SortedKeysCategory = new ArrayList<String>(SortedCategoryMap.keySet());
		List<Integer> SortedValuesCategory = new ArrayList<Integer>(SortedCategoryMap.values());
		
		Collections.reverse(SortedKeysCategory);
		Collections.reverse(SortedValuesCategory);
		
		Map<String, Integer> SortedBookMapTopTen = new LinkedHashMap<String, Integer>();
		for(int i =0; i<SortedKeys.size();i++) {
			if(i>9) break;
			SortedBookMapTopTen.put(SortedKeys.get(i), SortedValues.get(i));
		}
		
		Map<String, Integer> SortedCategory = new LinkedHashMap<String, Integer>();
		for(int i =0; i<SortedKeysCategory.size();i++) {
			SortedCategory.put(SortedKeysCategory.get(i), SortedValuesCategory.get(i));
		}
		
			System.out.println(SortedBookMapTopTen.keySet().toString());
			System.out.println(SortedBookMapTopTen.values().toString());
			
			System.out.println(SortedCategory.keySet().toString());
			System.out.println(SortedCategory.values().toString());
		
		mav.addObject("IncomeMapDay",IncomeMapDay);
		mav.addObject("IncomeMapMonth",IncomeMapMonth);
		mav.addObject("IncomeMapYear",IncomeMapYear);
		
		mav.addObject("IncomeMapBook",SortedBookMapTopTen);
		mav.addObject("IncomeMapCategory",SortedCategory);
		
		mav.setViewName(getPage);
		
		return mav;
	}
	

	public static Map<String, Integer> sortByVal(Map<String, Integer> map){
		
		List<Map.Entry<String, Integer>> list =
                new LinkedList<Map.Entry<String, Integer>>(map.entrySet());
		Collections.sort(list, new Comparator<Map.Entry<String, Integer>>(){

			@Override
			public int compare(Map.Entry<String, Integer> o1, Map.Entry<String, Integer> o2) {
				// TODO Auto-generated method stub
				return (o1.getValue()).compareTo(o2.getValue());
			}
		});

		Map<String,Integer> SortedMap = new LinkedHashMap<String, Integer>();
		for(Map.Entry<String, Integer> entry: list) {
			SortedMap.put(entry.getKey(), entry.getValue());
		}
		
		return SortedMap;
	}
	
}
