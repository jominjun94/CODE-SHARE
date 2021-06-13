package Spring.web.animal.board.controller;

public class SearchVO {

	
	private Integer page; // 현재 페이지
	private Integer countPerPage;// 페이지에 보여질 갯수 
	private String keyword; // 
	private String condition;
	
	
	
	public SearchVO(Integer page, Integer countPerPage, String keyword, String condition) {
		
		this.page = 1;
		this.countPerPage = 5;
		this.keyword = "";
		this.condition = "";
	}
	
	
	public Integer getPageStart() {
		
		return (this.page  -1) * this.countPerPage;
	}
	
	public Integer getPage() {
		return page;
		
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getCountPerPage() {
		return countPerPage;
	}
	public void setCountPerPage(Integer countPerPage) {
		this.countPerPage = countPerPage;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}

	
	
	
	
	
}

