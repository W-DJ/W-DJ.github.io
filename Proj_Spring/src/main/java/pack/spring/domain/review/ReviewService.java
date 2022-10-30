package pack.spring.domain.review;

import java.util.List;
import java.util.Map;

public interface ReviewService {
	String post(ReviewBoardBean reviewBoardBean);
	
	
	int countBoardListTotal(Map<String, Object> map);
	
	List<Map<String, Object>> reviewList(Map<String, Object> map);
	
	ReviewBoardBean read(Map<String, Object> map);
	
	int mod(ReviewBoardBean reviewBoardBean);
	
	int del(Map<String, Object> map);
	
	int recommendDp(Map<String, Object> map);
	
	int recommend(Map<String, Object> map);
}
