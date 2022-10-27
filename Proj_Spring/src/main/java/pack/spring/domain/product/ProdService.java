package pack.spring.domain.product;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

public interface ProdService {
	String fileUpload(MultipartFile files);
	
	
	String prodPost(ProdBoardBean prodBoardBean);
	
	
	ProdBoardBean prodRead(int num);
	
	int countBoardListTotal(Map<String, Object> map);
	
	List<Map<String, Object>> prodList(Map<String, Object> map);
	
	
	String prodMod(ProdBoardBean prodBoardBean);
	
	
	String prodDel(int num);
}
