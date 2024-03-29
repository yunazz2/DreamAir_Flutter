import 'package:flight_booking/screen/Authentication/sign_up_screen.dart';
import 'package:flight_booking/screen/provider/user_provider.dart';
import 'package:flight_booking/screen/widgets/button_global.dart';
import 'package:flight_booking/screen/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../home/home.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: GestureDetector(
                      onTap: () {
                        const Home().launch(context);
                      },
                      child: const Text('건너뛰기', style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Center(
                child: Container(
                  height: 142,
                  width: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/white_logo_name.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40.0),
              Container(
                width: context.width(),
                height: context.height(),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 5.0,
                        width: 60.0,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.0), color: kBorderColorTextField),
                      ),
                      const SizedBox(height: 20.0),
                      Text('항공권 예매',
                        style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                      const SizedBox(height: 10.0),
                      Text('Dream Air와 함께 하세요!',
                        style: TextStyle(color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                      const SizedBox(height: 30.0),
                      Text('Dream Air와 함께 즐거운 여행을 떠나보세요!',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: kSubTitleColor),
                      ),
                      const SizedBox(height: 30.0),

                      // 로그인 버튼
                        ButtonGlobalWithoutIcon(
                          buttontext: '로그인',
                          buttonDecoration: kButtonDecoration.copyWith(
                            color: Colors.white,
                            border: Border.all(color: kPrimaryColor),
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          onPressed: () {
                            const LogIn().launch(context);
                          },
                          buttonTextColor: kPrimaryColor,
                        ),

                      // 회원 가입 버튼
                      ButtonGlobalWithoutIcon(
                        buttontext: '회원 가입',
                        buttonDecoration: kButtonDecoration.copyWith(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        onPressed: () {
                          const SignUp().launch(context);
                        },
                        buttonTextColor: kWhite,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}