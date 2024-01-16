import 'package:flight_booking/screen/profile/payments/paymetns.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../widgets/constant.dart';

class AddNewCard extends StatefulWidget {
  const AddNewCard({Key? key}) : super(key: key);

  @override
  State<AddNewCard> createState() => _AddNewCardState();
}

class _AddNewCardState extends State<AddNewCard> {
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
        height: 105,
        decoration: const BoxDecoration(
            color: kWhite,
            boxShadow: [
              BoxShadow(
                color: kBorderColorTextField,
                offset: Offset(
                  10.0,
                  5.0,
                ),
                blurRadius: 10.0,
                spreadRadius: 2.0,
              ), //BoxShadow
              BoxShadow(
                color: Colors.white,
                offset: Offset(0.0, 0.0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ), //BoxShadow
            ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      elevation: 0.0,
                      backgroundColor: kPrimaryColor,
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const ProfilePayments()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  const [

                        Text(
                          'Save',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: kWhite),
                        )
                      ],
                    )),
              ),
            )
          ],
        ),
      ),
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: const Icon(
          Icons.arrow_back,
          color: kWhite,
        ).onTap(() => Navigator.pop(context)),
        title:  Text(
          'Add New Card',
          style: kTextStyle.copyWith(
            color: kWhite,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 10,),
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
