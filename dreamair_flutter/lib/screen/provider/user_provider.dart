import 'dart:convert';

import 'package:flight_booking/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;


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
  bool _loginStatus = false; // 클래스의 모든 인스턴스가 공유 가능
  // 로그인 상태 가져오기
  bool get isLogin => _loginStatus;

  // 로그인 아이디
  String _userId = '';
  String get userId => _userId;

  // 현재 사용자 정보를 담은 객체
  User get currentUser => _user;

  // 🔒 안전한 저장소
  final storage = const FlutterSecureStorage();


  /// 🔐 로그인 요청
  /// 1. 요청 및 응답
  /// ➡ username, password 
  /// ⬅ jwt token
  /// 
  /// 2. jwt 토큰을 SecureStorage 에 저장
  Future<void> login(String username, String password) async {
    const url = 'http://10.0.2.2:8080/login';           // TODO: 로그인 경로 수정
    final requestUrl = Uri.parse('$url?username=$username&password=$password');
    try {
      // 로그인 요청
      final response = await http.get(requestUrl);

      if (response.statusCode == 200) {
        print('로그인 성공...');

        // HTTP 요청이 성공했을 때
        final authorizationHeader = response.headers['authorization'];

        if (authorizationHeader != null) {
          // Authorization 헤더에서 "Bearer "를 제거하고 JWT 토큰 값을 추출
          final jwtToken = authorizationHeader.replaceFirst('Bearer ', '');

          // 여기서 jwtToken을 사용하면 됩니다.
          print('JWT Token: $jwtToken');

          // jwt 저장
          await storage.write(key: 'jwtToken', value: jwtToken);
          _loginStatus = true;

        } else {
          // Authorization 헤더가 없는 경우 처리
          print('Authorization 헤더가 없습니다.');
        }
      } else if( response.statusCode == 403 ) {
        print('아이디 또는 비밀번호가 일치하지 않습니다...');

      } else {
        print('네트워크 오류 또는 알 수 없는 오류로 로그인에 실패하였습니다...');

      }

    } catch (error) {
      print("로그인 실패 $error");
    }
    // 공유된 상태를 가진 위젯 다시 빌드
    notifyListeners();   
  }


  
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
      // 저장된 jwt 가져오기
      String? token = await storage.read(key: 'jwtToken');
      print('사용자 정보 요청 전: jwt - $token');

      final response = await http.get(
                                    Uri.parse(url),
                                    headers: {
                                        'Authorization': 'Bearer $token',
                                        'Content-Type': 'application/json',
                                      },
                              );

      if (response.statusCode == 200) {
        // 성공적으로 데이터를 받아왔을 때의 처리
        var utf8Decoded = utf8.decode( response.bodyBytes );
        var result = json.decode(utf8Decoded);
        final userInfo = result;
        print('User Info: $userInfo');

        // 프로바이더에 user 정보 등록
        // class ⬅ json
        _user = User.fromJson(result);
        print(_user);

      } else {
        // HTTP 요청이 실패했을 때의 처리
        print('HTTP 요청 실패: ${response.statusCode}');
        
        print('사용자 정보 요청 성공');
      } 
    }catch (error) {
      print('사용자 정보 요청 실패 $error');
    }
   
  }

}