package order.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myOrderDao")
public class OrderDao {

	private final String namespace = "order.model.Order"; // order.xml

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public void insertData(Integer bnum, String id, Integer qty) {
	    Order bean = new Order();
	    bean.setBnum(bnum);
	    bean.setMid(id);
	    bean.setQty(qty);
	    sqlSessionTemplate.insert(namespace+".InsertData",bean);
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
	
	public String OrderResult(String id){
		String orderdate = null;
		orderdate = sqlSessionTemplate.selectOne(namespace+".OrderResult",id);
		
		return orderdate;
	}
	
}
