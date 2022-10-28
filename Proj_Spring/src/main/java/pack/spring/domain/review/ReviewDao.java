package pack.spring.domain.review;

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
		reviewBoardBean.setTblReviewNum(tblReviewNum);
		return this.sqlSessionTemplate.insert("review.post", reviewBoardBean);
	}
	
}
