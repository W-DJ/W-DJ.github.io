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
}
