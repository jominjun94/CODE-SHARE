package Spring.web.animal.user.repository;

import java.util.Date;
import java.util.Map;

import Spring.web.animal.user.model.UserVO;

public interface IUserMapper {

	
	void register(UserVO vo);
	UserVO Id_Check(String id);
	UserVO selectOne(String account);
	void delete(UserVO vo);
	void keep(Map<String, Object> datas);
	UserVO getUserWithSessionId(String sessionId);

}
