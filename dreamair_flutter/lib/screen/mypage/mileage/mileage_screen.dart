import 'package:flutter/material.dart';

import '../../widgets/constant.dart';

class MileageScreen extends StatefulWidget {
  const MileageScreen({Key? key}) : super(key: key);

  @override
  State<MileageScreen> createState() => _MileageScreenState();
}

class _MileageScreenState extends State<MileageScreen> {

  int _mileage = 5000;

  // List<String> image = [
  //   'images/visa.png',
  //   'images/payment.png',
  //   'images/stripe.png',
  // ];
  // List<String> name = [
  //   'Visa Card',
  //   'Paypal',
  //   'Stripe',
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text('마일리지 조회', style: TextStyle(color: Colors.white,),),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 50,),
            Text('보유 마일리지 : $_mileage', style: TextStyle(fontSize: 20.0),)
          ],
        ),
      ),
    );
  }
}
