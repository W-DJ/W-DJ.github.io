package pack.spring.domain.member;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	
	//인덱스 페이지
	@RequestMapping(value = "/")
	public ModelAndView index() {
	ModelAndView mav = new ModelAndView();
	mav.setViewName("/index");
	return mav;
	}

	// 회원 가입	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public ModelAndView join() {
    return new ModelAndView("member/join"); }
	 
	
	@Autowired
	MemberService memberService;
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public ModelAndView createPost(@RequestParam Map<String, Object> map) throws Exception {
	ModelAndView mav = new ModelAndView();
	String memberId = this.memberService.join(map);
	if (memberId == null) {
	mav.setViewName("redirect:/join");
	} else {
	mav.setViewName("redirect:/");
	}
	return mav;
	
	}
	
	// 회원 로그인 	
    @RequestMapping(value="/login", method=RequestMethod.GET)
    public ModelAndView loginform() throws Exception {
    return new ModelAndView("member/login");
    }
	  
    // 회원 로그인(세션 생성 session)
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(MemberDTO dto, HttpSession session) throws Exception{
		MemberDTO login = this.memberService.login(dto);
		if(login != null) {
			session.setAttribute("user",login);
		}

		return "redirect:/";
	}
	
	// 마이페이지
	@RequestMapping(value="/myPage", method=RequestMethod.GET)
		public ModelAndView myPage(HttpSession session) throws Exception{
			ModelAndView mav = new ModelAndView();
			if(session.getAttribute("user") != null) {
				mav.setViewName("/member/myPage");
			}else {
			    mav.setViewName("redirect:/"); 
			} 
			return mav;
		}
	
	// 회원 로그아웃(세션 소멸 invalidate)
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		  session.invalidate();
	// == session.removeAttribute("login");
	return "redirect:/";
	}
	  
	// 회원정보수정	
	@RequestMapping(value="/mod", method=RequestMethod.GET)
	public ModelAndView membermod(MemberDTO dto,HttpSession session) throws Exception {				
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/mod");
		return mav;
    }
	
	  @RequestMapping(value="/mod", method=RequestMethod.POST)
	  public ModelAndView memberupdate(MemberDTO dto, HttpSession session) { 
	  String str = this.memberService.memberupdate(dto);
	  ModelAndView mav = new ModelAndView();
	  if(str == null) {
	     mav.setViewName("member/mod");
	  }else {
		session.setAttribute("user", dto);
	    mav.setViewName("redirect:/"); } 
	  return mav;
	  }
	
	  @RequestMapping(value="/memberDel", method=RequestMethod.GET)
	  public ModelAndView memberDel() throws Exception {
		  ModelAndView mav = new ModelAndView();
		  mav.setViewName("/member/memberDel");
		  return mav;
	  }
	  @RequestMapping(value="/memberDel",method=RequestMethod.POST)
	  public ModelAndView delete(HttpSession session, MemberDTO dto) throws Exception{
		 ModelAndView mav = new ModelAndView();
		 MemberDTO sessionDto = (MemberDTO)session.getAttribute("user");
		 dto.setuId(sessionDto.getuId());
		 if(session.getAttribute("user") != null) {
			mav.setViewName("redirect:/");
			this.memberService.delete(dto);
			session.invalidate();
		 }else {
			mav.setViewName("redirect:/");
		 }
		 return mav;
	  }
	
	
	
	
	
	// 회원전체 목록  
	@RequestMapping(value="/list")
	public ModelAndView list(@RequestParam Map<String, Object> map) {
	List<Map<String, Object>> list = this.memberService.list(map);
	ModelAndView mav = new ModelAndView();
	mav.addObject("data",list);
	mav.setViewName("/member/list");
	return mav;
	}
	
	
	
	
	
	
	
	  
	
	  
	  
	  
	  
	  
	  
	 
}