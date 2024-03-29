import 'package:flight_booking/screen/home/home.dart';
import 'package:flight_booking/screen/widgets/button_global.dart';
import 'package:flight_booking/screen/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:flight_booking/generated/l10n.dart' as lang;
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../ticket_detail/ticket_detail_screen.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = '546787667938746';
  String expiryDate = '05/31';
  String cardHolderName = 'Ibne Riead';
  String cvvCode = '736';
  bool isCvvFocused = false;
  bool isChecked = false;

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }

  void showSuccessPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 118.0,
                  width: 133.0,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('images/success.png'),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                const Text(
                  '결제가 완료되었습니다!',
                  style: TextStyle(
                    color: kTitleColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 21,
                  ),
                ),
                const Text(
                  'Thank you for purchase the ticket!',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: kSubTitleColor),
                ),
                const SizedBox(height: 10.0),
                ButtonGlobalWithoutIcon(
                  buttontext: '탑승권 보기',
                  buttonDecoration:
                      kButtonDecoration.copyWith(color: kPrimaryColor),
                  onPressed: () {
                    setState(() {
                      finish(context);
                      // 티켓 번호 넘겨주어야 함 - 우선 하드 코딩
                      int ticketNo = 1;
                      TicketDetailScreen(ticketNo: ticketNo,).launch(context);
                    });
                  },
                  buttonTextColor: kWhite,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      const Home().launch(context);
                      finish(context);
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        FeatherIcons.arrowLeft,
                        color: kSubTitleColor,
                      ),

                     TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                        );
                      },
                      child: Text('메인으로'),
                    ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        title: Text('결제', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10.0),
            CreditCardWidget(
              // padding: AppConstants.creditCardPadding,
              backgroundImage: 'images/card1.png',
              textStyle:
                  kTextStyle.copyWith(fontSize: 10.0, color: Colors.white),
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isCvvFocused,
              obscureCardNumber: true,
              obscureCardCvv: true,
              isHolderNameVisible: true,
              cardBgColor: Colors.deepOrangeAccent,
              isSwipeGestureEnabled: true,
              onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
            ),
            Row(
              children: [
                Checkbox(
                  activeColor: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                  value: isChecked,
                  onChanged: (val) {
                    setState(
                      () {
                        isChecked = val!;
                      },
                    );
                  },
                ),
                const Text(
                  '카드 선택',
                  style: TextStyle(color: kTitleColor),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: ButtonGlobalWithoutIcon(
          buttontext: '결제하기',
          buttonDecoration: kButtonDecoration.copyWith(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(30.0),
          ),
          onPressed: () {
            setState(() {
              showSuccessPopup();
            });
          },
          buttonTextColor: kWhite,
        ),
      ),
    );
  }
}
