package pack.spring.domain.order;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderServiceImp implements OrderService {

	@Autowired
	OrderDao orderDao;
	
	@Override
	public int uOrderSet(UOrderBean uOrderBean) {
		int rtCnt = this.orderDao.uOrderSet(uOrderBean);
		if (rtCnt == 1) {
			return uOrderBean.getNum();
		} else {
			return 0;
		}
	};
	
	@Override
	public int orderGoodsSet(OrderGoodsBean orderGoodsBean, int orderNum) {
		int rtCnt = 0;
		for(int i = 0; i < orderGoodsBean.getOrderGoodsList().size(); i++) {
			orderGoodsBean.getOrderGoodsList().get(i).setOrderNum(orderNum);
			OrderGoodsBean orderGoods= orderGoodsBean.getOrderGoodsList().get(i);
			rtCnt += this.orderDao.orderGoodsSet(orderGoods);
		}
		return rtCnt;
	};
	
	@Override
	public int countOrderListTotal(String uId) {
		return this.orderDao.getCountOrderList(uId);
	};
	
	@Override
	public List<UOrderBean> uOrderList (Map<String, Object> map) {
		return this.orderDao.getUOrderList(map);
	};
	
	@Override
	public List<OrderGoodsBean> OrderGoodsList (int orderNum) {
		return this.orderDao.getOrderGoodsList(orderNum);
	};
	
	@Override
	public int modReviewStatus(int orderNum, int prodNum, String reviewStatus) {
		OrderGoodsBean orderGoodsBean = new OrderGoodsBean();
		orderGoodsBean.setOrderNum(orderNum);
		orderGoodsBean.setpNum(prodNum);
		orderGoodsBean.setReviewStatus(reviewStatus);
		return this.orderDao.modReviewStatus(orderGoodsBean);
	};
}
