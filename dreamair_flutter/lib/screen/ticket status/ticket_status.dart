import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nb_utils/nb_utils.dart';

import '../widgets/constant.dart';
import 'package:flight_booking/generated/l10n.dart' as lang;

// 티켓 상세 조회 페이지
class TicketStatus extends StatefulWidget {
  const TicketStatus({Key? key}) : super(key: key);

  @override
  State<TicketStatus> createState() => _TicketStatusState();
}

class _TicketStatusState extends State<TicketStatus> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        title: Text('나의 탑승권 조회', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(color: kDarkWhite),
        child: Container(
          padding: const EdgeInsets.all(10.0),
          height: 90,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
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
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Download',
                        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: Colors.white),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      FaIcon(
                        FeatherIcons.downloadCloud,
                        size: 25,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),

      // 탑승권 상세 조회 내용 시작
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFFF9F9F9),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16.0)),
              child: Column(
                // 탑승권 맨 위 Dream Air 로고, 타이틀
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: DecorationImage(image: AssetImage('images/logo.png'), fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(width: 5.0,),
                      Text('Dream Air', style: TextStyle(color: kTitleColor, fontWeight: FontWeight.bold)),
                    ],
                  ),

                  // 점선 구분선
                  const SizedBox(height: 10.0),
                  Row(
                    children: List.generate(
                        800 ~/ 10,
                            (index) => Expanded(
                          child: Container(
                            color: index % 2 == 0 ? Colors.transparent : kPrimaryColor.withOpacity(0.5),
                            height: 1,
                          ),
                        )),
                  ),

                  // 탑승권 상세 내용
                  const SizedBox(height: 15.0),
                  Text(
                    'Traveler Details',
                    style: TextStyle(color: kTitleColor, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0), border: Border.all(color: kBorderColorTextField)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Passenger Name',
                                    style: TextStyle(color: kSubTitleColor, fontSize: 10.0),
                                  ),
                                  const SizedBox(height: 5.0),
                                  Text(
                                    'Mr.Shiadul Islam',
                                    style: TextStyle(color: kTitleColor, fontSize: 10.0, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Airline PNR',
                                    style: TextStyle(color: kSubTitleColor, fontSize: 10.0),
                                  ),
                                  const SizedBox(height: 5.0),
                                  Text(
                                    'A70G26',
                                    style: TextStyle(color: kTitleColor, fontSize: 10.0, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Ticket Number',
                                    style: TextStyle(color: kSubTitleColor, fontSize: 10.0),
                                  ),
                                  const SizedBox(height: 5.0),
                                  Text(
                                    '999458154454',
                                    style: TextStyle(color: kTitleColor, fontSize: 10.0, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5.0),
                        const Divider(
                          thickness: 1.0,
                          color: kBorderColorTextField,
                        ),
                        const SizedBox(height: 5.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Travel Insurance',
                                    style: TextStyle(color: kSubTitleColor, fontSize: 10.0),
                                  ),
                                  const SizedBox(height: 5.0),
                                  Text(
                                    'Not Confirmed',
                                    style: TextStyle(color: kTitleColor, fontSize: 10.0, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Class | Cabin',
                                    style: TextStyle(color: kSubTitleColor, fontSize: 10.0),
                                  ),
                                  const SizedBox(height: 5.0),
                                  Text(
                                    'V | Economy',
                                    style: TextStyle(color: kTitleColor, fontSize: 10.0, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Status',
                                    style: TextStyle(color: kSubTitleColor, fontSize: 10.0),
                                  ),
                                  const SizedBox(height: 5.0),
                                  Text(
                                    'Confirm',
                                    style: TextStyle(color: Colors.green, fontSize: 10.0, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // 점선 구분선
                  const SizedBox(height: 10.0),
                  Row(
                    children: List.generate(
                        800 ~/ 10,
                            (index) => Expanded(
                          child: Container(
                            color: index % 2 == 0 ? Colors.transparent : kPrimaryColor.withOpacity(0.5),
                            height: 1,
                          ),
                        )),
                  ),
                  SizedBox(height: 500.0,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
