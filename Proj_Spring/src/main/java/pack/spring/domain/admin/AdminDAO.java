package pack.spring.domain.admin;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class AdminDAO {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	//관리자가입
		public int insert(Map<String, Object> map) {
			return this.sqlSessionTemplate.insert("admin.insert", map);
			}
	
	//	관리자 로그인
		public AdminDTO login(AdminDTO dto) {
			
			return this.sqlSessionTemplate.selectOne("admin.login", dto);
			
		}
		
	
}
