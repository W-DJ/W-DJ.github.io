package pack.spring.domain.often;

import java.util.List;
import java.util.Map;


public interface OftenService {

	public List<OftenDTO> listAll() throws Exception;

	public int write(Map<String, Object> map);

	public Map<String, Object> read(Map<String, Object> map);

	public int update(Map<String, Object> map);

	public Map<String, Object> modify_ViewMap(Map<String, Object> map);

	public int delete(Map<String, Object> map);

	public int countBoardListTotal();

}
