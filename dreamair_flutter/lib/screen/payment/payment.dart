import 'package:flight_booking/screen/payment/payment%20method/payment_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:nb_utils/nb_utils.dart';

import '../widgets/button_global.dart';
import '../widgets/constant.dart';
import 'package:flight_booking/generated/l10n.dart' as lang;

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  List<String> paymentMethod = [
    'Paypal',
    'Visa Card',
    'Stripe',
  ];

  String selectedMethod = 'Visa Card';

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
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        titleSpacing: 0,
        elevation: 0,
        backgroundColor: kPrimaryColor,
        iconTheme: const IconThemeData(color: kWhite),
        centerTitle: true,
        title: Text(
          lang.S.of(context).paymentTitle,
          style: kTextStyle.copyWith(
            color: kWhite,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: const BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.0),
            topLeft: Radius.circular(30.0),
          ),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10.0),
              Container(
                padding: const EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: kWhite,
                    border: Border.all(
                      color: kBorderColorTextField,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: kBorderColorTextField,
                        spreadRadius: 2.0,
                        blurRadius: 7.0,
                        offset: Offset(0, 2),
                      )
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      horizontalTitleGap: 0,
                      minLeadingWidth: 0,
                      title: Row(
                        children: [
                          Text(
                            'Total Due:$currencySign${14500}',
                            style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 14.0),
                          ),
                          const SizedBox(width: 2.0),
                          const Icon(
                            IconlyBold.discount,
                            color: kPrimaryColor,
                          ),
                          const SizedBox(width: 2.0),
                          Text(
                            'You save $currencySign${500}',
                            style: kTextStyle.copyWith(color: kSubTitleColor, fontSize: 12),
                          ),
                        ],
                      ),
                      subtitle: Text(
                        'Convenience Fee Added',
                        style: kTextStyle.copyWith(color: kSubTitleColor, fontSize: 12.0),
                      ),
                      trailing: GestureDetector(
                        onTap: () {
                          setState(() {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30.0),
                                  topLeft: Radius.circular(30.0),
                                ),
                              ),
                              context: context,
                              builder: (BuildContext context) {
                                return StatefulBuilder(builder: (context, setState) {
                                  return DraggableScrollableSheet(
                                    initialChildSize: 0.85,
                                    expand: false,
                                    maxChildSize: 1.00,
                                    minChildSize: 0.20,
                                    builder: (BuildContext context, ScrollController controller) {
                                      return SingleChildScrollView(
                                        physics: const NeverScrollableScrollPhysics(),
                                        controller: controller,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'View Details',
                                                    style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                                  ),
                                                  const Spacer(),
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        finish(context);
                                                      });
                                                    },
                                                    child: const Icon(
                                                      FeatherIcons.x,
                                                      color: kSubTitleColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(height: 10.0),
                                            Container(
                                              padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 20),
                                              decoration: const BoxDecoration(
                                                color: kWhite,
                                                borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(30.0),
                                                  topLeft: Radius.circular(30.0),
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: kBorderColorTextField,
                                                    spreadRadius: 2.0,
                                                    blurRadius: 7.0,
                                                    offset: Offset(0, -2),
                                                  ),
                                                ],
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  ListTile(
                                                    dense: true,
                                                    contentPadding: EdgeInsets.zero,
                                                    horizontalTitleGap: 0,
                                                    minLeadingWidth: 0,
                                                    title: Row(
                                                      children: [
                                                        Text(
                                                          'Total Due:$currencySign${14500}',
                                                          style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 14.0),
                                                        ),
                                                        const SizedBox(width: 2.0),
                                                        const Icon(
                                                          IconlyBold.discount,
                                                          color: kPrimaryColor,
                                                        ),
                                                        const SizedBox(width: 2.0),
                                                        Text(
                                                          'You save $currencySign${500}',
                                                          style: kTextStyle.copyWith(color: kSubTitleColor, fontSize: 12),
                                                        ),
                                                      ],
                                                    ),
                                                    subtitle: Text(
                                                      'Convenience Fee Added',
                                                      style: kTextStyle.copyWith(color: kSubTitleColor, fontSize: 12.0),
                                                    ),
                                                  ),
                                                  const Divider(
                                                    height: 1.0,
                                                    thickness: 1.0,
                                                    color: kBorderColorTextField,
                                                  ),
                                                  const SizedBox(height: 10.0),
                                                  Text(
                                                    'Fare Summary',
                                                    style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                                  ),
                                                  const SizedBox(height: 10.0),
                                                  Text(
                                                    'Adult x1',
                                                    style: kTextStyle.copyWith(color: kSubTitleColor),
                                                  ),
                                                  const SizedBox(height: 10.0),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Basic Fare',
                                                        style: kTextStyle.copyWith(color: kSubTitleColor),
                                                      ),
                                                      const Spacer(),
                                                      Text(
                                                        '$currencySign${13000}',
                                                        style: kTextStyle.copyWith(color: kSubTitleColor),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 10.0),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Taxes',
                                                        style: kTextStyle.copyWith(color: kSubTitleColor),
                                                      ),
                                                      const Spacer(),
                                                      Text(
                                                        '$currencySign${20000}',
                                                        style: kTextStyle.copyWith(color: kSubTitleColor),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 10.0),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Reschedule Charges',
                                                        style: kTextStyle.copyWith(color: kSubTitleColor),
                                                      ),
                                                      const Spacer(),
                                                      Text(
                                                        '$currencySign${0}',
                                                        style: kTextStyle.copyWith(color: kSubTitleColor),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 10.0),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'K3',
                                                        style: kTextStyle.copyWith(color: kSubTitleColor),
                                                      ),
                                                      const Spacer(),
                                                      Text(
                                                        '$currencySign${0}',
                                                        style: kTextStyle.copyWith(color: kSubTitleColor),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 10.0),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Coupon',
                                                        style: kTextStyle.copyWith(color: kPrimaryColor),
                                                      ),
                                                      const Spacer(),
                                                      Text(
                                                        '$currencySign${-500}',
                                                        style: kTextStyle.copyWith(color: kPrimaryColor),
                                                      ),
                                                    ],
                                                  ),
                                                  const Divider(
                                                    thickness: 1.0,
                                                    color: kBorderColorTextField,
                                                  ),
                                                  Text(
                                                    'Round Trip',
                                                    style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                                  ),
                                                  ListTile(
                                                    dense: true,
                                                    contentPadding: EdgeInsets.zero,
                                                    horizontalTitleGap: 10,
                                                    minLeadingWidth: 0,
                                                    leading: Container(
                                                      height: 34,
                                                      width: 34,
                                                      decoration: const BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        image: DecorationImage(image: AssetImage('images/indigo.png'), fit: BoxFit.cover),
                                                      ),
                                                    ),
                                                    title: Row(
                                                      children: [
                                                        Text(
                                                          'Depart (DAC - CCU)',
                                                          style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 14.0),
                                                        ),
                                                      ],
                                                    ),
                                                    subtitle: Text(
                                                      'Thu, 6 Jan |  11:40pm - 05:25pm | 5h 25m | 1 Stop',
                                                      style: kTextStyle.copyWith(color: kSubTitleColor, fontSize: 12.0),
                                                    ),
                                                  ),
                                                  const Divider(
                                                    thickness: 1.0,
                                                    color: kBorderColorTextField,
                                                  ),
                                                  ListTile(
                                                    dense: true,
                                                    contentPadding: EdgeInsets.zero,
                                                    horizontalTitleGap: 10,
                                                    minLeadingWidth: 0,
                                                    leading: Container(
                                                      height: 34,
                                                      width: 34,
                                                      decoration: const BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        image: DecorationImage(image: AssetImage('images/indigo.png'), fit: BoxFit.cover),
                                                      ),
                                                    ),
                                                    title: Row(
                                                      children: [
                                                        Text(
                                                          'Depart (DAC - CCU)',
                                                          style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 14.0),
                                                        ),
                                                      ],
                                                    ),
                                                    subtitle: Text(
                                                      'Thu, 6 Jan |  11:40pm - 05:25pm | 5h 25m | 1 Stop',
                                                      style: kTextStyle.copyWith(color: kSubTitleColor, fontSize: 12.0),
                                                    ),
                                                  ),
                                                  const Divider(
                                                    thickness: 1.0,
                                                    color: kBorderColorTextField,
                                                  ),
                                                  Text(
                                                    'Shaidul Islam (Male)',
                                                    style: kTextStyle.copyWith(color: kSubTitleColor, fontWeight: FontWeight.bold),
                                                  ),
                                                  const SizedBox(
                                                    height: 10.0,
                                                  ),
                                                  Text(
                                                    'shaidulislma@gmail.com',
                                                    style: kTextStyle.copyWith(color: kSubTitleColor, fontWeight: FontWeight.bold),
                                                  ),
                                                  const SizedBox(
                                                    height: 10.0,
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                });
                              },
                            );
                          });
                        },
                        child: Text(
                          lang.S.of(context).viewDetails,
                          style: kTextStyle.copyWith(
                            color: kPrimaryColor,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ),
                    const Divider(
                      height: 1,
                      thickness: 1.0,
                      color: kBorderColorTextField,
                    ),
                    ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      horizontalTitleGap: 10,
                      minLeadingWidth: 0,
                      leading: Container(
                        height: 34,
                        width: 34,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(image: AssetImage('images/indigo.png'), fit: BoxFit.cover),
                        ),
                      ),
                      title: Row(
                        children: [
                          Text(
                            'Dhaka',
                            style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 14.0),
                          ),
                          const SizedBox(width: 2.0),
                          const RotatedBox(
                            quarterTurns: 1,
                            child: Icon(
                              IconlyLight.swap,
                              color: kPrimaryColor,
                            ),
                          ),
                          const SizedBox(width: 2.0),
                          Text(
                            'New Delhi ',
                            style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 14.0),
                          ),
                        ],
                      ),
                      subtitle: Text(
                        'Thu, 6 Jan |  11:40pm - 05:25pm | 5h 25m | 1 Stop',
                        style: kTextStyle.copyWith(color: kSubTitleColor, fontSize: 12.0),
                      ),
                    ),
                    const Divider(
                      height: 1,
                      thickness: 1.0,
                      color: kBorderColorTextField,
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      'Shaidul Islam (Male)',
                      style: kTextStyle.copyWith(color: kTitleColor, fontSize: 12.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              GestureDetector(
                onTap: (){
                  setState(() {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30.0),
                          topLeft: Radius.circular(30.0),
                        ),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return StatefulBuilder(builder: (context, setState) {
                          return DraggableScrollableSheet(
                            initialChildSize: 0.85,
                            expand: false,
                            maxChildSize: 1.00,
                            minChildSize: 0.20,
                            builder: (BuildContext context, ScrollController controller) {
                              return SingleChildScrollView(
                                physics: const NeverScrollableScrollPhysics(),
                                controller: controller,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            'View Details',
                                            style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                          ),
                                          const Spacer(),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                finish(context);
                                              });
                                            },
                                            child: const Icon(
                                              FeatherIcons.x,
                                              color: kSubTitleColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 10.0),
                                    Container(
                                      decoration: const BoxDecoration(
                                        color: kWhite,
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(30.0),
                                          topLeft: Radius.circular(30.0),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: kBorderColorTextField,
                                            spreadRadius: 2.0,
                                            blurRadius: 7.0,
                                            offset: Offset(0, -2),
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                            child: CreditCardWidget(
                                              // padding: AppConstants.creditCardPadding,
                                              backgroundImage: 'images/card1.png',
                                              textStyle: kTextStyle.copyWith(fontSize: 10.0, color: Colors.white),
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
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                            child: CreditCardForm(
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
                                          ),
                                          const SizedBox(height: 20.0),
                                          Padding(
                                            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                                            child: ButtonGlobalWithoutIcon(
                                              buttontext: lang.S
                                                  .of(context)
                                                  .DoneButton,
                                              buttonDecoration: kButtonDecoration.copyWith(
                                                color: kPrimaryColor,
                                                borderRadius: BorderRadius.circular(30.0),
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                 Navigator.pop(context);
                                                });
                                              },
                                              buttonTextColor: kWhite,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        });
                      },
                    );
                  });
                },
                child: Row(
                  children: [
                    Text(
                      lang.S.of(context).paymentMethod,
                      style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    const Icon(
                      FeatherIcons.plusCircle,
                      size: 18.0,
                      color: kSubTitleColor,
                    ),
                    const SizedBox(width: 2.0),
                    Text(
                      'New card',
                      style: kTextStyle.copyWith(color: kSubTitleColor),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              Container(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                decoration: BoxDecoration(
                  color: kWhite,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: kBorderColorTextField),
                  boxShadow: const [
                    BoxShadow(
                      color: kBorderColorTextField,
                      spreadRadius: 2.0,
                      blurRadius: 7.0,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: paymentMethod.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: kWhite,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: kBorderColorTextField),
                          boxShadow: const [
                            BoxShadow(
                              color: kBorderColorTextField,
                              spreadRadius: 2.0,
                              blurRadius: 7.0,
                              offset: Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Theme(
                          data: ThemeData(
                            checkboxTheme: CheckboxThemeData(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  30.0,
                                ),
                              ),
                            ),
                          ),
                          child: CheckboxListTile(
                            contentPadding: const EdgeInsets.only(left: 10.0, right: 10.0),
                            title: Text(
                              paymentMethod[index],
                              style: kTextStyle.copyWith(color: kTitleColor),
                            ),
                            secondary: Container(
                              height: 36,
                              width: 52,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                image: DecorationImage(
                                    image: AssetImage(
                                      imageList[index],
                                    ),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            value: paymentMethod[index] == selectedMethod,
                            onChanged: (val) {
                              setState(() {
                                selectedMethod = paymentMethod[index];
                              });
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20.0),
              Text(
                'Fare Summary',
                style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0),
              Text(
                'Adult x1',
                style: kTextStyle.copyWith(color: kSubTitleColor),
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Text(
                    'Basic Fare',
                    style: kTextStyle.copyWith(color: kSubTitleColor),
                  ),
                  const Spacer(),
                  Text(
                    '$currencySign${13000}',
                    style: kTextStyle.copyWith(color: kSubTitleColor),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Text(
                    'Taxes',
                    style: kTextStyle.copyWith(color: kSubTitleColor),
                  ),
                  const Spacer(),
                  Text(
                    '$currencySign${20000}',
                    style: kTextStyle.copyWith(color: kSubTitleColor),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Text(
                    'Reschedule Charges',
                    style: kTextStyle.copyWith(color: kSubTitleColor),
                  ),
                  const Spacer(),
                  Text(
                    '$currencySign${0}',
                    style: kTextStyle.copyWith(color: kSubTitleColor),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Text(
                    'K3',
                    style: kTextStyle.copyWith(color: kSubTitleColor),
                  ),
                  const Spacer(),
                  Text(
                    '$currencySign${0}',
                    style: kTextStyle.copyWith(color: kSubTitleColor),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Text(
                    'Coupon',
                    style: kTextStyle.copyWith(color: kPrimaryColor),
                  ),
                  const Spacer(),
                  Text(
                    '$currencySign${-500}',
                    style: kTextStyle.copyWith(color: kPrimaryColor),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(color: kWhite),
        child: ListTile(
          contentPadding: const EdgeInsets.only(left: 15.0, right: 15.0),
          visualDensity: const VisualDensity(vertical: 2),
          title: Text(
            'For 1 Adult',
            style: kTextStyle.copyWith(color: kSubTitleColor),
          ),
          subtitle: Text(
            ' $currencySign${45000.00}',
            style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
          ),
          trailing: SizedBox(
            width: 200,
            child: ButtonGlobalWithoutIcon(
              buttontext: lang.S.of(context).continueButton,
              buttonDecoration: kButtonDecoration.copyWith(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(30.0),
              ),
              onPressed: () {
                setState(() {
                  selectedMethod == 'Visa Card' ?
                  const PaymentMethod().launch(context) : null;
                });
              },
              buttonTextColor: kWhite,
            ),
          ),
        ),
      ),
    );
  }
}
