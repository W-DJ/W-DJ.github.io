package pack.spring.domain.admin;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImp implements AdminService {


	@Autowired
	AdminDAO AdminDao;
	
	@Override
	public String join(Map<String, Object> map){
	int affectRowCnt = this.AdminDao.insert(map);
	if (affectRowCnt == 1) {
	return map.get("admin").toString( );
	}
	return null;
	}

	@Override
	public AdminDTO login(AdminDTO dto) throws Exception {
	
		return this.AdminDao.login(dto);
	}

}
