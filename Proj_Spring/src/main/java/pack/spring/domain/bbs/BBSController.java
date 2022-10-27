package pack.spring.domain.bbs;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BBSController {

	@RequestMapping(value = "/NotWrite", method = RequestMethod.GET)
	public ModelAndView NotWrite() {
		return new ModelAndView("/BBS/NotWrite");
	}
	// 모델과 뷰를 연결하는 컨트롤러 완성

	@Autowired
	BBSService bbsService;

	// /////////////////공지사항 글 쓰기 시작
	@RequestMapping(value = "/NotWrite", method = RequestMethod.POST)
	public ModelAndView NotWritePost(@RequestParam Map<String, Object> map) {

		ModelAndView mav = new ModelAndView();

		String admin = this.bbsService.writeNot(map);
		if (admin == null) {
			mav.setViewName("redirect:/NotWrite");
		} else {
			mav.setViewName("redirect:/Notdetail?num=" + admin);
		}
		return mav;
	}
	// //////////////////공지사항 글 쓰기 끝

	// //////////////////공지사항 상세보기 시작
	@RequestMapping(value = "/Notdetail", method = RequestMethod.GET)
	public ModelAndView Notdetail(@RequestParam Map<String, Object> map) {

		Map<String, Object> NotdetailMap = this.bbsService.Notdetail(map);

		ModelAndView mav = new ModelAndView();
		mav.addObject("data", NotdetailMap);
		String num = map.get("num").toString();
		mav.addObject("num", num);
		mav.setViewName("/BBS/Notdetail");
		return mav;
	}

	// //////////////////공지사항 상세보기 끝

	// ////////////////////공지사항 전체보기 시작
	@RequestMapping(value = "/Notlist", method = RequestMethod.GET)
	public ModelAndView Notlist(@RequestParam Map<String, Object> map) {
		List<Map<String, Object>> NotlistMap = this.bbsService.NotList(map);

		ModelAndView mav = new ModelAndView();
		mav.addObject("data", NotlistMap);
		mav.setViewName("/BBS/Notlist");
		return mav;
	}
	// ////////////////////공지사항 전체보기 끝

	// ////////////////////공지사항 수정하기 시작
	@RequestMapping(value = "/Notupd", method = RequestMethod.GET)
	public ModelAndView Notupd(@RequestParam Map<String, Object> map) {

		Map<String, Object> NotupdMap = this.bbsService.Notupd(map);

		ModelAndView mav = new ModelAndView();
		mav.addObject("data", NotupdMap);
		mav.setViewName("/BBS/Notupd");
		return mav;
	}



	@RequestMapping(value = "/Notupd", method = RequestMethod.POST)
	public ModelAndView Modnot(@RequestParam Map<String, Object> map) {
		int ModnotMap = this.bbsService.modifynot(map);
		ModelAndView mav = new ModelAndView();
		mav.addObject("data", ModnotMap);
		String num = map.get("num").toString();
		mav.addObject("num", num);
		mav.setViewName("redirect:/Notdetail?num="+num);
		return mav;
	}
	// ////////////////////공지사항 수정하기 끝
	
	// ///////////////////공지사항 삭제하기 시작
	@RequestMapping(value = "/Notdel", method = RequestMethod.GET)
	public ModelAndView delnot(@RequestParam Map<String, Object> map) {
		int delnotMap = this.bbsService.delnot(map);
		ModelAndView mav = new ModelAndView();
		mav.addObject("data", delnotMap);
		String num = map.get("num").toString();
		mav.addObject("num",num);
		mav.setViewName("redirect:/Notlist");
		return mav;
	}
	

	// ///////////////////공지사항 삭제하기 끝
	
	
}
