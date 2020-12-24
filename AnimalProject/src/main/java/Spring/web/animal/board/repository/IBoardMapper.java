package Spring.web.animal.board.repository;

import java.util.List;

import Spring.web.animal.board.controller.SearchVO;
import Spring.web.animal.board.model.BoardVo;

public interface IBoardMapper {

	
	void share(BoardVo vo);
	
	List<BoardVo> getArticleList(SearchVO se);
	
	Integer countArticles (SearchVO se);
	
	BoardVo getcontent(Integer boardNO);
	
	void delete(Integer boardNO);
	
	void update(BoardVo vo);
	
	void updateViewCnt(Integer boardNo);
}
