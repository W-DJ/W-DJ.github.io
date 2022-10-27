package pack.spring.domain.bbs;

import java.util.List;
import java.util.Map;

public interface BBSService {
	// 공지사항 글쓰기
		String writeNot(Map<String, Object> map); //메서드
	// 공지사항 상세보기
		Map<String, Object> Notdetail(Map<String, Object> map);
	//공지사항 전체보기	
		List<Map<String, Object>> NotList(Map<String, Object> map);
	//공지사항 수정하기
		Map<String, Object> Notupd(Map<String, Object> map);
		int modifynot(Map<String, Object> map);
	//공지사항 삭제하기
		int delnot(Map<String, Object> map);
		
}
