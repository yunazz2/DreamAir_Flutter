import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kPrimaryColor = Color.fromARGB(255, 85, 170, 255); // 메인 색상
const kSubSubTitleColor=Color.fromARGB(255, 255, 153, 175); // 서브 색상
const kTitleColor = Color(0xFF030508);
const kSecondaryColor = Color(0xFFEDF0FF);
const kSubTitleColor = Color.fromARGB(255, 170, 170, 170);
const kLightNeutralColor = Color(0xFF96BCFF);
const kDarkWhite = Color(0xFFF9F9F9);
const kWhite = Color(0xFFFFFFFF);
const kBorderColorTextField = Color(0xFFE3E7EA);
const ratingBarColor = Color.fromARGB(255, 0, 175, 255);

final kTextStyle = GoogleFonts.inter(
  color: kTitleColor,
);

const kButtonDecoration = BoxDecoration(
  color: kPrimaryColor,
  borderRadius: BorderRadius.all(
    Radius.circular(40.0),
  ),
);

InputDecoration kInputDecoration = const InputDecoration(
  hintStyle: TextStyle(color: kSubTitleColor),
  labelStyle: TextStyle(color: kTitleColor),
  filled: true,
  fillColor: Colors.white70,
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(8.0),
    ),
    borderSide: BorderSide(color: kBorderColorTextField, width: 2),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(6.0),
    ),
    borderSide: BorderSide(color: kBorderColorTextField, width: 2),
  ),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: const BorderSide(
      color: kBorderColorTextField,
    ),
  );
}

final otpInputDecoration = InputDecoration(
  contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

const String currencySign = '\$';

bool isReturn = false;
int selectedIndex = 0;

List<String> titleList = [
  'Saver',
  'Flexi Plus',
  'Super 6E',
];
String gValue = 'Saver';


