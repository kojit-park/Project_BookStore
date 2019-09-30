package bsmall.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bmember.model.BmemberBean;
import bmember.model.BmemberDao;
import orderlist.model.OrderList;
import orderlist.model.OrderListDao;

@Controller
public class IncomeDetailViewController {
	
	private static final String command = "/incomeDetail.bsmall";
	private static final String getPage = "IncomeViewDetail";
	
	
	@Autowired
	@Qualifier("myOrderListDao")
	private OrderListDao orderListDao;
	
	@Autowired
	@Qualifier("myBmemberDao")
	private BmemberDao bmemberDao;
	
	@RequestMapping(command)
	public ModelAndView doAction(
			@RequestParam(value = "selectYear1", required = false ) int selectYear1,
			@RequestParam(value = "selectMonth1", required = false ) String selectMonth1,
			@RequestParam(value = "selectYear2", required = false ) int selectYear2,
			@RequestParam(value = "selectMonth2", required = false ) String selectMonth2
			) {
		ModelAndView mav = new ModelAndView();
		
		List<OrderList> IncomesSelected = new ArrayList<OrderList>();
		
		Map<String,Integer> selectedByBookIncomeMap = new HashMap<String, Integer>();
		Map<String,Integer> selectedByMaleBookIncomeMap = new HashMap<String, Integer>();
		Map<String,Integer> selectedByFemaleBookIncomeMap = new HashMap<String, Integer>();
		Map<String,Integer> selectedByMemberIncomeMap = new HashMap<String, Integer>();
		Map<String,Integer> selectedByIncomeMap = new HashMap<String, Integer>();
		Map<String,Integer> selectedByCategoryIncomeMap = new HashMap<String, Integer>();
		Map<String,Integer>	selectedByGenderIncomeMap = new HashMap<String, Integer>();
		Map<String,Integer>	selectedByAgeGroupIncomeMap = new HashMap<String, Integer>();
		
		
		
		int income = 0;
		String toDate = "";
		LocalDate DateCheck = null;
		
			if(selectYear1>selectYear2) {
				int temp = selectYear2;
				selectYear2 = selectYear1;
				selectYear1 = temp;
			}
			
			String Date01 = selectYear1+selectMonth1+"01";
			String LastDayOfMonth = "31";
			if(selectMonth2.equals("02")) {LastDayOfMonth="28";}
			else if(selectMonth2.equals("04") || selectMonth2.equals("06") ||selectMonth2.equals("09") || selectMonth2.equals("11")) {
				LastDayOfMonth="30";
			}
			
			String Date02 = selectYear2+selectMonth2+LastDayOfMonth;
			System.out.println(Date01+"///"+Date02);
			
			LocalDate selectedDate1 = LocalDate.parse(Date01, DateTimeFormatter.BASIC_ISO_DATE);
			LocalDate selectedDate2 = LocalDate.parse(Date02, DateTimeFormatter.BASIC_ISO_DATE);
			
			IncomesSelected = orderListDao.GetSelectedIncome();
			int k = 0;
			for(OrderList ol : IncomesSelected) {
				k++;
				System.out.println("why Error  "+ol.getMid()+"//"+k+"///"+ol.getTitle()+"///"+ol.getOrderdate());
				String od=ol.getOrderdate().replaceAll("-", "").replaceAll("/", "").replaceAll("년", "")
						.replaceAll("월", "").replaceAll("일", "").replaceAll(" ", "");
				income=ol.getPrice();
				BmemberBean member = bmemberDao.GetInfo(ol.getMid());
				int birth = (2019-Integer.parseInt(member.getBirth().substring(0,4))+1)/10;
				System.out.println(birth +"check!");
					
				String gender = member.getGender();
				String ageGroup = (birth*10)+"대";
				
				toDate = "20"+od.substring(0, 6);
				DateCheck = LocalDate.parse(toDate, DateTimeFormatter.BASIC_ISO_DATE);
				
				if(DateCheck.isAfter(selectedDate1) && DateCheck.isBefore(selectedDate2)) {
					System.out.println("check2!");
					//"bookIncome"
						if(selectedByBookIncomeMap.containsKey(ol.getTitle())) {
							selectedByBookIncomeMap.replace(ol.getTitle(), selectedByBookIncomeMap.get(ol.getTitle())+income);
						}else {
							selectedByBookIncomeMap.put(ol.getTitle(), income);
						}
						
					//"genderBookIncome"
						if(gender.equals("남")) {
							if(selectedByMaleBookIncomeMap.containsKey(ol.getTitle())) {
								selectedByMaleBookIncomeMap.replace(ol.getTitle(), selectedByMaleBookIncomeMap.get(ol.getTitle())+income);
							}else {
								selectedByMaleBookIncomeMap.put(ol.getTitle(), income);
							}
						}else {
							if(selectedByFemaleBookIncomeMap.containsKey(ol.getTitle())) {
								selectedByFemaleBookIncomeMap.replace(ol.getTitle(), selectedByFemaleBookIncomeMap.get(ol.getTitle())+income);
							}else {
								selectedByFemaleBookIncomeMap.put(ol.getTitle(), income);
							}
						}
					
						//"memberIncome"
						if(selectedByMemberIncomeMap.containsKey(ol.getMid())) {
							selectedByMemberIncomeMap.replace(ol.getMid(), selectedByMemberIncomeMap.get(ol.getMid())+income);
						}else {
							selectedByMemberIncomeMap.put(ol.getMid(), income);
						}
						
					//"simpleIncome" 년월까지만.
						toDate = toDate.substring(0,4)+"-"+toDate.substring(4,6);
						System.out.println(toDate);
						if(selectedByIncomeMap.containsKey(toDate)) {
							selectedByIncomeMap.replace(toDate, selectedByIncomeMap.get(toDate)+income);
						}else {
							selectedByIncomeMap.put(toDate, income);
						}
						
					//genderIncom
						if(selectedByGenderIncomeMap.containsKey(gender)) {
							selectedByGenderIncomeMap.replace(gender, selectedByGenderIncomeMap.get(gender)+income);
						}else {
							selectedByGenderIncomeMap.put(gender, income);
						}
						
					//categoryIncome"
						if(selectedByCategoryIncomeMap.containsKey(ol.getCategory())) {
							selectedByCategoryIncomeMap.replace(ol.getCategory(), selectedByCategoryIncomeMap.get(ol.getCategory())+income);
						}else {
							selectedByCategoryIncomeMap.put(ol.getCategory(), income);
						}
						
					//AgegroupIncome
						if(birth == 0) {
							ageGroup = "10세 이하";
						}else if(birth >6) {
							ageGroup = "70대 이상";
						}
						System.out.println("check3!");
						if(selectedByAgeGroupIncomeMap.containsKey(ageGroup)) {
							selectedByAgeGroupIncomeMap.replace(ageGroup, (selectedByAgeGroupIncomeMap.get(ageGroup)+income));
						}else {
							selectedByAgeGroupIncomeMap.put(ageGroup, income);
						}
						System.out.println("check4!");
					}
				}
			System.out.println("check5!");
			if(selectedByBookIncomeMap.size() ==0) {
				selectedByBookIncomeMap.put("없음",0);
			}
			if(selectedByMaleBookIncomeMap.size() ==0) {
				selectedByMaleBookIncomeMap.put("없음",0);
			}
			if(selectedByFemaleBookIncomeMap.size() ==0) {
				selectedByFemaleBookIncomeMap.put("없음",0);
			}
			if(selectedByMemberIncomeMap.size() ==0) {
				selectedByMemberIncomeMap.put("없음",0);
			}
			if(selectedByIncomeMap.size() ==0) {
				selectedByIncomeMap.put("없음",0);
			}
			if(selectedByCategoryIncomeMap.size() ==0) {
				selectedByCategoryIncomeMap.put("없음",0);
			}
			if(selectedByGenderIncomeMap.size() ==0) {
				selectedByGenderIncomeMap.put("없음",0);
			}
			if(selectedByAgeGroupIncomeMap.size() ==0) {
				selectedByAgeGroupIncomeMap.put("없음",0);
			}
			
			Map<String, Integer> SortedBookIncomeMap = IncomeViewController.sortByVal(selectedByBookIncomeMap);
			List<String> SortedBookIncomeKeys = new ArrayList<String>(SortedBookIncomeMap.keySet());
			List<Integer> SortedBookIncomeValues = new ArrayList<Integer>(SortedBookIncomeMap.values());
			
			Collections.reverse(SortedBookIncomeKeys);
			Collections.reverse(SortedBookIncomeValues);
			
			Map<String, Integer> SortedBookIncomeMapTopTen = new LinkedHashMap<String, Integer>();
			for(int i =0; i<SortedBookIncomeKeys.size();i++) {
				if(i>9) break;
				SortedBookIncomeMapTopTen.put(SortedBookIncomeKeys.get(i), SortedBookIncomeValues.get(i));
			}
			
			Map<String, Integer> SortedMaleBookIncomeMap = IncomeViewController.sortByVal(selectedByMaleBookIncomeMap);
			List<String> SortedMaleBookIncomeKeys = new ArrayList<String>(SortedMaleBookIncomeMap.keySet());
			List<Integer> SortedMaleBookIncomeValues = new ArrayList<Integer>(SortedMaleBookIncomeMap.values());
			
			Collections.reverse(SortedMaleBookIncomeKeys);
			Collections.reverse(SortedMaleBookIncomeValues);
			
			Map<String, Integer> SortedMaleBookIncomeMapTopTen = new LinkedHashMap<String, Integer>();
			for(int i =0; i<SortedMaleBookIncomeKeys.size();i++) {
				if(i>9) break;
				SortedMaleBookIncomeMapTopTen.put(SortedMaleBookIncomeKeys.get(i), SortedMaleBookIncomeValues.get(i));
			}
			
			Map<String, Integer> SortedFemaleBookIncomeMap = IncomeViewController.sortByVal(selectedByFemaleBookIncomeMap);
			List<String> SortedFemaleBookIncomeKeys = new ArrayList<String>(SortedFemaleBookIncomeMap.keySet());
			List<Integer> SortedFemaleBookIncomeValues = new ArrayList<Integer>(SortedFemaleBookIncomeMap.values());
			
			Collections.reverse(SortedFemaleBookIncomeKeys);
			Collections.reverse(SortedFemaleBookIncomeValues);
			
			Map<String, Integer> SortedFemaleBookIncomeMapTopTen = new LinkedHashMap<String, Integer>();
			for(int i =0; i<SortedFemaleBookIncomeKeys.size();i++) {
				if(i>9) break;
				SortedFemaleBookIncomeMapTopTen.put(SortedFemaleBookIncomeKeys.get(i), SortedFemaleBookIncomeValues.get(i));
			}
			
			Map<String, Integer> SortedMemberIncomeMap = IncomeViewController.sortByVal(selectedByMemberIncomeMap);
			List<String> SortedMemberIncomeKeys = new ArrayList<String>(SortedMemberIncomeMap.keySet());
			List<Integer> SortedMemberIncomeValues = new ArrayList<Integer>(SortedMemberIncomeMap.values());
			
			Collections.reverse(SortedMemberIncomeKeys);
			Collections.reverse(SortedMemberIncomeValues);
			
			Map<String, Integer> SortedMemberIncomeMapTopTen = new LinkedHashMap<String, Integer>();
			for(int i =0; i<SortedMemberIncomeKeys.size();i++) {
				if(i>9) break;
				SortedMemberIncomeMapTopTen.put(SortedMemberIncomeKeys.get(i), SortedMemberIncomeValues.get(i));
			}
		
		System.out.println(SortedBookIncomeMapTopTen.keySet().toString());
		System.out.println(SortedBookIncomeMapTopTen.values().toString());
		
		System.out.println(SortedMaleBookIncomeMapTopTen.keySet().toString());
		System.out.println(SortedMaleBookIncomeMapTopTen.values().toString());
		
		System.out.println(SortedFemaleBookIncomeMapTopTen.keySet().toString());
		System.out.println(SortedFemaleBookIncomeMapTopTen.values().toString());
		
		System.out.println(SortedMemberIncomeMapTopTen.keySet().toString());
		System.out.println(SortedMemberIncomeMapTopTen.values().toString());

		mav.addObject("BookIncome",SortedBookIncomeMapTopTen);
		mav.addObject("MaleBookIncome",SortedMaleBookIncomeMapTopTen);
		mav.addObject("FemaleBookIncome",SortedFemaleBookIncomeMapTopTen);
		mav.addObject("MemberIncome",SortedMemberIncomeMapTopTen);
		mav.addObject("Income",selectedByIncomeMap);
		mav.addObject("CategoryIncome",selectedByCategoryIncomeMap);
		mav.addObject("GenderIncome",selectedByGenderIncomeMap);
		mav.addObject("AgeGroupIncome",selectedByAgeGroupIncomeMap);
		
		mav.setViewName(getPage);
		
		return mav;
	}
		
}
