package pack.spring.domain.review;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewServiceImp implements ReviewService {
		
	@Autowired
	ReviewDao reviewDao;
	
	@Override
	public String post(ReviewBoardBean reviewBoardBean) {
		int affectRowCnt = this.reviewDao.post(reviewBoardBean);
		if (affectRowCnt == 1) {
			return "등록성공";
		}
		return null;
	};
	
	@Override
	public int countBoardListTotal(Map<String, Object> map) {
		return this.reviewDao.getCountBoard(map);
	};
	
	@Override
	public List<Map<String, Object>> reviewList(Map<String, Object> map) {
		return this.reviewDao.getProdList(map);
	};
}
