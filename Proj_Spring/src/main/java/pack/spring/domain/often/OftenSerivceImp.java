package pack.spring.domain.often;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OftenSerivceImp implements OftenService {

	@Autowired
	OftenDAO oftendao;
	
	@Override
	public List<OftenDTO> listAll() throws Exception {

		return this.oftendao.listAll();
	}

	@Override
	public int write(Map<String, Object> map) {
		return this.oftendao.insert(map);
	}

}
