// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Flight Booking`
  String get appTitle {
    return Intl.message(
      'Flight Booking',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skipButton {
    return Intl.message(
      'Skip',
      name: 'skipButton',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Maan Flight`
  String get onBoardTitle1 {
    return Intl.message(
      'Welcome to Maan Flight',
      name: 'onBoardTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Easily Find Any Place`
  String get onBoardTitle2 {
    return Intl.message(
      'Easily Find Any Place',
      name: 'onBoardTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Get The Full Experience`
  String get onBoardTitle3 {
    return Intl.message(
      'Get The Full Experience',
      name: 'onBoardTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Pretium, ipsum pretium aliquet mollis cond imentum magna accumsan. Odio elit \ntellus id diam sit. Massa`
  String get onBoardSubTitle1 {
    return Intl.message(
      'Pretium, ipsum pretium aliquet mollis cond imentum magna accumsan. Odio elit \ntellus id diam sit. Massa',
      name: 'onBoardSubTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Pretium, ipsum pretium aliquet mollis cond imentum magna accumsan. Odio elit \ntellus id diam sit. Massa`
  String get onBoardSubTitle2 {
    return Intl.message(
      'Pretium, ipsum pretium aliquet mollis cond imentum magna accumsan. Odio elit \ntellus id diam sit. Massa',
      name: 'onBoardSubTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Pretium, ipsum pretium aliquet mollis cond imentum magna accumsan. Odio elit \ntellus id diam sit. Massa`
  String get onBoardSubTitle3 {
    return Intl.message(
      'Pretium, ipsum pretium aliquet mollis cond imentum magna accumsan. Odio elit \ntellus id diam sit. Massa',
      name: 'onBoardSubTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Start Your Journey with`
  String get wcTitle {
    return Intl.message(
      'Start Your Journey with',
      name: 'wcTitle',
      desc: '',
      args: [],
    );
  }

  /// `Flight Booking`
  String get wcSubTitle {
    return Intl.message(
      'Flight Booking',
      name: 'wcSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Pretium, ipsum pretium aliquet mollis cond imentum magna accumsan. Odio elit \ntellus id diam sit. Massa`
  String get wcDescription {
    return Intl.message(
      'Pretium, ipsum pretium aliquet mollis cond imentum magna accumsan. Odio elit \ntellus id diam sit. Massa',
      name: 'wcDescription',
      desc: '',
      args: [],
    );
  }

  /// `Create An Account`
  String get createAccButton {
    return Intl.message(
      'Create An Account',
      name: 'createAccButton',
      desc: '',
      args: [],
    );
  }

  /// `Log In`
  String get loginButton {
    return Intl.message(
      'Log In',
      name: 'loginButton',
      desc: '',
      args: [],
    );
  }

  /// `Log In Your Account`
  String get loginTitle {
    return Intl.message(
      'Log In Your Account',
      name: 'loginTitle',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get emailLabel {
    return Intl.message(
      'Email',
      name: 'emailLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get emailHint {
    return Intl.message(
      'Enter your email',
      name: 'emailHint',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get passwordLabel {
    return Intl.message(
      'Password',
      name: 'passwordLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get passwordHint {
    return Intl.message(
      'Enter your password',
      name: 'passwordHint',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Or Sign up with`
  String get orSignUpTitle {
    return Intl.message(
      'Or Sign up with',
      name: 'orSignUpTitle',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account? `
  String get alreadyHaveAcc {
    return Intl.message(
      'Already have an account? ',
      name: 'alreadyHaveAcc',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUpButton {
    return Intl.message(
      'Sign Up',
      name: 'signUpButton',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get nameLabel {
    return Intl.message(
      'Full Name',
      name: 'nameLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter your full name`
  String get nameHint {
    return Intl.message(
      'Enter your full name',
      name: 'nameHint',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get phoneLabel {
    return Intl.message(
      'Phone',
      name: 'phoneLabel',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone number`
  String get phoneHint {
    return Intl.message(
      'Enter your phone number',
      name: 'phoneHint',
      desc: '',
      args: [],
    );
  }

  /// `Don’t have an account? `
  String get noAccTitle1 {
    return Intl.message(
      'Don’t have an account? ',
      name: 'noAccTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Create New Account`
  String get noAccTitle2 {
    return Intl.message(
      'Create New Account',
      name: 'noAccTitle2',
      desc: '',
      args: [],
    );
  }

  /// `OTP`
  String get otpTitle {
    return Intl.message(
      'OTP',
      name: 'otpTitle',
      desc: '',
      args: [],
    );
  }

  /// `Verification`
  String get verification {
    return Intl.message(
      'Verification',
      name: 'verification',
      desc: '',
      args: [],
    );
  }

  /// `6-digits pin has been sent to your email address, `
  String get otpDesc1 {
    return Intl.message(
      '6-digits pin has been sent to your email address, ',
      name: 'otpDesc1',
      desc: '',
      args: [],
    );
  }

  /// `riead2562@gmail.com`
  String get otpDesc2 {
    return Intl.message(
      'riead2562@gmail.com',
      name: 'otpDesc2',
      desc: '',
      args: [],
    );
  }

  /// `Didn’t receive code? `
  String get otpResendTitle1 {
    return Intl.message(
      'Didn’t receive code? ',
      name: 'otpResendTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Resend Code`
  String get otpResendTitle2 {
    return Intl.message(
      'Resend Code',
      name: 'otpResendTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verifyButton {
    return Intl.message(
      'Verify',
      name: 'verifyButton',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password`
  String get fpAppBarTitle {
    return Intl.message(
      'Forgot Password',
      name: 'fpAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your phone number below to receive your OTP number.`
  String get fpDesc1 {
    return Intl.message(
      'Please enter your phone number below to receive your OTP number.',
      name: 'fpDesc1',
      desc: '',
      args: [],
    );
  }

  /// `Send OTP`
  String get SendOtpTitle {
    return Intl.message(
      'Send OTP',
      name: 'SendOtpTitle',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get navBarTitle1 {
    return Intl.message(
      'Home',
      name: 'navBarTitle1',
      desc: '',
      args: [],
    );
  }

  /// `My Booking`
  String get navBarTitle2 {
    return Intl.message(
      'My Booking',
      name: 'navBarTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Chekin`
  String get navBarTitle3 {
    return Intl.message(
      'CheckIn',
      name: 'navBarTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Schedule`
  String get navBarTitle4 {
    return Intl.message(
      'Schedule',
      name: 'navBarTitle4',
      desc: '',
      args: [],
    );
  }

  /// `Board`
  String get navBarTitle5 {
    return Intl.message(
      '커뮤니티',
      name: 'navBarTitle5',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get navBarTitle6 {
    return Intl.message(
      'Profile',
      name: 'navBarTitle6',
      desc: '',
      args: [],
    );
  }

  /// `Hello 👋 `
  String get hello {
    return Intl.message(
      'Hello 👋 ',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `Book Your\nFlight`
  String get bookFlightTitle {
    return Intl.message(
      'Book Your\nFlight',
      name: 'bookFlightTitle',
      desc: '',
      args: [],
    );
  }

  /// `Schedule`
  String get ScheduleTitle {
    return Intl.message(
      '출도착 조회',
      name: 'ScheudleTitle',
      desc: '',
      args: [],
    );
  }

  /// `Board`
  String get BoardTitle {
    return Intl.message(
      '커뮤니티',
      name: 'BoardTitle',
      desc: '',
      args: [],
    );
  }

  /// `Comment`
  String get CommentTitle {
    return Intl.message(
      '댓글 달기',
      name: 'CommentTitle',
      desc: '',
      args: [],
    );
  }
  /// `BoardUpload`
  String get BoardUploadTitle {
    return Intl.message(
      '글작성',
      name: 'BoardUploadTitle',
      desc: '',
      args: [],
    );
  }

    /// `BoardUpdate`
  String get BoardUpdateTitle {
    return Intl.message(
      '글 수정',
      name: 'BoardUpdateTitle',
      desc: '',
      args: [],
    );
  }

  /// `From`
  String get fromTitle {
    return Intl.message(
      'From',
      name: 'fromTitle',
      desc: '',
      args: [],
    );
  }

  /// `To`
  String get toTitle {
    return Intl.message(
      'To',
      name: 'toTitle',
      desc: '',
      args: [],
    );
  }

  /// `One Ways`
  String get tab1 {
    return Intl.message(
      'One Ways',
      name: 'tab1',
      desc: '',
      args: [],
    );
  }

  /// `Round Trip`
  String get tab2 {
    return Intl.message(
      'Round Trip',
      name: 'tab2',
      desc: '',
      args: [],
    );
  }

  /// `Multicity`
  String get tab3 {
    return Intl.message(
      'Multicity',
      name: 'tab3',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get dateTitle {
    return Intl.message(
      'Date',
      name: 'dateTitle',
      desc: '',
      args: [],
    );
  }

  /// `Travelers`
  String get travellerTitle {
    return Intl.message(
      'Travelers',
      name: 'travellerTitle',
      desc: '',
      args: [],
    );
  }

  /// `Adults`
  String get adults {
    return Intl.message(
      'Adults',
      name: 'adults',
      desc: '',
      args: [],
    );
  }

  /// `Child`
  String get child {
    return Intl.message(
      'Child',
      name: 'child',
      desc: '',
      args: [],
    );
  }

  /// `Infants`
  String get infants {
    return Intl.message(
      'Infants',
      name: 'infants',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Class`
  String get classTitle {
    return Intl.message(
      'Class',
      name: 'classTitle',
      desc: '',
      args: [],
    );
  }

  /// `Search Flight`
  String get searchFlight {
    return Intl.message(
      'Search Flight',
      name: 'searchFlight',
      desc: '',
      args: [],
    );
  }

  
  /// `uploadbutton`
  String get uploadbutton {
    return Intl.message(
      '등록',
      name: 'uploadbutton',
      desc: '',
      args: [],
    );
  }

    /// `updatebutton`
  String get updatebutton {
    return Intl.message(
      '수정',
      name: 'updatebutton',
      desc: '',
      args: [],
    );
  }

    /// `deletebutton`
  String get deletebutton {
    return Intl.message(
      '삭제',
      name: 'deletebutton',
      desc: '',
      args: [],
    );
  }

  /// `Recent Searched`
  String get recentSearch {
    return Intl.message(
      'Recent Searched',
      name: 'recentSearch',
      desc: '',
      args: [],
    );
  }

  /// `Flight Booking Offers`
  String get flightOfferTitle {
    return Intl.message(
      'Flight Booking Offers',
      name: 'flightOfferTitle',
      desc: '',
      args: [],
    );
  }

  /// `Return Date`
  String get returnDate {
    return Intl.message(
      'Return Date',
      name: 'returnDate',
      desc: '',
      args: [],
    );
  }

  /// `Add Fight`
  String get addFightButton {
    return Intl.message(
      'Add Fight',
      name: 'addFightButton',
      desc: '',
      args: [],
    );
  }

  /// `Where from?`
  String get searchScreenTitle {
    return Intl.message(
      'Where from?',
      name: 'searchScreenTitle',
      desc: '',
      args: [],
    );
  }

  /// `Current Location`
  String get currentLocation {
    return Intl.message(
      'Current Location',
      name: 'currentLocation',
      desc: '',
      args: [],
    );
  }

  /// `Use Current Location`
  String get useCurrentLocation {
    return Intl.message(
      'Use Current Location',
      name: 'useCurrentLocation',
      desc: '',
      args: [],
    );
  }

  /// `Recent Places`
  String get recentPlaceTitle {
    return Intl.message(
      'Recent Places',
      name: 'recentPlaceTitle',
      desc: '',
      args: [],
    );
  }

  /// `Filter`
  String get filter {
    return Intl.message(
      'Filter',
      name: 'filter',
      desc: '',
      args: [],
    );
  }

  /// `Departure`
  String get departure {
    return Intl.message(
      'Departure',
      name: 'departure',
      desc: '',
      args: [],
    );
  }

  /// `Arrival`
  String get arrival {
    return Intl.message(
      'Arrival',
      name: 'arrival',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancelButton {
    return Intl.message(
      'Cancel',
      name: 'cancelButton',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get applyButton {
    return Intl.message(
      'Apply',
      name: 'applyButton',
      desc: '',
      args: [],
    );
  }

  /// `Flight Details`
  String get flightDetails {
    return Intl.message(
      'Flight Details',
      name: 'flightDetails',
      desc: '',
      args: [],
    );
  }

  /// `Onward`
  String get onwardTitle {
    return Intl.message(
      'Onward',
      name: 'onwardTitle',
      desc: '',
      args: [],
    );
  }

  /// `Return`
  String get returnTitle {
    return Intl.message(
      'Return',
      name: 'returnTitle',
      desc: '',
      args: [],
    );
  }

  /// `Select Services`
  String get selectService {
    return Intl.message(
      'Select Services',
      name: 'selectService',
      desc: '',
      args: [],
    );
  }

  /// `Baggage Policy`
  String get bagPolicyTitle {
    return Intl.message(
      'Baggage Policy',
      name: 'bagPolicyTitle',
      desc: '',
      args: [],
    );
  }

  /// `Cancellation Refund Policy`
  String get refundPolicyTitle {
    return Intl.message(
      'Cancellation Refund Policy',
      name: 'refundPolicyTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter Promocode`
  String get promoCodeTitle {
    return Intl.message(
      'Enter Promocode',
      name: 'promoCodeTitle',
      desc: '',
      args: [],
    );
  }

  /// `View All`
  String get viewAllButton {
    return Intl.message(
      'View All',
      name: 'viewAllButton',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continueButton {
    return Intl.message(
      'Continue',
      name: 'continueButton',
      desc: '',
      args: [],
    );
  }

  /// `Select Gender`
  String get selectGenderTitle {
    return Intl.message(
      'Select Gender',
      name: 'selectGenderTitle',
      desc: '',
      args: [],
    );
  }

  /// `First & Middle Name`
  String get nameTitle {
    return Intl.message(
      'First & Middle Name',
      name: 'nameTitle',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get lastNameTitle {
    return Intl.message(
      'Last Name',
      name: 'lastNameTitle',
      desc: '',
      args: [],
    );
  }

  /// `Enter Last Name`
  String get lastNameHint {
    return Intl.message(
      'Enter Last Name',
      name: 'lastNameHint',
      desc: '',
      args: [],
    );
  }

  /// `Contact Information`
  String get contactInfoTitle {
    return Intl.message(
      'Contact Information',
      name: 'contactInfoTitle',
      desc: '',
      args: [],
    );
  }

  /// `Payment`
  String get paymentTitle {
    return Intl.message(
      'Payment',
      name: 'paymentTitle',
      desc: '',
      args: [],
    );
  }

  /// `View Details`
  String get viewDetails {
    return Intl.message(
      'View Details',
      name: 'viewDetails',
      desc: '',
      args: [],
    );
  }

  /// `Payment Method`
  String get paymentMethod {
    return Intl.message(
      'Payment Method',
      name: 'paymentMethod',
      desc: '',
      args: [],
    );
  }

  /// `Your payment cards`
  String get paymentCardTitle {
    return Intl.message(
      'Your payment cards',
      name: 'paymentCardTitle',
      desc: '',
      args: [],
    );
  }

  /// `Add New Card`
  String get addNewCardTitle {
    return Intl.message(
      'Add New Card',
      name: 'addNewCardTitle',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get DoneButton {
    return Intl.message(
      'Done',
      name: 'DoneButton',
      desc: '',
      args: [],
    );
  }

  /// `Ticket Status`
  String get ticketStatusTitle {
    return Intl.message(
      'Ticket Status',
      name: 'ticketStatusTitle',
      desc: '',
      args: [],
    );
  }

  /// `My Booking`
  String get myBookingTitle {
    return Intl.message(
      'My Booking',
      name: 'myBookingTitle',
      desc: '',
      args: [],
    );
  }

  /// `Board`
  String get boardTitle {
    return Intl.message(
      '커뮤니티',
      name: 'boardTitle',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profileTitle {
    return Intl.message(
      'Profile',
      name: 'profileTitle',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get settingTitle {
    return Intl.message(
      'Setting',
      name: 'settingTitle',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get englishTitle {
    return Intl.message(
      'English',
      name: 'englishTitle',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get notificationTitle {
    return Intl.message(
      'Notification',
      name: 'notificationTitle',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
