package com.myweb.ctrl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myweb.domain.PageMakerDTO;
import com.myweb.domain.PageVO;
import com.myweb.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	private static final Logger log = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	private BoardService boardService;
	
//	/* 게시판 목록 페이지 이동 (페이징 X) */
//	@GetMapping("/list")
//	// => @RequestMapping(value="list", method=RequestMethod.GET)
//	public void boardListPage(Model model) {
//
//		log.info("게시판 목록 페이지(페이징 X)");
//		
//		model.addAttribute("list", boardService.getList());
//
//	}
	
    /* 게시판 목록 페이지 접속(페이징 O) */
    @GetMapping("/list")
    public void boardListPage(Model model, PageVO page) {
        
        log.info("게시판 목록 페이지(페이징 O)");
        
        model.addAttribute("list", boardService.getListPaging(page));
        
        int total = boardService.totalCount();
        PageMakerDTO pageMaker = new PageMakerDTO(page, total);
        model.addAttribute("pageMaker", pageMaker);
    }
}
