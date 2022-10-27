package pack.spring.domain.member;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImp implements MemberService {

	@Autowired
	MemberDAO memberDao;
	
	@Override
	public String join(Map<String, Object> map){
	int affectRowCnt = this.memberDao.insert(map);
	if (affectRowCnt == 1) {
	return map.get("member_id").toString( );
	}
	return null;
	}

	@Override
	public MemberDTO login(MemberDTO dto) throws Exception {
		
		return this.memberDao.login(dto);
	}

	@Override
	public String index() {
	return null;
	}

	@Override
	public List<Map<String, Object>> list(Map<String, Object> map) {
	
		return this.memberDao.selectList(map);
	}




	@Override
	public MemberDTO membermod(MemberDTO dto) {
		return this.memberDao.mod(dto);
	}

	@Override
	public String memberupdate(MemberDTO dto) {
		int affectRowCnt = this.memberDao.memberupdate(dto);
		if (affectRowCnt == 1) {
                return "수정성공";
	    }
	     return null;
	    }
	@Override
	public String myPage() {
		
		return null;
	}

	@Override
	public String delete(MemberDTO dto) {
		int affectRowCnt = this.memberDao.delete(dto);
		if (affectRowCnt == 1) {

		}
		return null;
	}
	
	

	}



