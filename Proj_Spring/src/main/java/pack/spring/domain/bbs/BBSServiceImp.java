package pack.spring.domain.bbs;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BBSServiceImp implements BBSService {

	
	@Autowired
	BBSDao bbsDao;
	
	//공지사항 글쓰기
	@Override
	public String writeNot(Map<String, Object> map) {
		
		int affectRowCnt = this.bbsDao.insert(map);
		if(affectRowCnt == 1) {
					return map.get("BBS_id").toString();
		}
		return null;
	}
	
	// 공지사항 상세보기
	@Override
	public Map<String, Object> Notdetail(Map<String, Object> map){
		return this.bbsDao.selectDetail(map);
	}

	//공지사항 전체보기
	@Override
	public List<Map<String, Object>> NotList(Map<String, Object> map){
		return this.bbsDao.selectList(map);
	}
	
	//공지사항 수정하기(가져오기)
	@Override
	public Map<String, Object> Notupd(Map<String, Object> map) {
		return this.bbsDao.selectMod(map);
	}
	
	
	@Override
	public int modifynot(Map<String, Object> map){
		return this.bbsDao.modifynot(map);
	}
	//공지사항 삭제하기
	@Override
	public int delnot(Map<String, Object> map) {
		return this.bbsDao.delnot(map);
	}
	
	//고객문의 글쓰기
		@Override
		public String writeInq(Map<String, Object> map) {
			
			int affectRowCnt = this.bbsDao.insert_inq(map);
			if(affectRowCnt == 1) {
						return map.get("BBS_id").toString();
			}
			return null;
		}
		
		// 고객문의 상세보기
		@Override
		public Map<String, Object> Inqdetail(Map<String, Object> map){
			return this.bbsDao.selectDetail_inq(map);
		}

		//고객문의 전체보기
		@Override
		public List<Map<String, Object>> InqList(Map<String, Object> map){
			return this.bbsDao.selectList_inq(map);
		}
		
		//고객문의 수정하기(가져오기)
		@Override
		public Map<String, Object> Inqupd(Map<String, Object> map) {
			return this.bbsDao.selectMod_inq(map);
		}
		
		
		@Override
		public int modifyinq(Map<String, Object> map){
			return this.bbsDao.modifyinq(map);
		}
		//고객문의 삭제하기
		@Override
		public int delinq(Map<String, Object> map) {
			return this.bbsDao.delinq(map);
		}

		@Override
		public List<BBSDto> bBSList(int num) {
			
			return null;
		}
	
}
