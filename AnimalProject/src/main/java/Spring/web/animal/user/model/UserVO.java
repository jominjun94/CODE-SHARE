package Spring.web.animal.user.model;

import java.util.Date;

public class UserVO {
	
	private String account;
	private String password;
	private String name;
	private String tel;
	
	private boolean autoLogin;
	
	private String sessionId;
	private Date limitTime;
	
	
	
	
	





	public String getSessionId() {
		return sessionId;
	}
	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}
	public Date getLimitTime() {
		return limitTime;
	}
	public void setLimitTime(Date limitTime) {
		this.limitTime = limitTime;
	}
	public boolean isAutoLogin() {
		return autoLogin;
	}
	public void setAutoLogin(boolean autoLogin) {
		this.autoLogin = autoLogin;
	}




	private Integer viewCnt;
	
	
	public Integer getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(Integer viewCnt) {
		this.viewCnt = viewCnt;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	
	
	
	@Override
	public String toString() {
		return "UserVO [account=" + account + ", password=" + password + ", name=" + name + ", tel=" + tel + "]";
	}
	
	
	
}
