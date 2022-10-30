package pack.spring.domain.order;

import java.util.List;
import java.util.Map;

public interface OrderService {

	int uOrderSet(UOrderBean uOrderBean);
	
	int orderGoodsSet(OrderGoodsBean orderGoodsBean, int orderNum);
	
	int countOrderListTotal(String uId);
	
	List<UOrderBean> uOrderList (Map<String, Object> map);
	
	List<OrderGoodsBean> OrderGoodsList (int orderNum);
}
