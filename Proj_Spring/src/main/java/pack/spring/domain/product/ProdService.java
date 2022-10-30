package pack.spring.domain.product;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

public interface ProdService {
	String fileUpload(MultipartFile files);
	
	
	String prodPost(ProdBoardBean prodBoardBean);
	
	
	ProdBoardBean prodRead(int num);
	
	int countBoardListTotal(Map<String, Object> map);
	
	List<Map<String, Object>> prodList(Map<String, Object> map);
	
	
	String prodMod(ProdBoardBean prodBoardBean);
	
	
	String prodDel(int num);
	
	int wishDpChk(WishlistBean wishlistBean);	

	int wishInsert (WishlistBean wishlistBean);
	
	
	Map<String, Object> cartDpChk(CartBean cartBean);	
	int cartInsert (CartBean cartBean);
	int cartPlus (CartBean cartBean);
	
	
	int countWishlistTotal(String uId);
	List<WishlistBean> wishlist(Map<String, Object> map);
	int wishDel(int num);
	
	List<CartBean> cartList(String uId);
	int cartMod (CartBean cartBean);
	int cartDel(int num);
	
	List<CartBean> getCartForOrder(List<Integer> cartNumList);
}
