class UserProvider {
  late String userId;
  late String userPw;
  late String userPwCheck;
  late String name;
  late String phone;
  late String email;
  late String address;

  bool _loginStatus = false;

  // 로그인 상태 가져오기
  bool getLoginStatus() => _loginStatus;

  bool get isLogin => _loginStatus;

  // 로그인 상태 업데이트
  void updateLoginStatus(bool status) {
    print('_loginStatus 확인쓰~ : $status');
    _loginStatus = status;
  }
}
