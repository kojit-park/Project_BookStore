package orderlist.model;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("myOrderListDao")
public class OrderListDao {

	private final String namespace = "orderlist.model.OrderList";

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<OrderList> OrderList(String id){
		List<OrderList> lists = new ArrayList<OrderList>();
		lists = sqlSessionTemplate.selectList(namespace+".OrderList",id);
		return lists;
	}
	
	public List<OrderList> IncomeCheckByBook() {
		List<OrderList> lists = new ArrayList<OrderList>();
		lists = sqlSessionTemplate.selectList(namespace+".IncomeCheckByBook");
		return lists;
	}
	
	public List<OrderList> IncomeCheckByDate() {
		List<OrderList> lists = new ArrayList<OrderList>();
		lists = sqlSessionTemplate.selectList(namespace+".IncomeCheckByDate");
		return lists;
	}
	
	public List<OrderList> IncomeCheckByCategory() {
		List<OrderList> lists = new ArrayList<OrderList>();
		lists = sqlSessionTemplate.selectList(namespace+".IncomeCheckByCategory");
		return lists;
	}
}
