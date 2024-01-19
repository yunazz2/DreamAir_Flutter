import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {

  late String userId;
  late String userPw;
  late String userPwCheck;
  late String name;
  late String phone;
  late String email;
  late String address;

  static bool _loginStatus = false;

  // 전역 변수
  static bool get isLogin => _loginStatus;
  static bool getLoginStatus() => _loginStatus; // 로그인 상태 가져오기

  // 로그인 상태 업데이트
  void updateLoginStatus(bool status) {
    print('로그인 상태 확인 : $status');
    _loginStatus = status;

    notifyListeners();
  }

  // 로그아웃 처리
  void logout() {
    _loginStatus = false;
    print('로그아웃 되었습니다.');

    notifyListeners();
  }

}