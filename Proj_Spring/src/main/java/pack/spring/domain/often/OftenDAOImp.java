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
	@Override
	public List<OftenDTO> listAll() throws Exception {
		return sqlSessionTemplate.selectList("often.select_list");
	}
	@Override
	public int insert(Map<String, Object> map) {
		return sqlSessionTemplate.insert("often.insert",map);
	}

}
