import 'package:flutter/material.dart';
import '../../widgets/constant.dart';

// 나의 탑승권 조회 페이지
class MyBookingScreen extends StatefulWidget {
  const MyBookingScreen({Key? key}) : super(key: key);

  @override
  State<MyBookingScreen> createState() => _MyBookingScreenState();
}

class _MyBookingScreenState extends State<MyBookingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: kWhite),
        title: Text('나의 탑승권 조회', style: TextStyle(color: Colors.white,),),
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
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Disclosures of Your Information',
                style: kTextStyle.copyWith(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Food First envisions a world in which all people have access to healthy, ecologically produced, and culturally appropriate food. After 40 years of analysis of the global food system, we know that making this vision a reality involves more than tech nical solutions—it requires political',
                style: kTextStyle.copyWith(color: kSubTitleColor, height: 1.5),
              ),
              const SizedBox(
                height: 20,
              ),
              Text('Legal Disclaimer', style: kTextStyle.copyWith(fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Food First envisions a world in which all people have access to healthy, ecologically produced, and culturally appropriate food. After 40 years of analysis of the global food system, we know that making this vision a reality involves more than tech nic al solutions—it requires political Food First envisions a world in which all people have access to healthy, ecologically produced, and culturally appropriate food. After 40 years of analysis of the global food system, we know that making this vision a reality involves more than tech nical ',
                style: kTextStyle.copyWith(color: kSubTitleColor, height: 1.5),
              )
            ],
          ),
        ),
      ),
    );
  }
}
