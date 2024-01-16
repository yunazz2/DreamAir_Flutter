import 'package:country_code_picker/country_code_picker.dart';
import 'package:flight_booking/screen/Authentication/login_screen.dart';
import 'package:flight_booking/screen/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:flight_booking/generated/l10n.dart' as lang;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nb_utils/nb_utils.dart';

import '../widgets/button_global.dart';
import '../widgets/icon.dart';
import 'otp_verication.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: Text(lang.S.of(context).signUpButton),
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
                height: context.height() / 1.1,
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
                    Text(
                      lang.S.of(context).loginTitle,
                      style: kTextStyle.copyWith(
                        color: kTitleColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    const SizedBox(height: 40.0),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      cursorColor: kTitleColor,
                      textInputAction: TextInputAction.next,
                      decoration: kInputDecoration.copyWith(
                        labelText: lang.S.of(context).nameLabel,
                        labelStyle: kTextStyle.copyWith(color: kTitleColor),
                        hintText: lang.S.of(context).nameHint,
                        hintStyle: kTextStyle.copyWith(color: kSubTitleColor),
                        focusColor: kTitleColor,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: kTitleColor,
                      textInputAction: TextInputAction.next,
                      decoration: kInputDecoration.copyWith(
                        labelText: lang.S.of(context).emailLabel,
                        labelStyle: kTextStyle.copyWith(color: kTitleColor),
                        hintText: lang.S.of(context).emailHint,
                        hintStyle: kTextStyle.copyWith(color: kSubTitleColor),
                        focusColor: kTitleColor,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      cursorColor: kTitleColor,
                      textInputAction: TextInputAction.next,
                      decoration: kInputDecoration.copyWith(
                        hintText: lang.S.of(context).phoneHint,
                        hintStyle: kTextStyle.copyWith(color: kSubTitleColor),
                        focusColor: kTitleColor,
                        border: const OutlineInputBorder(),
                        prefixIcon: CountryCodePicker(
                          padding: EdgeInsets.zero,
                          onChanged: print,
                          initialSelection: 'BD',
                          showFlag: true,
                          showDropDownButton: true,
                          alignLeft: false,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      cursorColor: kTitleColor,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: hidePassword,
                      textInputAction: TextInputAction.done,
                      decoration: kInputDecoration.copyWith(
                        border: const OutlineInputBorder(),
                        labelText: lang.S.of(context).passwordLabel,
                        labelStyle: kTextStyle.copyWith(color: kTitleColor),
                        hintText: lang.S.of(context).passwordHint,
                        hintStyle: kTextStyle.copyWith(color: kSubTitleColor),
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
                    ),
                    const SizedBox(height: 20.0),
                    ButtonGlobalWithoutIcon(
                      buttontext: lang.S.of(context).signUpButton,
                      buttonDecoration: kButtonDecoration.copyWith(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      onPressed: () {
                        const OtpVerification().launch(context);
                      },
                      buttonTextColor: kWhite,
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      children: [
                        const Expanded(
                          child: Divider(
                            thickness: 1.0,
                            color: kBorderColorTextField,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Text(
                            lang.S.of(context).orSignUpTitle,
                            style: kTextStyle.copyWith(color: kSubTitleColor),
                          ),
                        ),
                        const Expanded(
                          child: Divider(
                            thickness: 1.0,
                            color: kBorderColorTextField,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          SocialIcon(
                            bgColor: kTitleColor,
                            iconColor: kWhite,
                            icon: FontAwesomeIcons.facebookF,
                            borderColor: Colors.transparent,
                          ),
                          SizedBox(width: 20.0),
                          SocialIcon(
                            bgColor: kWhite,
                            iconColor: kTitleColor,
                            icon: FontAwesomeIcons.google,
                            borderColor: kBorderColorTextField,
                          ),
                        ],
                      ),
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
          decoration: const BoxDecoration(color: kWhite),
          child: GestureDetector(
            onTap: () => const LogIn().launch(context),
            child: Center(
              child: RichText(
                text: TextSpan(
                  text: lang.S.of(context).alreadyHaveAcc,
                  style: kTextStyle.copyWith(color: kSubTitleColor),
                  children: [
                    TextSpan(
                      text: lang.S.of(context).loginButton,
                      style: kTextStyle.copyWith(color: kPrimaryColor, fontWeight: FontWeight.bold),
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
