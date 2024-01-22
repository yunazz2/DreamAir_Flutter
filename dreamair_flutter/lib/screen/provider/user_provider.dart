import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {

  // late String userId;
  late String userPw;
  late String userPwCheck;
  late String name;
  late String phone;
  late String email;
  late String address;

  // 로그인 상태
  static bool _loginStatus = false; // 클래스의 모든 인스턴스가 공유 가능
  // 로그인 상태 가져오기
  static bool get isLogin => _loginStatus;

  // 로그인 아이디
  static String _userId = '';
  static String get userId => _userId;

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

}