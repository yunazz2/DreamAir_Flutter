import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/constant.dart';

// 티켓 상세 조회 페이지
class TicketDetailScreen extends StatefulWidget {
  const TicketDetailScreen({Key? key}) : super(key: key);

  @override
  State<TicketDetailScreen> createState() => _TicketDetailScreenState();
}

class _TicketDetailScreenState extends State<TicketDetailScreen> {

  int ticketNo = 1;
  String departure = '김포';
  String destination = '제주';
  String departureDate = '2024/01/20';
  String destinationDate = '2024/01/20';
  String selectedSeatNo = 'A1';

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

          // 버튼
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
              
              // 탑승권 맨 위 Dream Air 로고, 타이틀
              child: Column(
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

                  // QR 이미지
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        width: 150.0,
                        height: 150.0,
                        image: AssetImage('images/QR1.png'),
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),

                  // 탑승권 상세 내용
                  const SizedBox(height: 15.0),
                  Text('탑승권 번호 : $ticketNo', style: TextStyle(color: kTitleColor, fontWeight: FontWeight.bold),),
                  const SizedBox(height: 10.0),
                  
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0), border: Border.all(color: kBorderColorTextField)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // 출발지
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
                                  Text('출발지', style: TextStyle(color: kSubTitleColor, fontSize: 15.0),),
                                  SizedBox(height: 5.0),
                                  Text('$departure', style: TextStyle(color: kTitleColor, fontSize: 20.0, fontWeight: FontWeight.bold),),
                                ],
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 5.0),
                        Divider(thickness: 1.0, color: kBorderColorTextField,),
                        SizedBox(height: 5.0),
                        
                        // 도착지
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
                                  Text('도착지', style: TextStyle(color: kSubTitleColor, fontSize: 15.0),),
                                  SizedBox(height: 5.0),
                                  Text('$destination', style: TextStyle(color: kTitleColor, fontSize: 20.0, fontWeight: FontWeight.bold),),
                                ],
                              ),
                            ),
                          ],
                        ),
                        
                        SizedBox(height: 5.0),
                        Divider(thickness: 1.0, color: kBorderColorTextField,),
                        SizedBox(height: 5.0),
                        
                        // 출발일
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
                                  Text('출발일', style: TextStyle(color: kSubTitleColor, fontSize: 15.0),),
                                  SizedBox(height: 5.0),
                                  Text('$departureDate', style: TextStyle(color: kTitleColor, fontSize: 20.0, fontWeight: FontWeight.bold),),
                                ],
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 5.0),
                        Divider(thickness: 1.0, color: kBorderColorTextField,),
                        SizedBox(height: 5.0),

                        // 선택 좌석
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
                                  Text('선택 좌석', style: TextStyle(color: kSubTitleColor, fontSize: 15.0),),
                                  SizedBox(height: 5.0),
                                  Text('$selectedSeatNo', style: TextStyle(color: kTitleColor, fontSize: 20.0, fontWeight: FontWeight.bold),),
                                ],
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 5.0),
                        Divider(thickness: 1.0, color: kBorderColorTextField,),
                        SizedBox(height: 5.0),

                        // 예매자 명
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
                                  Text('출발일', style: TextStyle(color: kSubTitleColor, fontSize: 15.0),),
                                  SizedBox(height: 5.0),
                                  Text('$departureDate', style: TextStyle(color: kTitleColor, fontSize: 20.0, fontWeight: FontWeight.bold),),
                                ],
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 5.0),
                        Divider(thickness: 1.0, color: kBorderColorTextField,),
                        SizedBox(height: 5.0),

                        // 핸드폰 번호
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
                                  Text('출발일', style: TextStyle(color: kSubTitleColor, fontSize: 15.0),),
                                  SizedBox(height: 5.0),
                                  Text('$departureDate', style: TextStyle(color: kTitleColor, fontSize: 20.0, fontWeight: FontWeight.bold),),
                                ],
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 5.0),
                        Divider(thickness: 1.0, color: kBorderColorTextField,),
                        SizedBox(height: 5.0),

                        // 이메일
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
                                  Text('출발일', style: TextStyle(color: kSubTitleColor, fontSize: 15.0),),
                                  SizedBox(height: 5.0),
                                  Text('$departureDate', style: TextStyle(color: kTitleColor, fontSize: 20.0, fontWeight: FontWeight.bold),),
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
