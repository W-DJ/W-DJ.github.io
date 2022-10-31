package pack.spring.domain.often;

import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class OftenController {

	@Autowired
		OftenService  oftenService;
	
	// 자주하는질문게시판 전체리스트보기
	@RequestMapping(value="/OftenList",method=RequestMethod.GET)
		public ModelAndView list() throws Exception{
		List<OftenDTO> list = oftenService.listAll();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/often/Often_list");
		mav.addObject("list",list);
		return mav;
	}	
	
	// 자주하는질문게시판 글쓰기
	@RequestMapping(value="/Often_write",method = RequestMethod.GET)
		public ModelAndView writeView() {
		return new ModelAndView("often/Often_write");
	}
	@RequestMapping(value="/Often_write", method =RequestMethod.POST)
		public ModelAndView write(@RequestParam Map<String, Object> map) throws Exception{
		ModelAndView mav = new ModelAndView();

		this.oftenService.write(map);
	    mav.setViewName("redirect:/OftenList");
	    return mav;
	}
	
	// 자주하는질문게시판 상세보기
	@RequestMapping(value = "/Often_read", method = RequestMethod.GET)
	public ModelAndView read(@RequestParam Map<String, Object> map) {

		Map<String, Object> oftendetailMap = this.oftenService.read(map);

		ModelAndView mav = new ModelAndView();
		mav.addObject("data", oftendetailMap);
		String num = map.get("num").toString();
		mav.addObject("num", num);
		mav.setViewName("/often/Often_read");
		return mav;
	}
	
	@RequestMapping(value = "/Often_modify", method = RequestMethod.GET)
	public ModelAndView modify_ViewMap(@RequestParam Map<String, Object> map) {

		Map<String, Object> modify_ViewMap = this.oftenService.modify_ViewMap(map);

		ModelAndView mav = new ModelAndView();
		mav.addObject("data", modify_ViewMap);
		mav.setViewName("/often/Often_modify");
		return mav;
	}
	
	@RequestMapping(value = "/Often_modify", method = RequestMethod.POST)
	public ModelAndView update(@RequestParam Map<String, Object> map) {
		int updateMap = this.oftenService.update(map);
		ModelAndView mav = new ModelAndView();
		mav.addObject("data", updateMap);
		String num = map.get("num").toString();
		mav.addObject("num", num);
		mav.setViewName("redirect:/Often_read?num="+num);
		return mav;
	}
	
	@RequestMapping(value = "/Often_delete", method = RequestMethod.GET)
	public ModelAndView delete(@RequestParam Map<String, Object> map) {
		int delete = this.oftenService.delete(map);
		ModelAndView mav = new ModelAndView();
		mav.addObject("data", delete);
		String num = map.get("num").toString();
		mav.addObject("num",num);
		mav.setViewName("redirect:/OftenList");
		return mav;
	}
}
