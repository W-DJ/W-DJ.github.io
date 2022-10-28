package pack.spring.domain.product;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class ProdServiceImp implements ProdService {

	@Autowired
	ProdDao prodDao;

	@Resource(name = "uploadPath")
	private String uploadPath; // 업로드된 파일 저장 경로

	@Override
	public String fileUpload(MultipartFile files) {
		UUID uuid = UUID.randomUUID();
		String fileName = uuid + "_" + files.getOriginalFilename();

		File saveFile = new File(uploadPath, fileName);
		try {
			files.transferTo(saveFile);
		} catch (IOException e) {
			System.out.println("Exception : " + e.getMessage());
		}

		return fileName;
	}

	@Override
	public String prodPost(ProdBoardBean prodBoardBean) {

		int affectRowCnt = this.prodDao.prodPost(prodBoardBean);
		if (affectRowCnt == 1) {
			return "등록성공";
		}
		return null;

	};

	@Override
	public ProdBoardBean prodRead(int num) {
		int rtnCnt = this.prodDao.prodReadCntAdd(num);
		if (rtnCnt == 1) {
			return this.prodDao.prodRead(num);
		} else {
			return null;
		}
	};

	@Override
	public int countBoardListTotal(Map<String, Object> map) {
		return this.prodDao.getCountBoard(map);
	};

	@Override
	public List<Map<String, Object>> prodList(Map<String, Object> map) {
		return this.prodDao.getProdList(map);

	};
	@Override
	public String prodMod(ProdBoardBean prodBoardBean) {
		int affectRowCnt = this.prodDao.prodMod(prodBoardBean);
		if (affectRowCnt == 1) {
			return "수정성공";
		}
		return "수정오류";
	};

	
	@Override
	public String prodDel(int num) {
		int affectRowCnt = this.prodDao.prodDel(num);
		if (affectRowCnt == 1) {
			return "삭제성공";
		}
		return "삭제오류";
	};
	
	
	@Override
	public int wishDpChk(WishlistBean wishlistBean) {
		return this.prodDao.wishDpChk(wishlistBean);
	};	
	
	
	@Override
	public int wishInsert (WishlistBean wishlistBean) {
		return this.prodDao.wishInsert(wishlistBean);
	};
	
	
	@Override
	public Map<String, Object> cartDpChk(CartBean cartBean) {
		return this.prodDao.cartDpChk(cartBean);
	};	
	
	@Override
	public int cartInsert (CartBean cartBean) {
		return this.prodDao.cartInsert(cartBean);
	};
	
	@Override
	public int cartPlus (CartBean cartBean) {
		return this.prodDao.cartPlus(cartBean);
	};
	
	@Override
	public int countWishlistTotal(String uId) {
		return this.prodDao.getCountWishlist(uId);
	};
	
	@Override
	public List<WishlistBean> wishlist(String uId) {
		List<WishlistBean> wishlist = this.prodDao.getWishlist(uId);
		for (int i = 0; i < wishlist.size(); i++) {
			WishlistBean wishlistRow =wishlist.get(i);
			int pNum = wishlistRow.getpNum();
			ProdBoardBean prodBean = this.prodDao.prodRead(pNum);
			wishlistRow.setpName(prodBean.getpName());
			wishlistRow.setSellPrice(prodBean.getSellPrice());
			wishlistRow.setSysFileName(prodBean.getSysFileName());
			wishlist.set(i, wishlistRow);
		}
		return wishlist;
	};
	
	@Override
	public List<CartBean> cartList(String uId) {
		List<CartBean> cartList = this.prodDao.getCartList(uId);
		System.out.println(cartList.toString());
		if (cartList != null) {
			for (int i = 0; i < cartList.size(); i++) {
				CartBean cartListRow =cartList.get(i);
				int pNum = cartListRow.getpNum();
				ProdBoardBean prodBean = this.prodDao.prodRead(pNum);
				cartListRow.setpName(prodBean.getpName());
				cartListRow.setSellPrice(prodBean.getSellPrice());
				cartListRow.setSysFileName(prodBean.getSysFileName());
				cartListRow.setStockVolumn(prodBean.getStockVolumn());
				cartList.set(i, cartListRow);
			}
		}
		return cartList;
	};
	
	@Override
	public int cartMod (CartBean cartBean) {
		return this.prodDao.cartMod(cartBean);
	};
	
}
