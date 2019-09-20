package bsmall.cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MyCartList {
	
	private Map<Integer,Integer> orderlists = null;
	
	public MyCartList() {
		orderlists = new HashMap<Integer,Integer>();
	}
	
	public int AddOrder(int bnum,int oqty, int stock ) {
		
		int flag = 0;
		
		if(orderlists.containsKey(bnum)==false) { 
			orderlists.put(bnum, oqty);
			flag = 1;
		}
		else {
			int oldoqty = orderlists.get(bnum);
			if(oldoqty+oqty > stock) {
				System.out.println("에러메세지");
			}
			else{
				orderlists.put(bnum, oldoqty+oqty);
				flag = 1;
			}
		}
		return flag;
	}
	
	public Map<Integer,Integer> getAllOrder(){
		return orderlists;
	}
	
	public void removeOrder(int bnum) {
		orderlists.remove(bnum);
	}
	public void updateOrder(int bnum, int oqty) {
		orderlists.remove(bnum);
		orderlists.put(bnum, oqty);
	}
	
	public void removeAll(List cnum) {
		System.out.println(cnum);
		
	    for(int i=0;i<cnum.size();i++){
	    	Object bnum = cnum.get(i);
	    	System.out.println(bnum);
	    	orderlists.remove(bnum);
	    }

	}//removeAll

	@Override
	public String toString() {
		return "MyCartList [orderlists=" + orderlists + "]";
	}
	
}
