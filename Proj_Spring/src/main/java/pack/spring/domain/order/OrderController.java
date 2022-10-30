package pack.spring.domain.order;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.spring.domain.member.MemberDTO;
import pack.spring.domain.product.CartBean;
import pack.spring.domain.product.Criteria;
import pack.spring.domain.product.PageMaker;
import pack.spring.domain.product.ProdService;
import pack.spring.domain.product.WishlistBean;

@Controller
public class OrderController {

	@Autowired
	OrderService orderService;
	@Autowired
	ProdService prodService;
	
	@RequestMapping(value="/directOrder", method=RequestMethod.GET)
	public ModelAndView directOrderGet(@RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		int pVolumn = Integer.parseInt(map.get("pVolumn").toString());
		int sellPrice = Integer.parseInt(map.get("sellPrice").toString());
		int goodsPay = pVolumn * sellPrice;
		int delivFee = 3000;
		if (goodsPay >= 20000) {
			delivFee = 0;
		}
		int totalPay = goodsPay + delivFee;
		map.put("goodsPay", goodsPay);
		map.put("delivFee", delivFee);
		map.put("totalPay", totalPay);
		mav.addObject("order", map);
		mav.setViewName("/order/order");
		return mav;
	}
	
	@RequestMapping(value="/cartOrder", method=RequestMethod.GET)
	public ModelAndView cartOrderGet(@RequestParam List<Integer> cartNum, @RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		List<CartBean> cartBeanList = prodService.getCartForOrder(cartNum);
		mav.addObject("order", map);
		mav.addObject("cartBeanList", cartBeanList);
		mav.setViewName("/order/order");
		return mav;
	}
	
	@RequestMapping(value="/orderProc", method=RequestMethod.POST)
	public ModelAndView orderSet(OrderGoodsBean orderGoodsBean, UOrderBean uOrderBean) {
		ModelAndView mav = new ModelAndView();
		int orderNum = this.orderService.uOrderSet(uOrderBean);
		if(orderNum == 0) {
			mav.setViewName("redirect:/");
		} else {
			int rtCnt = 0;
			rtCnt += this.orderService.orderGoodsSet(orderGoodsBean, orderNum);
			if (rtCnt == orderGoodsBean.getOrderGoodsList().size()) {
				mav.setViewName("redirect:/orderList");				
			} else {
				mav.setViewName("redirect:/");				
			}
		}
		
		return mav;
	}
	
	
	@RequestMapping(value="/orderList", method=RequestMethod.GET)
	public ModelAndView orderList(Criteria cri, HttpSession session, @RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		if (session.getAttribute("user") != null) {
			String uId = ((MemberDTO) session.getAttribute("user")).getuId();
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);

			pageMaker.setTotalCount(this.orderService.countOrderListTotal(uId));
			map.put("pageStart", cri.getPageStart());
			map.put("perPageNum", cri.getPerPageNum());
			map.put("uId", uId);
							

			List<UOrderBean> uOrderList = this.orderService.uOrderList(map);
			List<OrderGoodsBean> orderGoodsList = null;
			for (int i = 0; i < uOrderList.size(); i++) {
				UOrderBean uOrderBean = uOrderList.get(i);
				int orderNum = uOrderBean.getNum();
				orderGoodsList = this.orderService.OrderGoodsList(orderNum);
				uOrderBean.setOrderGoodsList(orderGoodsList);
			}
			mav.addObject("uOrderList", uOrderList);
			mav.addObject("pageMaker", pageMaker);
			mav.setViewName("order/orderList");
		} else {
			mav.setViewName("redirect:/");
		}
		return mav;
	}
	
	
}
