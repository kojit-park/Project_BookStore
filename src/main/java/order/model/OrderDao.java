package order.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

@Component("myOrderDao")
public class OrderDao {

	private final String namespace = "order.model.Order"; // order.xml

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public void insertData(String id,int bnum,int price,int qty) {
		Map<String,String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("bnum", ""+bnum);
		map.put("price", ""+price);
		map.put("qty", ""+qty);
		
		sqlSessionTemplate.insert(namespace+".InsertData",map);
	}

	public int getMaxOrderId() {
		int maxoid = sqlSessionTemplate.selectOne(namespace+".getMaxOrderId");
		return maxoid;
	}
	
	public List<Order> OrderMall(String id){
		List<Order> lists = new ArrayList<Order>();
		lists = sqlSessionTemplate.selectList(namespace+".OrderMall",id);
		
		for (Order order: lists) {
			System.out.println("bnum>>확인::" + order.getBnum());
		}
		return lists;
	}
	
}
