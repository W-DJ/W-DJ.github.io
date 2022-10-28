package pack.spring.domain.admin;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {

	// 관리자 회원가입
	@RequestMapping(value = "/ajoin", method = RequestMethod.GET)
	    public ModelAndView join() {
		return new ModelAndView("admin/join");
	}

	@Autowired
	AdminService adminService;

	@RequestMapping(value = "/ajoin", method = RequestMethod.POST)
	    public ModelAndView createPost(@RequestParam Map<String, Object> map) throws Exception {
		ModelAndView mav = new ModelAndView();
		String adminId = this.adminService.join(map);
		if (adminId == null) {
			mav.setViewName("redirect: admin/join");
		} else {
			mav.setViewName("redirect: admin/index");
		}
		return mav;

	}

	// 관리자 로그인
	@RequestMapping(value = "/alogin", method = RequestMethod.GET)
		public ModelAndView loginform() throws Exception {
		return new ModelAndView("admin/index");
	}

	// 관리자 로그인(세션 생성 session)
	@RequestMapping(value = "/alogin", method = RequestMethod.POST)
		public String login(AdminDTO dto, HttpSession session) throws Exception {
		AdminDTO login = this.adminService.login(dto);
		if (login != null) {
			session.setAttribute("admin", login);
		}

		return "redirect: /";
	}


}
