package pack.spring.domain.often;

import java.util.List;
import java.util.Map;

public interface OftenDAO {

	public List<OftenDTO> listAll() throws Exception;
	
	public int insert(Map<String, Object> map);
}
