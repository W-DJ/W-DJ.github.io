package pack.spring.domain.often;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class OftenSerivceImp implements OftenService {

	@Autowired
	OftenDAO oftendao;
	
	// 자주하는질문 전체목록보기
	@Override
	public List<OftenDTO> listAll() throws Exception {

		return this.oftendao.listAll();
	}

	// 자주하는질문 글쓰기
	@Override
	public int write(Map<String, Object> map) {
		return this.oftendao.insert(map);
	}
	
	// 자주하는질문 상세보기

	@Override
	public Map<String, Object> read(Map<String, Object> map) {
		
		oftendao.updateView(map);
		return this.oftendao.selectDetail(map);
	}


	@Override
	public int update(Map<String, Object> map) {
		
		return this.oftendao.update(map);
	}

	@Override
	public Map<String, Object> modify_ViewMap(Map<String, Object> map) {

		return this.oftendao.modify_ViewMap(map);
	}

	@Override
	public int delete(Map<String, Object> map) {
		return this.oftendao.delete(map);
	}

}
