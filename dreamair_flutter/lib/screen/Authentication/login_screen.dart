import 'dart:convert';

import 'package:flight_booking/screen/Authentication/sign_up_screen.dart';
import 'package:flight_booking/screen/provider/user_provider.dart';
import 'package:flight_booking/screen/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nb_utils/nb_utils.dart';

import '../home/home.dart';
import '../widgets/button_global.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool hidePassword = true;
  
  TextEditingController userIdController = TextEditingController();
  TextEditingController userPwController = TextEditingController();

  // 로그인 요청
  Future<void> login(
    String userId,
    String userPw,
  ) async {

    final url = 'http://54.180.125.242/login?username=$userId&password=$userPw';

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/josn',
        },
        body: jsonEncode({
          'userId': userId,
          'userPw': userPw,
        }),
      );

      if (response.statusCode == 200) {
        print('로그인 성공');
        UserProvider().updateLoginStatus(true);
        const Home().launch(context);
      } else {
        print('로그인 실패: ${response.statusCode}, ${response.body}');
      }
    } catch (e) {
      print('오류 발생: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: const Text(
          '로그인',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: kPrimaryColor,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10.0),
              Center(
                child: Container(
                  height: 70,
                  width: 120,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/white_logo_name.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Container(
                padding: const EdgeInsets.all(10.0),
                width: context.width(),
                height: context.height() / 1.2,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 10.0),
                    Text('로그인을 진행합니다.', style: TextStyle(color: kTitleColor, fontSize: 18.0,),),

                    // 아이디
                    const SizedBox(height: 40.0),
                    TextFormField(
                      controller: userIdController,
                      onChanged: ((value) {
                        userIdController.text = value;
                      }),
                      keyboardType: TextInputType.text,
                      cursorColor: kTitleColor,
                      textInputAction: TextInputAction.next,
                      decoration: kInputDecoration.copyWith(
                        labelText: '아이디',
                        labelStyle: const TextStyle(color: kTitleColor),
                        focusColor: kTitleColor,
                        border: const OutlineInputBorder(),
                      ),
                    ),

                    // 비밀번호
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: userPwController,
                      onChanged: (value) {
                        userPwController.text = value;
                      },
                      cursorColor: kTitleColor,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: hidePassword,
                      textInputAction: TextInputAction.done,
                      decoration: kInputDecoration.copyWith(
                        border: const OutlineInputBorder(),
                        labelText: '비밀번호',
                        labelStyle: const TextStyle(color: kTitleColor),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              hidePassword = !hidePassword;
                            });
                          },
                          icon: Icon(
                            hidePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: kSubTitleColor,
                          ),
                        ),
                      ),
                    ),

                    // 로그인 버튼
                    const SizedBox(height: 20.0),
                    ButtonGlobalWithoutIcon(
                      buttontext: '로그인',
                      buttonDecoration: kButtonDecoration.copyWith(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      onPressed: () {
                        login(userIdController.text, userPwController.text);
                      },
                      buttonTextColor: kWhite,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 50,
        child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: GestureDetector(
            onTap: () => const SignUp().launch(context),
            child: Center(
              child: RichText(
                text: const TextSpan(
                  text: '아직 계정이 없으신가요? ',
                  style: TextStyle(color: kSubTitleColor),
                  children: [
                    TextSpan(
                      text: '회원 가입',
                      style: TextStyle(
                          color: kPrimaryColor, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
