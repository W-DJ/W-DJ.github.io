package pack.spring.domain.review;

import java.util.List;
import java.util.Map;

public interface ReviewService {
	String post(ReviewBoardBean reviewBoardBean);
	
	
	int countBoardListTotal(Map<String, Object> map);
	
	List<Map<String, Object>> reviewList(Map<String, Object> map);
}
