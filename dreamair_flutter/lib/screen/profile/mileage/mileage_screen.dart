import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../widgets/constant.dart';

class MileageScreen extends StatefulWidget {
  const MileageScreen({Key? key}) : super(key: key);

  @override
  State<MileageScreen> createState() => _MileageScreenState();
}

class _MileageScreenState extends State<MileageScreen> {
  List<String> image = [
    'images/visa.png',
    'images/payment.png',
    'images/stripe.png',
  ];
  List<String> name = [
    'Visa Card',
    'Paypal',
    'Stripe',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: kWhite),
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
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
