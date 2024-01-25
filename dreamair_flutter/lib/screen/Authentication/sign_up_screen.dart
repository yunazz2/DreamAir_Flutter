import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flight_booking/screen/Authentication/login_screen.dart';
import 'package:flight_booking/screen/home/home.dart';
import 'package:flight_booking/screen/widgets/constant.dart';
import 'package:nb_utils/nb_utils.dart';

import '../widgets/button_global.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool hidePassword = true;
  bool hidePasswordCheck = true;

  TextEditingController userIdController = TextEditingController();
  TextEditingController userPwController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  // 회원 가입 요청
  Future<void> signUp(
    String userId,
    String userPw,
    String name,
    String phone,
    String email,
    String address,
    ) async {

      final url = 'http://54.180.125.242/user';

      try {
        final response = await http.post(
          Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode({
            'userId': userId,
            'userPw': userPw,
            'name': name,
            'phone': phone,
            'email': email,
            'address': address,
          }),
        );

        if (response.statusCode == 200) {
          print('회원 가입 성공');
          const Home().launch(context);
        } else {
          print('회원 가입 실패: ${response.statusCode}, ${response.body}');
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
          '회원가입',
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
                height: context.height(),
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
                    Text('회원 가입을 진행합니다.', style: TextStyle(color: kTitleColor, fontSize: 18.0,),),

                    // 아이디
                    const SizedBox(height: 40.0),
                    TextFormField(
                      controller: userIdController,
                      onChanged: (value) {
                        userIdController.text = value;
                      },
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
                      keyboardType: TextInputType.text,
                      obscureText: hidePassword,
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
                      textInputAction: TextInputAction.next,
                    ),

                    // 비밀번호 확인
                    const SizedBox(height: 20.0),
                    TextFormField(
                      cursorColor: kTitleColor,
                      keyboardType: TextInputType.text,
                      obscureText: hidePasswordCheck,
                      decoration: kInputDecoration.copyWith(
                        border: const OutlineInputBorder(),
                        labelText: '비밀번호 확인',
                        labelStyle: const TextStyle(color: kTitleColor),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              hidePasswordCheck = !hidePasswordCheck;
                            });
                          },
                          icon: Icon(
                            hidePasswordCheck
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: kSubTitleColor,
                          ),
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                    ),

                    // 이름
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: nameController,
                      onChanged: ((value) {
                        nameController.text = value;
                      }),
                      keyboardType: TextInputType.text,
                      cursorColor: kTitleColor,
                      textInputAction: TextInputAction.next,
                      decoration: kInputDecoration.copyWith(
                        labelText: '이름',
                        labelStyle: const TextStyle(color: kTitleColor),
                        focusColor: kTitleColor,
                        border: const OutlineInputBorder(),
                      ),
                    ),

                    // 핸드폰 번호
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: phoneController,
                      onChanged: (value) {
                        phoneController.text = value;
                      },
                      keyboardType: TextInputType.phone,
                      cursorColor: kTitleColor,
                      textInputAction: TextInputAction.next,
                      decoration: kInputDecoration.copyWith(
                        labelText: '핸드폰 번호',
                        labelStyle: const TextStyle(color: kTitleColor),
                        focusColor: kTitleColor,
                        border: const OutlineInputBorder(),
                      ),
                    ),

                    // 이메일
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: emailController,
                      onChanged: (value) {
                        emailController.text = value;
                      },
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: kTitleColor,
                      textInputAction: TextInputAction.next,
                      decoration: kInputDecoration.copyWith(
                        labelText: '이메일',
                        labelStyle: const TextStyle(color: kTitleColor),
                        focusColor: kTitleColor,
                        border: const OutlineInputBorder(),
                      ),
                    ),

                    // 주소
                    const SizedBox(height: 20.0),
                    TextFormField(
                      controller: addressController,
                      onChanged: (value) {
                        addressController.text = value;
                      },
                      keyboardType: TextInputType.text,
                      cursorColor: kTitleColor,
                      textInputAction: TextInputAction.done,
                      decoration: kInputDecoration.copyWith(
                        labelText: '주소',
                        labelStyle: const TextStyle(color: kTitleColor),
                        focusColor: kTitleColor,
                        border: const OutlineInputBorder(),
                      ),
                    ),

                    const SizedBox(height: 20.0),
                    ButtonGlobalWithoutIcon(
                      buttontext: '회원 가입',
                      buttonDecoration: kButtonDecoration.copyWith(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      onPressed: () {
                        signUp(
                          userIdController.text,
                          userPwController.text,
                          nameController.text,
                          phoneController.text,
                          emailController.text,
                          addressController.text,
                        );
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
            onTap: () => const LogIn().launch(context),
            child: Center(
              child: RichText(
                text: const TextSpan(
                  text: '이미 계정이 있으신가요? ',
                  style: TextStyle(color: kSubTitleColor),
                  children: [
                    TextSpan(
                      text: '로그인',
                      style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
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
