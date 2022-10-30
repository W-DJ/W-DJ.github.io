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

import pack.spring.domain.member.MemberDTO;

@Controller
public class ProdController {

	@Autowired
	ProdService prodService;

	@RequestMapping(value = "/prodPost", method = RequestMethod.GET)
	public ModelAndView prodPost(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if (session.getAttribute("admin") != null) {
			mav.setViewName("product/prodPost");
		} else {
			mav.setViewName("redirect:/");
		}
		return mav;
	}

	@RequestMapping(value = "/prodPost", method = RequestMethod.POST)
	public ModelAndView prodPost(MultipartFile imgFile, ProdBoardBean prodBoardBean,
			@RequestParam List<String> sellLabelCode, RedirectAttributes rttr) {

		ModelAndView mav = new ModelAndView();

		if (imgFile.getSize() != 0) {
			String oriFileName = imgFile.getOriginalFilename();
			int fileSize = (int) imgFile.getSize();
			String sysFileName = this.prodService.fileUpload(imgFile);
			prodBoardBean.setOriFileName(oriFileName);
			prodBoardBean.setFileSize(fileSize);
			prodBoardBean.setSysFileName(sysFileName);
		}

		String[] sellLabelName = { "BEST", "NEW", "SALE", "NONE" };
		String sellLabel = "";
		for (int i = 0; i < sellLabelCode.size(); i++) {
			for (int j = 0; j < sellLabelName.length; j++) {
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

	@RequestMapping(value = "/prodPostProc", method = RequestMethod.GET)
	public ModelAndView prodPostProc(ProdBoardBean prodBoardBean) {
		ModelAndView mav = new ModelAndView();
		String post_OK = this.prodService.prodPost(prodBoardBean);

		if (post_OK == null) {
			mav.setViewName("redirect:/prodPost");
		} else {
			mav.setViewName("redirect:/prodList");
		}
		return mav;
	}

	@RequestMapping(value = "/prodRead", method = RequestMethod.GET)
	public ModelAndView prodRead(@RequestParam("num") int num, @RequestParam Map<String, Object> map,
			HttpSession session) {
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

	@RequestMapping(value = "/prodList", method = RequestMethod.GET)
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

		List<Map<String, Object>> prodList = this.prodService.prodList(map);
		if (prodList != null) {
			mav.addObject("prodList", prodList);
			mav.addObject("pageMaker", pageMaker);
			mav.addObject("search", map);
			if (map.get("ifrm") != null) {
				mav.setViewName("product/mainLayout_ProdList");
			} else {
				mav.setViewName("product/prodList");
			}
		} else {
			mav.setViewName("redirect:/");
		}
		return mav;

	}

	@RequestMapping(value = "/prodMod", method = RequestMethod.GET)
	public ModelAndView prodModGet(@RequestParam Map<String, Object> map, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("search", map);
		if (session.getAttribute("admin") != null) {
			if (session.getAttribute("board") != null) {
				mav.setViewName("product/prodMod");
			} else {
				mav.setViewName("redirect:/prodList");
			}
		} else {
			mav.setViewName("redirect:/");
		}
		return mav;

	}

	@RequestMapping(value = "/prodMod", method = RequestMethod.POST)
	public ModelAndView prodModSet(ProdBoardBean prodBoardBean, @RequestParam Map<String, Object> map,
			@RequestParam List<String> sellLabelCode) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("search", map);

		String[] sellLabelName = { "BEST", "NEW", "SALE", "NONE" };
		String sellLabel = "";
		for (int i = 0; i < sellLabelCode.size(); i++) {
			for (int j = 0; j < sellLabelName.length; j++) {
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
	@RequestMapping(value = "/prodDel", method = RequestMethod.GET)
	public ModelAndView prodDel(@RequestParam("num") int num, @RequestParam Map<String, Object> map,
			HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("search", map);
		if (session.getAttribute("admin") != null) {

			String del_Msg = this.prodService.prodDel(num);
			mav.addObject("del_Msg", del_Msg);
		}
		mav.setViewName("redirect:/prodList");
		return mav;
	}

	// 상품 삭제 페이지 끝

	// 위시리스트 insert 시작

	@RequestMapping(value = "/wishInsert", method = RequestMethod.GET)
	public ModelAndView wishInsert(WishlistBean wishlistBean) {
		ModelAndView mav = new ModelAndView();
		String wish_Msg = "";
		int dpChk = this.prodService.wishDpChk(wishlistBean);
		if (dpChk == 0) {
			int affectRow = this.prodService.wishInsert(wishlistBean);
			if (affectRow == 1) {
				wish_Msg = "위시리스트에 추가되었습니다.";
			} else {
				wish_Msg = "위시리스트 추가에 문제가 발생했습니다.";
			}

		} else {
			wish_Msg = "이미 위시리스트에 있는 상품입니다.";
		}
		mav.addObject("wish_Msg", wish_Msg);
		mav.setViewName("product/dumyMsg");
		return mav;
	}

	// 상품 상세보기페이지에서 장바구니 insert 시작

	@RequestMapping(value = "/cartInsert", method = RequestMethod.GET)
	public ModelAndView cartInsert(CartBean cartBean) {
		ModelAndView mav = new ModelAndView();
		String cart_Msg = null;
		int affectRow = 0;
		Map<String, Object> map = this.prodService.cartDpChk(cartBean);
		if (map == null) {
			affectRow = this.prodService.cartInsert(cartBean);
		} else {
			int num = Integer.parseInt(map.get("num").toString());
			cartBean.setNum(num);
			affectRow = this.prodService.cartPlus(cartBean);
		}

		if (affectRow == 1) {
			cart_Msg = "장바구니에 추가되었습니다.";
		} else {
			cart_Msg = "장바구니 추가에 문제가 발생했습니다.";
		}

		mav.addObject("cart_Msg", cart_Msg);
		mav.setViewName("product/dumyMsg");
		return mav;
	}
	
	@RequestMapping(value = "/cartMultiInsert", method = RequestMethod.GET)
	public ModelAndView cartMultiInsert(@RequestParam("pNum")  List<Integer> pNumList, HttpSession session) {
		String cart_Msg = "";
		int affectRow = 0;
		
		ModelAndView mav = new ModelAndView();
		String uId = ((MemberDTO) session.getAttribute("user")).getuId();
		int pVolumn = 1;
		for (int i = 0; i < pNumList.size(); i++) {
			CartBean cartBean = new CartBean();
			cartBean.setpNum(pNumList.get(i));
			cartBean.setuId(uId);
			cartBean.setpVolumn(pVolumn);
			Map<String, Object> map = this.prodService.cartDpChk(cartBean);
			if (map == null) {
				affectRow = this.prodService.cartInsert(cartBean);
			} else {
				int num = Integer.parseInt(map.get("num").toString());
				cartBean.setNum(num);
				affectRow += this.prodService.cartPlus(cartBean);
			}
		}

		if (affectRow == pNumList.size()) {
			cart_Msg = "장바구니에 추가되었습니다.";
			mav.setViewName("redirect:/cartList");
		} else {
			cart_Msg = "장바구니 추가에 문제가 발생했습니다.";
			mav.setViewName("redirect:/wishist");
		}

		mav.addObject("cart_Msg", cart_Msg);
		return mav;
	}

	@RequestMapping(value = "/wishlist", method = RequestMethod.GET)
	public ModelAndView wishlist(Criteria cri, HttpSession session, @RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		if (session.getAttribute("user") != null) {
			String uId = ((MemberDTO) session.getAttribute("user")).getuId();
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);

			pageMaker.setTotalCount(this.prodService.countWishlistTotal(uId));
			map.put("pageStart", cri.getPageStart());
			map.put("perPageNum", cri.getPerPageNum());

			map.put("uId", uId);
			
			List<WishlistBean> wishlist = this.prodService.wishlist(map);
			mav.addObject("wishlist", wishlist);
			mav.addObject("pageMaker", pageMaker);
			mav.setViewName("wishlist/wishlist");
		} else {
			mav.setViewName("redirect:/");
		}
		return mav;

	}
	
	@RequestMapping(value = "/wishDel", method = RequestMethod.GET)
	public ModelAndView wishDel(@RequestParam("num")  List<Integer> pNumList) {
		int affectRow = 0;
		String del_Msg=null;
		
		ModelAndView mav = new ModelAndView();
		for (int i = 0; i < pNumList.size(); i++) {
			affectRow += this.prodService.wishDel(pNumList.get(i));
		}
		
		if (affectRow !=pNumList.size()) {
			del_Msg = "삭제에 문제가 발생했습니다.";
		}

		mav.addObject("del_Msg", del_Msg);
		mav.setViewName("redirect:/wishlist");
		return mav;
	}

	@RequestMapping(value = "/cartList", method = RequestMethod.GET)
	public ModelAndView cartList(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if (session.getAttribute("user") != null) {
		String uId = ((MemberDTO) session.getAttribute("user")).getuId();

		List<CartBean> cartList = this.prodService.cartList(uId);
		mav.addObject("cartList", cartList);

		mav.setViewName("cart/cartList");
		} else {
			mav.setViewName("redirect:/");
		}
		return mav;

	}

	@RequestMapping(value = "/cartMod", method = RequestMethod.GET)
	public ModelAndView cartMod(CartBean cartBean) {
		ModelAndView mav = new ModelAndView();
		String cart_Msg = null;
		int affectRow = this.prodService.cartMod(cartBean);

		if (affectRow != 1) {
			cart_Msg = "장바구니 변경에 문제가 발생했습니다.";
		}

		mav.addObject("cart_Msg", cart_Msg);
		mav.setViewName("product/dumyMsg");
		return mav;
	}
	
	@RequestMapping(value = "/cartDel", method = RequestMethod.GET)
	public ModelAndView cartDel(@RequestParam("num")  List<Integer> cartNumList) {
		int affectRow = 0;
		String del_Msg=null;
		
		ModelAndView mav = new ModelAndView();
		for (int i = 0; i < cartNumList.size(); i++) {
			affectRow += this.prodService.cartDel(cartNumList.get(i));
		}
		
		if (affectRow !=cartNumList.size()) {
			del_Msg = "삭제에 문제가 발생했습니다.";
		}

		mav.addObject("del_Msg", del_Msg);
		mav.setViewName("redirect:/cartList");
		return mav;
	}
}
