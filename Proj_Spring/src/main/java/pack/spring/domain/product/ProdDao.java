package pack.spring.domain.product;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProdDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public int prodPost(ProdBoardBean prodBoardBean) {
		return this.sqlSessionTemplate.insert("product.post", prodBoardBean);
	}
	
	public int prodReadCntAdd(int num) {
		 return this.sqlSessionTemplate.update("product.readCntAdd", num);
	}
	
	public ProdBoardBean prodRead(int num) {
		 return this.sqlSessionTemplate.selectOne("product.read", num);
	}
	
	public int getCountBoard(Map<String, Object> map) {
		return (Integer) this.sqlSessionTemplate.selectOne("product.countBoard", map);
	}
	
	public List<Map<String, Object>> getProdList (Map<String, Object> map) {
		return this.sqlSessionTemplate.selectList("product.list", map);
	}
	public int prodMod(ProdBoardBean prodBoardBean) {
		return this.sqlSessionTemplate.update("product.mod", prodBoardBean);
	}
	
	public int prodDel(int num) {
		return this.sqlSessionTemplate.delete("product.del", num);
	}
	
	public int wishDpChk (WishlistBean wishlistBean) { 
		return this.sqlSessionTemplate.selectOne("product.whishDpChk", wishlistBean);
	}
	
	public int wishInsert (WishlistBean wishlistBean) { 
		return this.sqlSessionTemplate.insert("product.whishInsert", wishlistBean);
	}
	
	public Map<String, Object> cartDpChk (CartBean cartBean) { 
		return this.sqlSessionTemplate.selectOne("product.cartDpChk", cartBean);
	}
	public int cartInsert (CartBean cartBean) { 
		return this.sqlSessionTemplate.insert("product.cartInsert", cartBean);
	}
	public int cartPlus (CartBean cartBean) { 
		return this.sqlSessionTemplate.update("product.cartPlus", cartBean);
	}
	
	public int getCountWishlist (String uId) {
		return this.sqlSessionTemplate.selectOne("product.countWishlist", uId);
	}
	
	public List<WishlistBean> getWishlist (String uId) {
		return this.sqlSessionTemplate.selectList("product.getWishlist", uId);
	}
	public List<CartBean> getCartList (String uId) {
		return this.sqlSessionTemplate.selectList("product.getCartList", uId);
	}
	
	public int cartMod (CartBean cartBean) { 
		return this.sqlSessionTemplate.update("product.cartMod", cartBean);
	}
}
