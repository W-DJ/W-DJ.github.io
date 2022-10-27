package pack.spring.domain.member;


import java.util.List;
import java.util.Map;

public interface MemberService {

	public String join(Map<String, Object> map) throws Exception;

	public MemberDTO login(MemberDTO dto) throws Exception;

	public List<Map<String, Object>> list(Map<String, Object> map);


	String index();
    String myPage();

	public MemberDTO membermod(MemberDTO dto);

	public String memberupdate(MemberDTO dto);

	//회원탈퇴

	public String delete(MemberDTO dto);




}
