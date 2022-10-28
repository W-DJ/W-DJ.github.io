package pack.spring.domain.admin;

import java.util.Map;

public interface AdminService {

	public String join(Map<String, Object> map)throws Exception;
	
	public AdminDTO login(AdminDTO dto) throws Exception;

}
