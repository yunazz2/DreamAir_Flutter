import 'package:flight_booking/screen/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flight_booking/generated/l10n.dart' as lang;
import 'package:nb_utils/nb_utils.dart';
import 'package:pinput/pinput.dart';
import '../widgets/button_global.dart';
import '../widgets/constant.dart';

class OtpVerification extends StatefulWidget {
  const OtpVerification({Key? key}) : super(key: key);

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: Text(lang.S.of(context).otpTitle),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.0),
            topLeft: Radius.circular(30.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const SizedBox(height: 10.0),
              Text(
                lang.S.of(context).verification,
                style: TextStyle(
                  color: kTitleColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(height: 20.0),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: lang.S.of(context).otpDesc1,
                  style: TextStyle(color: kSubTitleColor),
                  children: [
                    TextSpan(
                      text: lang.S.of(context).otpDesc2,
                      style: TextStyle(
                        color: kTitleColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40.0),
              Pinput(
                focusedPinTheme: PinTheme(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: kPrimaryColor),
                  ),
                ),
                length: 6,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                defaultPinTheme: PinTheme(
                  height: 55,
                  width: 55,
                  textStyle: kTextStyle.copyWith(color: kTitleColor, fontSize: 18.0, fontWeight: FontWeight.bold),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: kBorderColorTextField,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Text(
                '00:55',
                style: TextStyle(color: kTitleColor, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: lang.S.of(context).otpResendTitle1,
                  style: TextStyle(color: kSubTitleColor),
                  children: [
                    TextSpan(
                      text: lang.S.of(context).otpResendTitle2,
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              ButtonGlobalWithoutIcon(
                buttontext: lang.S.of(context).verifyButton,
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
        ),
      ),
    );
  }
}
