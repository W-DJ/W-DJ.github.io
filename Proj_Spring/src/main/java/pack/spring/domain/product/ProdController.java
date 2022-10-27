package pack.spring.domain.product;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class ProdController {
	
	@Autowired
	ProdService prodService;
	
	@RequestMapping(value="/prodPost", method=RequestMethod.GET)
	public ModelAndView prodPost() {
		return new ModelAndView("product/prodPost");
	}
	
	@RequestMapping(value="/prodPost", method=RequestMethod.POST)
	public ModelAndView prodPost(MultipartFile imgFile, ProdBoardBean prodBoardBean, @RequestParam List<String> sellLabelCode, RedirectAttributes rttr) {
		System.out.println(prodBoardBean.getRegId());
		ModelAndView mav = new ModelAndView();
		
		if(imgFile != null) {
			String oriFileName = imgFile.getOriginalFilename();
			int fileSize = (int)imgFile.getSize();
			String sysFileName = this.prodService.fileUpload(imgFile);
			prodBoardBean.setOriFileName(oriFileName);
			prodBoardBean.setFileSize(fileSize); 
			prodBoardBean.setSysFileName(sysFileName); 
		}
		
		String[] sellLabelName = {"BEST", "NEW", "SALE", "NONE"};
		String sellLabel = "";
		for (int i=0; i<sellLabelCode.size(); i++) {
			for(int j=0; j<sellLabelName.length; j++) {
				if (sellLabelCode.get(i).equals(sellLabelName[j])) {
					 sellLabel += '1';
				} else {
					sellLabel += '0';
				}
			}
		}
		prodBoardBean.setSellLabel(sellLabel); 
		rttr.addFlashAttribute("prodBoardBean", prodBoardBean);
		mav.setViewName("redirect:/prodPostProc");
		return mav;
	}
	
	@RequestMapping(value="/prodPostProc", method=RequestMethod.GET)
	public ModelAndView prodPostProc(ProdBoardBean prodBoardBean) {
		ModelAndView mav = new ModelAndView();
		String post_num = this.prodService.prodPost(prodBoardBean);
		
		if (post_num == null) {
			mav.setViewName("redirect:/prodPost");
		} else {
			mav.setViewName("redirect:/prodList");
		}
		return mav;
	}

	
	
	
	@RequestMapping(value="/prodRead", method=RequestMethod.GET)
	public ModelAndView prodRead(@RequestParam("num") int num, @RequestParam Map<String, Object> map, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		ProdBoardBean prodBoardBean = this.prodService.prodRead(num);
		mav.addObject("search", map);
		if (prodBoardBean != null) {
			session.setAttribute("board", prodBoardBean);
			mav.setViewName("product/prodRead");
		} else {
			mav.setViewName("redirect:/prodList");
		}
		return mav;
		
	}
	
	
	@RequestMapping(value="/prodList", method=RequestMethod.GET)
	public ModelAndView prodList(Criteria cri, @RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		String keyWord = ""; // DB의 검색어 
		String orderBy = "num_desc"; // DB 정렬순서
		String typeSearch = "전체"; // 제품별 검색어

		if (map.get("keyWord") == null) {
			map.put("keyWord", keyWord);
		}

		if (map.get("orderBy") == null) {
			map.put("orderBy", orderBy);
		}

		if (map.get("typeSearch") == null) {
			map.put("typeSearch", typeSearch);
		}

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);

		pageMaker.setTotalCount(this.prodService.countBoardListTotal(map));
		map.put("pageStart", cri.getPageStart());
		map.put("perPageNum", cri.getPerPageNum());
		
		
		List<Map<String, Object>>prodList = this.prodService.prodList(map);
		if (prodList != null) {
			mav.addObject("prodList", prodList);
			mav.addObject("pageMaker", pageMaker);
			mav.addObject("search", map);
			if(map.get("ifrm") != null) {
				mav.setViewName("product/mainLayout_ProdList");
			} else {
				mav.setViewName("product/prodList");
			}
		} else {
			mav.setViewName("redirect:/");
		}
		return mav;
		
	}
	
	
	@RequestMapping(value="/prodMod", method=RequestMethod.GET)
	public ModelAndView prodModGet(@RequestParam Map<String, Object> map, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("search", map);
		if (session.getAttribute("board") != null) {
			mav.setViewName("product/prodMod");
		} else {
			mav.setViewName("redirect:/prodList");
		}
		return mav;
		
	}
	
	@RequestMapping(value="/prodMod", method=RequestMethod.POST)
	public ModelAndView prodModSet(ProdBoardBean prodBoardBean, @RequestParam Map<String, Object> map, @RequestParam List<String> sellLabelCode) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("search", map);
		
		String[] sellLabelName = {"BEST", "NEW", "SALE", "NONE"};
		String sellLabel = "";	
		for (int i=0; i<sellLabelCode.size(); i++) {
			for(int j=0; j<sellLabelName.length; j++) {
				if (sellLabelCode.get(i).equals(sellLabelName[j])) {
					 sellLabel += '1';
				} else {
					sellLabel += '0';
				}
			}
		}
		prodBoardBean.setSellLabel(sellLabel); 
		prodBoardBean.setNum(Integer.parseInt(map.get("num").toString()));
		String mod_Msg = this.prodService.prodMod(prodBoardBean);
		mav.addObject("mod_Msg", mod_Msg);
		if (mod_Msg == null) {
			mav.setViewName("redirect:/prodMod");
		} else {
			mav.setViewName("redirect:/prodList");
		}
		return mav;
	}
	
	
	// 상품 삭제 페이지 시작
		@RequestMapping(value = "/prodDel", method=RequestMethod.GET)
		public ModelAndView prodDel(@RequestParam("num") int num, @RequestParam Map<String, Object> map, HttpSession session) {
			ModelAndView mav = new ModelAndView();
			mav.addObject("search", map);
			if (session.getAttribute("aId_Session") != null) {
				
				String del_Msg = this.prodService.prodDel(num);
				mav.addObject("del_Msg", del_Msg);
			}
			mav.setViewName("redirect:/prodList");
			return mav;
		}

		// 상품 삭제 페이지 끝
	
	
	
}
