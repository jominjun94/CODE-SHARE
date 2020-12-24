package Spring.web.animal.commons.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;



import Spring.web.animal.user.model.UserVO;
import Spring.web.animal.user.service.IUserService;

public class AutoLogininterceptor extends HandlerInterceptorAdapter {

	
	@Autowired
	IUserService service;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session =  request.getSession();
		//쿠키 있는지 확인 
		Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
		if(loginCookie != null) { // 만약 있다면 
			UserVO user = service.getUserWithSessionId(loginCookie.getValue());
			session.setAttribute("login", user);
		}
		
		
		return true;
	}
}
