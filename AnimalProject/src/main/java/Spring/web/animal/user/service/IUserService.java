package Spring.web.animal.user.service;

import java.util.Date;

import Spring.web.animal.user.model.UserVO;

public interface IUserService {

	
	void register(UserVO vo);
	public UserVO Id_Check(String id);
	UserVO selectOne(String account);
	void delete(UserVO vo);
	void keep(String sessionId, Date limitDate , String account);
	UserVO getUserWithSessionId(String sessionId);
}
