import 'package:flight_booking/screen/Authentication/sign_up_screen.dart';
import 'package:flight_booking/screen/widgets/button_global.dart';
import 'package:flight_booking/screen/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flight_booking/generated/l10n.dart' as lang;

import '../home/home.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

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
                      child: Text(
                        lang.S.of(context).skipButton,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Center(
                child: Container(
                  height: 142,
                  width: 160,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/logo2.png'),
                      fit: BoxFit.cover,
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
                      Text(
                        lang.S.of(context).wcTitle,
                        style: TextStyle(color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        lang.S.of(context).wcSubTitle,
                        style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 18.0),
                      ),
                      const SizedBox(height: 20.0),
                      Text(
                        lang.S.of(context).wcDescription,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: kSubTitleColor),
                      ),
                      const SizedBox(height: 50.0),
                      ButtonGlobalWithoutIcon(
                        buttontext: lang.S.of(context).createAccButton,
                        buttonDecoration: kButtonDecoration.copyWith(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        onPressed: () {
                          const SignUp().launch(context);
                        },
                        buttonTextColor: kWhite,
                      ),
                      ButtonGlobalWithoutIcon(
                        buttontext: lang.S.of(context).loginButton,
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
