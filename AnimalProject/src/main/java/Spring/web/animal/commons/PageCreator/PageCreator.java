package Spring.web.animal.commons.PageCreator;

import Spring.web.animal.board.controller.SearchVO;

public class PageCreator {
    //countPerPage page
	private SearchVO paging;
	private Integer articleTotalCount;//게시판의 총 게시물 수
	private Integer beginPage; //시작 페이지 번호
	private Integer endPage; //끝 페이지 번호
	private boolean prev; //이전 버튼 활성화 여부
	private boolean next; //다음 버튼 활성화 여부
	
	private final Integer displayPageNum = 5;
	private void calDataOfPage() {
		
		endPage = 
				 (int)Math.ceil(paging.getPage() 
							/ (double)displayPageNum)
					  		* displayPageNum;
		
		beginPage = (endPage - displayPageNum) + 1;
		
		prev = (beginPage == 1) ? false : true;
		
		next = (articleTotalCount <= (endPage * paging.getCountPerPage())) ? false : true;
		
		if(!isNext()) {
			//끝 페이지 재보정하기
			endPage = (int)Math.ceil(articleTotalCount / (double)paging.getCountPerPage());
		}
	}

	public SearchVO getPaging() {
		return paging;
	}

	public void setPaging(SearchVO paging) {
		this.paging = paging;
	}

	public Integer getArticleTotalCount() {
		return articleTotalCount;
	}

	public void setArticleTotalCount(Integer articleTotalCount) {
		this.articleTotalCount = articleTotalCount;
		calDataOfPage();
	}

	public Integer getBeginPage() {
		return beginPage;
	}

	public void setBeginPage(Integer beginPage) {
		this.beginPage = beginPage;
	}

	public Integer getEndPage() {
		return endPage;
	}

	public void setEndPage(Integer endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public Integer getDisplayPageNum() {
		return displayPageNum;
	}
	
}
