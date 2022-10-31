package pack.spring.domain.often;

import java.util.List;
import java.util.Map;


public interface OftenDAO {

	//게시글 전체목록보기
	public List<OftenDTO> listAll() throws Exception;
	
	//게시글 입력
	public int insert(Map<String, Object> map);

	//게시글 상세보기페이지
	public Map<String, Object> selectDetail(Map<String, Object> map);

	//게시글 수정
	public int update(Map<String, Object> map);

	//게시글 수정 전 게시글 확인
	public Map<String, Object> modify_ViewMap(Map<String, Object> map);

	//게시글 삭제
	public int delete(Map<String, Object> map);

	//게시글 조회수
	public int updateView(Map<String, Object> map);

	public int listCount();


}
