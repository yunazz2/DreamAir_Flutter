import 'package:flight_booking/screen/Authentication/otp_verication.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../widgets/button_global.dart';
import '../widgets/constant.dart';
import 'package:flight_booking/generated/l10n.dart' as lang;

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: Text(lang.S.of(context).fpAppBarTitle),
      ),
      body: Container(
        height: context.height(),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.0),
            topLeft: Radius.circular(30.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(height: 10.0),
                Text(
                  lang.S.of(context).fpAppBarTitle,
                  style: TextStyle(
                    color: kTitleColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                const SizedBox(height: 20.0),
                Text(
                  lang.S.of(context).fpDesc1,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: kSubTitleColor),
                ),
                const SizedBox(height: 30.0),
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
                const SizedBox(height: 30.0),
                ButtonGlobalWithoutIcon(
                  buttontext: lang.S.of(context).SendOtpTitle,
                  buttonDecoration: kButtonDecoration.copyWith(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  onPressed: () {
                    const OtpVerification().launch(context);
                  },
                  buttonTextColor: kWhite,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
