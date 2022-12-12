package pack.spring.domain.bbs;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.catalina.connector.Request;
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

	@RequestMapping(value = "/InqWrite", method = RequestMethod.GET)
	public ModelAndView InqWrite() {
		return new ModelAndView("/BBS/InqWrite");
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
		mav.setViewName("redirect:/Notdetail?num=" + num);
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
		mav.addObject("num", num);
		mav.setViewName("redirect:/Notlist");
		return mav;
	}

	// ///////////////////공지사항 삭제하기 끝

	///////////////////// 고객문의 글 쓰기 시작

	@RequestMapping(value = "/InqWrite", method = RequestMethod.POST)
	public ModelAndView InqWritePost(@RequestParam Map<String, Object> map, HttpServletRequest req) {

		ModelAndView mav = new ModelAndView();
		String ip = req.getRemoteAddr();
		System.out.println(ip);

		String user = this.bbsService.writeInq(map);
		if (user == null) {
			mav.setViewName("redirect:/InqWrite");
		} else {
			mav.setViewName("redirect:/Inqdetail?num=" + user);
		}
		return mav;
	}
	// //////////////////고객문의 글 쓰기 끝

	///////////////////// 고객문의 상세보기 시작
	@RequestMapping(value = "/Inqdetail", method = RequestMethod.GET)
	public ModelAndView InWritePost(@RequestParam Map<String, Object> map, HttpServletRequest req) {

		Map<String, Object> InqdetailMap = this.bbsService.Inqdetail(map);

		String ip = req.getRemoteAddr();
		//System.out.println(ip);
		ModelAndView mav = new ModelAndView();

		mav.addObject("data", InqdetailMap);
		String num = map.get("num").toString();
		mav.addObject("num", num);
		mav.setViewName("/BBS/Inqdetail");
		return mav;
	}

	// ////////////////////고객문의 전체보기 시작
		@RequestMapping(value = "/Inqlist", method = RequestMethod.GET)
		public ModelAndView Inqlist(@RequestParam Map<String, Object> map) {
			List<Map<String, Object>> InqlistMap = this.bbsService.InqList(map);

			ModelAndView mav = new ModelAndView();
			mav.addObject("data", InqlistMap);
			mav.setViewName("/BBS/Inqlist");
			return mav;
		}
		// ////////////////////고객문의 전체보기 끝

		// ////////////////////고객문의 수정하기 시작
		@RequestMapping(value = "/Inqupd", method = RequestMethod.GET)
		public ModelAndView Inqupd(@RequestParam Map<String, Object> map) {

			Map<String, Object> InqupdMap = this.bbsService.Inqupd(map);

			ModelAndView mav = new ModelAndView();
			mav.addObject("data", InqupdMap);
			mav.setViewName("/BBS/Inqupd");
			return mav;
		}

		@RequestMapping(value = "/Inqupd", method = RequestMethod.POST)
		public ModelAndView Modinq(@RequestParam Map<String, Object> map) {
			
			int ModinqMap = this.bbsService.modifyinq(map);
			
			ModelAndView mav = new ModelAndView();
			
			mav.addObject("data", ModinqMap);
			
			String num_inq = map.get("num").toString();
			
			mav.addObject("num", num_inq);
			
			mav.setViewName("redirect:/Inqdetail?num=" + num_inq);
			return mav;
		}
		// ////////////////////고객문의 수정하기 끝

		// ///////////////////고객문의 삭제하기 시작
		@RequestMapping(value = "/Inqdel", method = RequestMethod.GET)
		public ModelAndView delinq(@RequestParam Map<String, Object> map) {
			int delinqMap = this.bbsService.delinq(map);
			ModelAndView mav = new ModelAndView();
			mav.addObject("data", delinqMap);
			String num = map.get("num").toString();
			mav.addObject("num", num);
			mav.setViewName("redirect:/Inqlist");
			return mav;
		}

		// ///////////////////고객문의 삭제하기 끝
	
	
}
