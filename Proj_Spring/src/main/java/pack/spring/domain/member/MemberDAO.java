package pack.spring.domain.member;


import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public MemberDTO login(MemberDTO dto) {
		
		return this.sqlSessionTemplate.selectOne("member.login", dto);
		
	}
	//회원가입
	public int insert(Map<String, Object> map) {
		return this.sqlSessionTemplate.insert("member.insert", map);
		}
    
	//전체 회원 목록 보기
	public List<Map<String,Object>>selectList(Map<String,Object>map){
		return this.sqlSessionTemplate.selectList("member.select_list, map");
		
	}
	
	//회원정보수정
	public MemberDTO mod(MemberDTO dto) {
	   return this.sqlSessionTemplate.selectOne("member.mod", dto);	
	}
	public int memberupdate(MemberDTO dto) {
	   return this.sqlSessionTemplate.update("member.update", dto);
	}

    //회원탈퇴
	public int delete(MemberDTO dto) {
		return this.sqlSessionTemplate.delete("member.delete", dto);
	}
}
