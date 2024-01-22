package com.joeun.server.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.joeun.server.dto.Board;
import com.joeun.server.dto.Page;

public interface BoardService {

    // 게시글 목록
    public List<Board> list(Page page) throws Exception;

    // 게시글 이미지 목록
    public List<Board> mainList() throws Exception;
    
    // 게시글 조회
    public Board select(int boardNo) throws Exception;
    
    // 게시글 등록
    public int insert(Board board) throws Exception;
    
    // 게시글 수정
    public int update(Board board) throws Exception;
    
    // 게시글 삭제
    public int remove(int boardNo) throws Exception;

    // 조회수 조회
    public int searchViews(@Param("boardNo") int boardNo) throws Exception;

    // 조회수 업데이트
    public int updateViews(int count, int boardNo) throws Exception;

    // 좋아요 업데이트
    public int updateLikes(@Param("count") int count, @Param("boardNo") int boardNo) throws Exception;

    // 게시글 개수
	public int count() throws Exception;
}
 