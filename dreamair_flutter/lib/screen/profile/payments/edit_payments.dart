import 'package:flight_booking/screen/profile/payments/paymetns.dart';
import 'package:flight_booking/screen/widgets/button_global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import '../../widgets/constant.dart';

class EditPaymentsProfile extends StatefulWidget {
  const EditPaymentsProfile({Key? key}) : super(key: key);

  @override
  State<EditPaymentsProfile> createState() => _EditPaymentsProfileState();
}

class _EditPaymentsProfileState extends State<EditPaymentsProfile> {
  List<String> paymentMethod = [
    'Paypal',
    'Visa Card',
    'Stripe',
  ];

  String selectedMethod = 'Paypal';

  List<String> imageList = [
    'images/payment.png',
    'images/visa.png',
    'images/stripe.png',
  ];
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: kWhite,
        child: Container(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          height: 90,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.0),
              topLeft: Radius.circular(30.0),
            ),
            color: kWhite,
            boxShadow: [
              BoxShadow(
                color: kBorderColorTextField,
                offset: Offset(0, 5.0),
                blurRadius: 10.0,
                spreadRadius: 2.0,
              ), //BoxShadow//BoxShadow
            ],
          ),
          child: SizedBox(
            height: 50,
            width: double.infinity,
            child: ButtonGlobalWithoutIcon(
              buttontext: 'Update',
              buttonDecoration: kButtonDecoration.copyWith(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(30.0),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfilePayments(),
                  ),
                );
              },
              buttonTextColor: kWhite,
            ),
          ),
        ),
      ),
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: kWhite),
        title: Text(
          'Edit',
          style: kTextStyle.copyWith(
            color: kWhite,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: kWhite,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 10,
                ),
                CreditCardWidget(
                  padding: 10,
                  backgroundImage: 'images/card2.png',
                  textStyle: kTextStyle.copyWith(fontSize: 10.0, color: Colors.white),
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  showBackView: isCvvFocused,
                  obscureCardNumber: true,
                  obscureCardCvv: true,
                  isHolderNameVisible: true,
                  cardBgColor: kPrimaryColor,
                  isSwipeGestureEnabled: true,
                  onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
                ),
                CreditCardForm(
                  formKey: formKey,
                  // Required
                  onCreditCardModelChange: onCreditCardModelChange,
                  // Required
                  obscureCvv: true,
                  obscureNumber: true,
                  cardNumber: cardNumber,
                  cvvCode: cvvCode,
                  isHolderNameVisible: true,
                  isCardNumberVisible: true,
                  isExpiryDateVisible: true,
                  cardHolderName: cardHolderName,
                  expiryDate: expiryDate,
                  // themeColor: Colors.blue,
                  // textColor: kTitleColor,
                  inputConfiguration: const InputConfiguration(
                    cardNumberDecoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Number',
                      hintText: 'XXXX XXXX XXXX XXXX',
                    ),
                    expiryDateDecoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Expired Date',
                      hintText: 'XX/XX',
                    ),
                    cvvCodeDecoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'CVV',
                      hintText: 'XXX',
                    ),
                    cardHolderDecoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Card Holder',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
