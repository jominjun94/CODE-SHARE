package Spring.web.animal.user.controller;



import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import Spring.web.animal.user.model.UserVO;

import Spring.web.animal.user.service.IUserService;

@RestController
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private IUserService service;
	
	
	
	@GetMapping("/")
	public ModelAndView page() {
		
		return new ModelAndView("user/page");
	}
	
	
	
	@GetMapping("/register")
	public ModelAndView register(){
			
		return new ModelAndView("user/register");
	}
	
	
	
	
	@PostMapping("/register")
	public ModelAndView register(UserVO vo) {
		service.register(vo);
		ModelAndView view = new ModelAndView();
		view.setViewName("user/page");
		view.addObject("msg","regSuccess");
		return view;
	}
	
	
	
	
	@PostMapping("/ID_Check")
	public String ID_Check(@RequestBody String id) {
		
		if(service.Id_Check(id) != null) {
			return "no";
			} else {	
				System.out.println("null");
				return "ok";
			}
		}
	
	
	
	
	@GetMapping("/login")
	public ModelAndView login1() {
		
		
		return new ModelAndView("user/login");
	}
	
	
	
	@PostMapping("/login")
	public String login(@RequestBody UserVO inputdata, HttpSession session,HttpServletResponse response) {
		String result = null;
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		UserVO dbdata = service.selectOne(inputdata.getAccount());
		
		long limitTime = 60 * 60 * 24 * 90;
		
		
		if(dbdata != null) {
			if(encoder.matches(inputdata.getPassword(), dbdata.getPassword())) {
				session.setAttribute("login", dbdata);
				result = "loginSuccess";
				if(inputdata.isAutoLogin()) {
					Cookie logincookie = new Cookie("loginCookie" ,session.getId());
					//logincookie.setPath("/user/");
					logincookie.setMaxAge((int)limitTime);
					response.addCookie(logincookie);
					
					long expiredDate = System.currentTimeMillis() + (limitTime * 1000);
					Date limitDate = new Date(expiredDate);
					service.keep(session.getId(), limitDate, inputdata.getAccount());
				}
				
			}else {
				result = "pwFail";
			}
		} else {
			result = "idFail";
		}
		
		return result;
	}
	
	
	
	
	//url
	@GetMapping("/logout")
	public ModelAndView logout(HttpSession session , HttpServletRequest request , HttpServletResponse response ) {
		//세션 삭제 , db삭제
		UserVO user = (UserVO)session.getAttribute("login");
		
		if(user != null) {
			session.removeAttribute("login");
			session.invalidate();
			//쿠키 삭제 
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			if(loginCookie != null) {
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				service.keep("none", new Date(), user.getAccount());
				
			}
			
		}
		//보여줄 페이지
		return new ModelAndView("user/page");
	}
	
	
	
	
	
	
	//회원 틸퇴 작업 
	@GetMapping("/delete")
	public ModelAndView delete() {
			
			return new ModelAndView("user/delete");
		}
	
	
	
	
	
	
	
	
	
	
	
	@PostMapping("/delete")
	public String delete1(UserVO vo) {
		
		service.delete(vo);
		return "Success";
		
	
	}
	
	
	
	
	
	
	
	
}
