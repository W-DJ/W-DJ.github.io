package pack.spring.domain.often;

import java.util.List;
import java.util.Map;

public interface OftenService {

	public List<OftenDTO> listAll() throws Exception;

	public int write(Map<String, Object> map);
}
