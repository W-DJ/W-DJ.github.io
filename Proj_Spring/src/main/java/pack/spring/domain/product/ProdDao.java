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
}
