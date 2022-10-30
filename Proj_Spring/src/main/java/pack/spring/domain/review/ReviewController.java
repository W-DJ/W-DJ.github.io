package pack.spring.domain.review;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import pack.spring.domain.member.MemberDTO;
import pack.spring.domain.order.OrderService;
import pack.spring.domain.product.Criteria;
import pack.spring.domain.product.PageMaker;
import pack.spring.domain.product.ProdService;

@Controller
public class ReviewController {
	
	@Autowired
	ReviewService reviewService;
	
	@Autowired
	ProdService prodService;
	@Autowired
	OrderService orderService;
	
	@RequestMapping(value = "/reviewPost", method = RequestMethod.GET)
	public ModelAndView reviewPost(HttpSession session, @RequestParam("prodNum") int prodNum, @RequestParam("orderNum") int orderNum) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("review/reviewPost");
		return mav;
	}
	
	@RequestMapping(value = "/reviewPost", method = RequestMethod.POST)
	public ModelAndView reviewPost(MultipartFile imgFile, ReviewBoardBean reviewBoardBean,
			HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		if (imgFile.getSize() != 0) {
			String oriFileName = imgFile.getOriginalFilename();
			int fileSize = (int) imgFile.getSize();
			String sysFileName = this.prodService.fileUpload(imgFile);
			reviewBoardBean.setOriFileName(oriFileName);
			reviewBoardBean.setFileSize(fileSize);
			reviewBoardBean.setSysFileName(sysFileName);
		}

		String ip = request.getRemoteAddr();
		reviewBoardBean.setIp(ip);
		int prodNum = reviewBoardBean.getProdNum();
		int orderNum =reviewBoardBean.getOrderNum();
		String post_OK = reviewService.post(reviewBoardBean);
		if (post_OK == null) {
			mav.setViewName("redirect:/reviewPost?prodNum="+prodNum+"&orderNum="+orderNum);
		} else {
			String reviewStatus = "1";
			this.orderService.modReviewStatus(orderNum, prodNum, reviewStatus);
			mav.setViewName("redirect:/orderList");
		}
		return mav;
	}
	
	@RequestMapping(value = "/reviewList", method = RequestMethod.GET)
	public ModelAndView reviewList(Criteria cri, @RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);

		pageMaker.setTotalCount(this.reviewService.countBoardListTotal(map));
		map.put("pageStart", cri.getPageStart());
		map.put("perPageNum", cri.getPerPageNum());

		List<Map<String, Object>> reviewList = this.reviewService.reviewList(map);

		mav.addObject("reviewList", reviewList);
		mav.addObject("pageMaker", pageMaker);
		mav.addObject("search", map);
		mav.setViewName("review/reviewList");

		return mav;

	}
	
	@RequestMapping(value = "/reviewMod", method = RequestMethod.GET)
	public ModelAndView reviewModGet(@RequestParam Map<String, Object> map, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if (session.getAttribute("user") == null) {
			mav.setViewName("/unauthAccess");
			return mav;
		}
		ReviewBoardBean reviewBoardBean = this.reviewService.read(map);
		String regId = reviewBoardBean.getRegId();
		if (!regId.equals(((MemberDTO)session.getAttribute("user")).getuId()) && session.getAttribute("admin") == null) {
			mav.setViewName("/unauthAccess");
		} else {
			mav.addObject("search", map);
			mav.addObject("reviewBoardBean", reviewBoardBean);
			mav.setViewName("review/reviewMod");
		}
		return mav;

	}
	
	@RequestMapping(value = "/reviewMod", method = RequestMethod.POST)
	public ModelAndView reviewModSet(@RequestParam Map<String, Object> map, ReviewBoardBean reviewBoardBean) {
		String reviewMod_Msg = null;
		int prodNum = reviewBoardBean.getProdNum();
		ModelAndView mav = new ModelAndView();
		int rtnCnt = this.reviewService.mod(reviewBoardBean);
		if (rtnCnt == 1) {
			reviewMod_Msg = "수정되었습니다.";
		} else {
			reviewMod_Msg = "수정에 실패하였습니다.";
		}
		mav.addObject("reviewMod_Msg", reviewMod_Msg);
		mav.addObject("search", map);
		mav.setViewName("redirect:/reviewList?prodNum="+prodNum);
		return mav;

	}
	
	@RequestMapping(value = "/reviewDel", method = RequestMethod.GET)
	public ModelAndView reviewDel(@RequestParam Map<String, Object> map, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if (session.getAttribute("user") == null) {
			mav.setViewName("/unauthAccess");
			return mav;
		}
		ReviewBoardBean reviewBoardBean = this.reviewService.read(map);
		String regId = reviewBoardBean.getRegId();
		int prodNum = reviewBoardBean.getProdNum();
		if (!regId.equals(((MemberDTO)session.getAttribute("user")).getuId()) && session.getAttribute("admin") == null) {
			mav.setViewName("/unauthAccess");
		} else {
			this.reviewService.del(map);
			mav.addObject("search", map);
			mav.setViewName("redirect:/reviewList?prodNum="+prodNum);
		}
		return mav;

	}
	
	
	@RequestMapping(value = "/reviewRec", method = RequestMethod.GET)
	public ModelAndView reviewRec(@RequestParam Map<String, Object> map, HttpSession session) {
		String recommend_Msg = null;
		
		ModelAndView mav = new ModelAndView();
		String presserId = ((MemberDTO)session.getAttribute("user")).getuId();
		map.put("presserId", presserId);
		int dpChk = 1;
		dpChk = this.reviewService.recommendDp(map);
		if (dpChk == 0) {
			int rtCnt = this.reviewService.recommend(map);
			if (rtCnt == 1) {
				recommend_Msg = "추천되었습니다.";
			} else {
				recommend_Msg = "추천에 문제가 발생했습니다.";
			}
		} else if (dpChk == 1){
			recommend_Msg = "이미 추천하셨습니다.";
		}
		
		int prodNum = Integer.parseInt(map.get("prodNum").toString());
		mav.addObject("search", map);
		mav.addObject("recommend_Msg", recommend_Msg);
		mav.setViewName("redirect:/reviewList?prodNum="+prodNum);
		return mav;

	}
	
}
