package pack.spring.domain.order;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public int uOrderSet(UOrderBean uOrderBean) {
		return this.sqlSessionTemplate.insert("order.insertUOrder", uOrderBean);
	}
	
	public int orderGoodsSet (OrderGoodsBean orderGoods) {
		return this.sqlSessionTemplate.insert("order.insertOrderGoods", orderGoods);
	}
	
	public int getCountOrderList (String uId) {
		return this.sqlSessionTemplate.selectOne("order.countOrderList", uId);
	}
	
	public List<UOrderBean> getUOrderList (Map<String, Object> map) {
		return this.sqlSessionTemplate.selectList("order.getUOrderList", map);
	}
	
	public List<OrderGoodsBean> getOrderGoodsList (int orderNum) {
		return this.sqlSessionTemplate.selectList("order.getOrderGoodsList", orderNum);
	}
	
	public int modReviewStatus (OrderGoodsBean orderGoods) {
		return this.sqlSessionTemplate.update("order.modReviewStatus", orderGoods);
	}

}
