package Spring.web.animal.user.service;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import Spring.web.animal.user.model.UserVO;
import Spring.web.animal.user.repository.IUserMapper;

@Service
public class UserService implements IUserService {

	
	@Autowired //
	private IUserMapper mapper;
	
	@Override
	public void register(UserVO vo) {
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		vo.setPassword(encoder.encode(vo.getPassword()));
		mapper.register(vo);

	}

	@Override
	public UserVO Id_Check(String id) {
		// TODO Auto-generated method stub
		return mapper.Id_Check(id);
	}

	@Override
	public UserVO selectOne(String account) {
		// TODO Auto-generated method stub
		return mapper.selectOne(account);
	}

	@Override
	public void delete(UserVO vo) {
		//BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		//vo.setPassword(encoder.encode(vo.getPassword()));
		//System.out.println(vo.getAccount());
		//System.out.println(vo.getPassword());
		mapper.delete(vo);
		
	}

	@Override
	public void keep(String sessionId, Date limitDate, String account) {
		 
		Map<String, Object> datas = new HashMap<>();
		datas.put("sessionId", sessionId);
		datas.put("limitDate", limitDate);
		datas.put("account", account);
		
		mapper.keep(datas);
		
	}

	@Override
	public UserVO getUserWithSessionId(String sessionId) {
		// TODO Auto-generated method stub
		return mapper.getUserWithSessionId(sessionId);
	}







	

}
