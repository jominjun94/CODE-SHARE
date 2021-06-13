package Spring.web.animal.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Spring.web.animal.board.controller.SearchVO;
import Spring.web.animal.board.model.BoardVo;
import Spring.web.animal.board.repository.IBoardMapper;


@Service
public class BoardService implements IBoardService {

	@Autowired
	private IBoardMapper mapper;

	@Override
	public void share(BoardVo vo) {
		mapper.share(vo);
		
	}

	@Override
	public List<BoardVo> getArticleList(SearchVO se) {
		// TODO Auto-generated method stub
		return mapper.getArticleList(se);
	}

	@Override
	public Integer countArticles(SearchVO se) {
		// TODO Auto-generated method stub
		return mapper.countArticles(se);
	}

	@Override
	public BoardVo getcontent(Integer boardNO) {
		mapper.updateViewCnt(boardNO);
		return mapper.getcontent(boardNO);
	}

	@Override
	public void delete(Integer boardNO) {
		mapper.delete(boardNO);
		
	}

	@Override
	public void update(BoardVo vo) {
	mapper.update(vo);
		
	}
	
	
	
}
