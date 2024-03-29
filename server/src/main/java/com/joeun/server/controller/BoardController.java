package com.joeun.server.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.joeun.server.dto.Board;
import com.joeun.server.dto.Files;
import com.joeun.server.dto.Page;
import com.joeun.server.service.BoardService;
import com.joeun.server.service.FileService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/board")
public class BoardController {
    
    @Autowired
    private BoardService boardService;

    @Autowired
    private FileService fileService;

    // 👩‍💻 CRUD 메소드 자동 생성 : sp-crud
    // 👩‍💻 자동 import : alt + shift + O      
    // 👩‍💻 한 줄 삭제 : ctrl + shift + K
    @GetMapping()
    public ResponseEntity<?> getAll() {
        log.info("[GET] - /board - 게시글 목록");
        try {
            List<Board> boardList = boardService.list();

            if(boardList == null) {
                log.info("조회된 게시글 없음");
            }
            else {
                log.info("게시글 수 : " + boardList.size());
            }

            return new ResponseEntity<>(boardList, HttpStatus.OK);
        } catch (Exception e) {
            log.error(null, e);
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    
    // 게시글 목록 with 페이징 처리
	// @GetMapping("/list")
	// public ResponseEntity<?> list(Model model, Page page) throws Exception {
    //     log.info("[GET] - /board/list " + page  + " - 게시글 목록");
    // try {
	// 	log.info("##### 페이징 처리 전 - page #####");
	// 	log.info(page.toString());
		
	// 	// 게시글 목록 요청
	// 	List<Board> boardList = boardService.list(page);
		
	// 	log.info("##### 페이징 처리 후 - page #####");
	// 	log.info(page.toString());
		
	// 	// 게시글 목록 모델에 등록
	// 	model.addAttribute("boardList", boardList);
	// 	model.addAttribute("page", page);
		
    //   return new ResponseEntity<>(boardList, HttpStatus.OK);  
    //      } catch (Exception e) {
    //             log.error(null, e);
    //             return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
    //         }
	// }

    @GetMapping("/{boardNo}")
    public ResponseEntity<?> getOne(@PathVariable Integer boardNo, Files files) {
        log.info("[GET] - /boards/" + boardNo  + " - 게시글 조회");
        try {
            Board board = boardService.select(boardNo);
            
            files.setParentTable("board");
            files.setParentNo(boardNo);
            List<Files> fileList = fileService.listByParent(files); // 파일 정보
            
            Map<String, Object> response = new HashMap<>();
            response.put("board", board);
            response.put("fileList", fileList);

            if( board == null ) {
                board = new Board();
                board.setTitle("데이터 없음");
                //     return new ResponseEntity<>(board, HttpStatus.OK); 
            }
            // else {
            //     return new ResponseEntity<>(board, HttpStatus.OK); 
            // }

            return new ResponseEntity<>(response, HttpStatus.OK); 

                
        } catch (Exception e) {
            log.error(null, e);
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    
    
   @PostMapping()
    // public ResponseEntity<?> create(@RequestBody Board board) {   // Content-Type : application/json
    public ResponseEntity<?> create(Board board) {                   // Content-Type : multipart/form-data
        log.info("[POST] - /board - 게시글 등록");

        log.info("board : " + board.toString());
        List<MultipartFile> files = board.getFiles();

        if( files != null )
            for (MultipartFile file : files) {
                log.info("file : " +  file.getOriginalFilename());
            }

        try {
            int result = boardService.insert(board);
            if( result > 0 )
                return new ResponseEntity<>("게시글 등록 완료", HttpStatus.CREATED);  // 201
            else
                return new ResponseEntity<>("게시글 등록 실패", HttpStatus.OK);  

        } catch (Exception e) {
            log.error(null, e);
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    
    @PutMapping()
    // public ResponseEntity<?> update(@RequestBody Board board) {      // Content-Type : application/json
    public ResponseEntity<?> update(Board board) {                      // Content-Type : multipart/form-data
        log.info("[PUT] - /board - 게시글 수정");
        try {
            int result = boardService.update(board);
            log.info("수정 : " + board);
            if( result > 0 )
                return new ResponseEntity<>("게시글 수정 완료", HttpStatus.OK); 
            else
                return new ResponseEntity<>("게시글 수정 실패", HttpStatus.OK);
        } catch (Exception e) {
            log.error(null, e);
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    
    @DeleteMapping("/{boardNo}")
    public ResponseEntity<?> destroy(@PathVariable Integer boardNo) {
        log.info("[DELETE] - /board/" + boardNo + " - 게시글 삭제");
        try {
            int result = boardService.remove(boardNo);
            if( result > 0 )
                return new ResponseEntity<>("게시글 삭제 완료", HttpStatus.OK); 
            else
                return new ResponseEntity<>("게시글 삭제 실패", HttpStatus.OK);
        } catch (Exception e) {
            log.error(null, e);
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

}
