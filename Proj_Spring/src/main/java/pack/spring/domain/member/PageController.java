package pack.spring.domain.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PageController {


		@RequestMapping(value = "/header")
		public ModelAndView header() {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("indd/header");
			return mav;
		}

		@RequestMapping(value = "/footer")
		public ModelAndView footer() {
			ModelAndView mav = new ModelAndView();
			mav.setViewName("indd/footer");
			return mav;
		}


	}

