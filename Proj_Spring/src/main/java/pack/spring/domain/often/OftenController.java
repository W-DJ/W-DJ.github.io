package pack.spring.domain.often;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import pack.spring.domain.admin.AdminDTO;

@Controller
public class OftenController {

	@Autowired
	OftenService  oftenService;
	
	@RequestMapping(value="/OftenList",method=RequestMethod.GET)
	public ModelAndView list() throws Exception{
		List<OftenDTO> list = oftenService.listAll();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/often/Often_list");
		mav.addObject("list",list);
		return mav;
	}
	@RequestMapping(value="/OftenList",method=RequestMethod.POST)
	public ModelAndView listPost() throws Exception{
		List<OftenDTO> list = oftenService.listAll();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/often/Often_list");
		mav.addObject("list",list);
		return mav;
	}
	
	
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

}
