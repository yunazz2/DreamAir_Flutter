import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class User {
  late int userNo;
  late String userId;
  late String userPw;
  late String userPwCheck;
  late String name;
  late String phone;
  late String email;
  late String address;
  late double mileage;

  User({
    required this.userNo,
    required this.userId,
    required this.userPw,
    required this.userPwCheck,
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
    required this.mileage,
  });
}

class UserProvider extends ChangeNotifier {

  late User _user = User(
    userNo: 0,
    userId: '',
    userPw: '',
    userPwCheck: '',
    name: '',
    phone: '',
    email: '',
    address: '',
    mileage: 0.0,
  );

  // 로그인 상태
  static bool _loginStatus = false; // 클래스의 모든 인스턴스가 공유 가능
  // 로그인 상태 가져오기
  static bool get isLogin => _loginStatus;

  // 로그인 아이디
  static String _userId = '';
  static String get userId => _userId;

  // 현재 사용자 정보를 담은 객체
  User get currentUser => _user;


  
  // 로그인 한 사용자 아이디
  void updateLoginId(String userId) {
    print('로그인 된 아이디 : $userId');
    _userId = userId;

    notifyListeners();
  }

  // 로그인 상태 업데이트
  void updateLoginStatus(bool isLogin) {
    print('로그인 상태 확인 : $isLogin');
    _loginStatus = isLogin;

    notifyListeners();
  }

  // 로그아웃 처리
  void logout() {
    _loginStatus = false;
    _userId = '';
    print('로그아웃 되었습니다.');

    notifyListeners();
  }

  // 회원 정보 요청
  Future getUserInfo() async {
    print('UserProvider 회원 정보 요청 시작');

    print(userId);

    final url = 'http://10.0.2.2:9090/user/$userId';

    try {
      final response = await http.get(Uri.parse(url));
      if(response.statusCode == 200) {
        print('UserProvider 회원 정보 요청 응답 성공');
        
        var utf8Decoded = utf8.decode(response.bodyBytes);
        var result = json.decode(utf8Decoded);

        print(result);

        _user = User(
          userNo: result['userNo'] ?? 0,
          userId: result['userId'] ?? '',
          userPw: result['userPw'] ?? '',
          userPwCheck: result['userPwCheck'] ?? '',
          name: result['name'] ?? '',
          phone: result['phone'] ?? '',
          email: result['email'] ?? '',
          address: result['address'] ?? '',
          mileage: result['mileage'],
        );

        notifyListeners();
      }
    } catch (e) {
      print('오류 발생: $e');
    }
  }

}