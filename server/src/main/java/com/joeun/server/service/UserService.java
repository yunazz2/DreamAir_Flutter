package com.joeun.server.service;

import java.util.List;
import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import com.joeun.server.dto.Product;
import com.joeun.server.dto.Users;

public interface UserService {

    // 회원 등록
    public int insert(Users user) throws Exception;

    // 회원 조회
    public Users select(int userNo) throws Exception;

    // 회원 조회 - id
    public Users selectById(String userId) throws Exception;

    // 회원 조회 - id
    public Users selectById2(Principal principal, HttpServletRequest request) throws Exception;

    // 로그인
    public void login(Users user, HttpServletRequest requset) throws Exception;

    // 회원 수정
    public int update(Users user) throws Exception;

    // 회원 삭제
    public int deleteUsers(String userId);

    // 회원 마일리지 조회
    public Users selectMileage(String userId) throws Exception;

    // 장바구니 조회 : 회원
    public List<Users> user_cart_list(int userNo) throws Exception;
    
    // 장바구니 조회 : 비회원
    public List<Users> user2_cart_list(int phone, int userPw) throws Exception;

    // 장바구니 추가
    public int cartadd(Users user) throws Exception;
    
    // 장바구니 삭제
    public int cart_delete(int userNo) throws Exception;

    // 전체 탑승권 조회
    public List<Product> product_flightList() throws Exception;

    // 회원 삭제 시, auth 테이블 삭제
    public Users deleteAuth(String username);

    // 회원 삭제 시, mileage 테이블 삭제
    public int deleteMileage(String username);
}
