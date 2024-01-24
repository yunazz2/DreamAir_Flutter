package com.joeun.server.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.joeun.server.service.BoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/likes")
public class LikesController {
    
    @Autowired
    private BoardService boardService;

     /**
     * 좋아요 상태 변경
     * [PUT]
     * /likes
     * model : ❌
     * @param boardNo
     * @return
     * @throws Exception
     */
    @ResponseBody
    @PutMapping("/{boardNo}/{count}")
    public ResponseEntity<?> updateLikePro(@PathVariable Integer count, @PathVariable Integer boardNo) throws Exception {
        try{
        log.info("[PUT] - /board/likes");
        log.info("boardNo : " + boardNo);
        log.info("count : " + count);
        
        int result = boardService.updateLikes(count, boardNo);

        // if(count==0){
        //     count=1;
        //     result = boardService.updateViews(count, boardNo);
        // } else{
        //     count=0;
        //     result = boardService.updateViews(count, boardNo);
        // }
     
        log.info("###boardNo : " + boardNo);
        log.info("###count : " + count);
        
        if( result > 0 )
                return new ResponseEntity<>("좋아요 업데이트 완료", HttpStatus.CREATED);  // 201
            else
                return new ResponseEntity<>("좋아요 업데이트 실패", HttpStatus.OK);  

        } catch (Exception e) {
            log.error(null, e);
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

}