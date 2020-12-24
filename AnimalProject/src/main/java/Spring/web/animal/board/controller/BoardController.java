package Spring.web.animal.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import Spring.web.animal.board.model.BoardVo;
import Spring.web.animal.board.service.IBoardService;
import Spring.web.animal.commons.PageCreator.PageCreator;

@RestController
@RequestMapping("/board")
public class BoardController {

	
	@Autowired
	private IBoardService service;
	
	@GetMapping("/list")
	public ModelAndView list1(SearchVO se) {
		ModelAndView mav = new ModelAndView();
		PageCreator pc = new PageCreator();
		pc.setPaging(se);
		List<BoardVo> svo = service.getArticleList(se);
		pc.setArticleTotalCount(service.countArticles(se));
		
		
		mav.addObject("list",svo);
		mav.addObject("page",pc);
		mav.setViewName("board/list");

		return mav;
		
	}
	
	
	@GetMapping("/share")
	public ModelAndView share1() {
		
		return new ModelAndView("board/share");
		
	}
	
	
	
	@PostMapping("/share")
	public String share2(@RequestBody BoardVo vo) {
		service.share(vo);
		
		return "ss";
		
	}
	
	
	@GetMapping("/content")
	public ModelAndView content(SearchVO vo, Integer boardNo) {
		ModelAndView mv  = new ModelAndView();
		BoardVo get =  service.getcontent(boardNo);
		System.out.println();
		mv.addObject("get",get);
		mv.addObject("SearchVO",vo);
		mv.setViewName("board/content");
		
		return mv;
	}
	
	@GetMapping("/modify")
	public ModelAndView modify(SearchVO vo,Integer boardNo) {
		ModelAndView mv  = new ModelAndView();
		BoardVo get =  service.getcontent(boardNo);
		mv.addObject("get",get);
		mv.addObject("SearchVO",vo);
		mv.setViewName("board/modify");
		
		
		return mv;
		
	}
	@PostMapping("/modify")
	public ModelAndView modify(BoardVo vo) {
		ModelAndView mv  = new ModelAndView();
		service.update(vo);
		mv.setViewName("redirect:/board/list");
		return mv;
		
	}
	
	
	
	
	
	
	
	
	@GetMapping("/delete")
	public ModelAndView delete(Integer boardNO) {
		
		ModelAndView mv  = new ModelAndView();
		
		service.delete(boardNO);
		
		mv.setViewName("redirect:/board/list");
		return mv;// 왜안됨 ;;?
	}
	
	
	
	
	
	
	
}
