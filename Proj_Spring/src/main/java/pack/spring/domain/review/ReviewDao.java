package pack.spring.domain.review;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class ReviewDao {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public int post(ReviewBoardBean reviewBoardBean) {
		int prodNum = reviewBoardBean.getProdNum();
		int tblReviewNum = 1;
		
		Map<String, Object> rt = this.sqlSessionTemplate.selectOne("review.getTblReviewNum", prodNum);
		if (rt != null) {
			tblReviewNum =Integer.parseInt(rt.get("max(tblReviewNum)").toString());
		}
		reviewBoardBean.setTblReviewNum(tblReviewNum+1);
		return this.sqlSessionTemplate.insert("review.post", reviewBoardBean);
	}
	
	public int getCountBoard(Map<String, Object> map) {
		return (Integer) this.sqlSessionTemplate.selectOne("review.countBoard", map);
	}
	public List<Map<String, Object>> getProdList (Map<String, Object> map) {
		return this.sqlSessionTemplate.selectList("review.list", map);
	}
	
	public ReviewBoardBean read(Map<String, Object> map) {
		return this.sqlSessionTemplate.selectOne("review.read", map);
	}
	
	public int mod(ReviewBoardBean reviewBoardBean) {
		return this.sqlSessionTemplate.update("review.mod", reviewBoardBean);
	}
	public int del(Map<String, Object> map) {
		return this.sqlSessionTemplate.delete("review.del", map);
	}
	public int recommendDp(Map<String, Object> map) {
		return (Integer) this.sqlSessionTemplate.selectOne("review.recommendDp", map);
	}
	public int recommend(Map<String, Object> map) {
		return this.sqlSessionTemplate.insert("review.recommend", map);
	}
	public int reviewLovePlus (Map<String, Object> map) {
		return this.sqlSessionTemplate.update("review.LovePlus", map);
	}
}
