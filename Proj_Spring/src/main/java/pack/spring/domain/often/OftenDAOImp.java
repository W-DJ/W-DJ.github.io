package pack.spring.domain.often;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class OftenDAOImp implements OftenDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	// 자주묻는질문 전체목록보기
	@Override
	public List<OftenDTO> listAll() throws Exception {
		return this.sqlSessionTemplate.selectList("often.select_list");
	}
	
	// 자주묻는질문 글쓰기
	@Override
	public int insert(Map<String, Object> map) {
		return this.sqlSessionTemplate.insert("often.insert",map);
	}

	// 자주묻는질문 상세보기
	@Override
	public Map<String, Object> selectDetail(Map<String, Object> map) {
		
		return this.sqlSessionTemplate.selectOne("often.select_detail", map);
	}

	// 수정 전 글 내용확인
	@Override
	public Map<String, Object> modify_ViewMap(Map<String, Object> map) {
		
		return this.sqlSessionTemplate.selectOne("often.modify_ViewMap", map);
	}

	//게시글 수정
	@Override
	public int update(Map<String, Object> map) {
		
		return this.sqlSessionTemplate.update("often.update", map);
	}

	//게시글 삭제
	@Override
	public int delete(Map<String, Object> map) {
		
		return this.sqlSessionTemplate.delete("often.delete", map);
	}

	//게시글 조회수
	@Override
	public int updateView(Map<String, Object> map) {
		
		return this.sqlSessionTemplate.update("often.updateView", map);
	}


}
