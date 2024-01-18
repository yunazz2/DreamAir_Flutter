import 'package:flight_booking/screen/Authentication/login_screen.dart';
import 'package:flight_booking/screen/home/home.dart';
import 'package:flight_booking/screen/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../widgets/button_global.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool hidePassword = true;
  bool hidePasswordCheck = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: Text('회원가입', style: TextStyle(color: Colors.white),),
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
                  width: 78,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/logo2.png'),
                      fit: BoxFit.cover,
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
                    Text('회원 가입을 진행합니다.',
                      style: TextStyle(color: kTitleColor, fontSize: 18.0,),
                    ),

                    // 아이디
                    const SizedBox(height: 40.0),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      cursorColor: kTitleColor,
                      textInputAction: TextInputAction.next,
                      decoration: kInputDecoration.copyWith(
                        labelText: '아이디',
                        labelStyle: TextStyle(color: kTitleColor),
                        focusColor: kTitleColor,
                        border: const OutlineInputBorder(),
                      ),
                    ),

                    // 비밀번호
                    const SizedBox(height: 20.0),
                    TextFormField(
                      cursorColor: kTitleColor,
                      keyboardType: TextInputType.text, // TextInputType.emailAddress에서 TextInputType.text로 변경
                      obscureText: hidePassword,
                      decoration: kInputDecoration.copyWith(
                        border: const OutlineInputBorder(),
                        labelText: '비밀번호',
                        labelStyle: TextStyle(color: kTitleColor),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              hidePassword = !hidePassword;
                            });
                          },
                          icon: Icon(
                            hidePassword ? Icons.visibility_off : Icons.visibility,
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
                        labelStyle: TextStyle(color: kTitleColor),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              hidePasswordCheck = !hidePasswordCheck;
                            });
                          },
                          icon: Icon(
                            hidePasswordCheck ? Icons.visibility_off : Icons.visibility,
                            color: kSubTitleColor,
                          ),
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                    ),

                    // 아이디
                    const SizedBox(height: 20.0),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      cursorColor: kTitleColor,
                      textInputAction: TextInputAction.next,
                      decoration: kInputDecoration.copyWith(
                        labelText: '이름',
                        labelStyle: TextStyle(color: kTitleColor),
                        focusColor: kTitleColor,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    
                    // 핸드폰 번호
                    const SizedBox(height: 20.0),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      cursorColor: kTitleColor,
                      textInputAction: TextInputAction.next,
                      decoration: kInputDecoration.copyWith(
                        labelText: '핸드폰 번호',
                        labelStyle: TextStyle(color: kTitleColor),
                        focusColor: kTitleColor,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    
                    // 이메일
                    const SizedBox(height: 20.0),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: kTitleColor,
                      textInputAction: TextInputAction.next,
                      decoration: kInputDecoration.copyWith(
                        labelText: '이메일',
                        labelStyle: TextStyle(color: kTitleColor),
                        focusColor: kTitleColor,
                        border: const OutlineInputBorder(),
                      ),
                    ),

                    // 주소
                    const SizedBox(height: 20.0),
                    TextFormField(
                      keyboardType: TextInputType.streetAddress,
                      cursorColor: kTitleColor,
                      textInputAction: TextInputAction.join,
                      decoration: kInputDecoration.copyWith(
                        labelText: '주소',
                        labelStyle: TextStyle(color: kTitleColor),
                        focusColor: kTitleColor,
                        border: const OutlineInputBorder(),
                      ),
                    ),

                    // 회원 가입 버튼
                    const SizedBox(height: 20.0),
                    ButtonGlobalWithoutIcon(
                      buttontext: '회원 가입',
                      buttonDecoration: kButtonDecoration.copyWith(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      onPressed: () {
                        const Home().launch(context);
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
      bottomNavigationBar: SizedBox(height: 50,
        child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: GestureDetector(
            onTap: () => const LogIn().launch(context),
            child: Center(
              child: RichText(
                text: TextSpan(
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
