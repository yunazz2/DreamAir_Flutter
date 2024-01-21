// 예약 조회 페이지
import 'package:flight_booking/screen/provider/user_provider.dart';
import 'package:flight_booking/screen/widgets/constant.dart';
import 'package:flutter/material.dart';

import '../ticket detail/ticket_detail_screen.dart';

// 나의 탑승권 조회 페이지
class MyBooking extends StatefulWidget {
  const MyBooking({super.key});

  @override
  State<MyBooking> createState() => _MyBookingState();
}

class _MyBookingState extends State<MyBooking> {
  @override
  void initState() {
    super.initState();
    print('로그인 여부 확인');
    print(UserProvider.isLogin);
  } 

  final int _bookedTicketCount = 5; // 예매한 탑승권 수

  @override
  Widget build(BuildContext context) {
    int ticketNo = 1;
    String departure = '김포';
    String destination = '제주';
    String departureDate = '2024/01/20';
    String destinationDate = '2024/01/20';

    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        titleSpacing: 0,
        elevation: 0,
        backgroundColor: kPrimaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: const Text(
          '나의 탑승권 조회',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _bookedTicketCount,
                itemBuilder: (_, i) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: kBorderColorTextField,
                          )),

                      // 예매한 탑승권 목록
                      child: Column(
                        if(UserProvider.isLogin) {

                        } else {}
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('탑승권 번호 : $ticketNo'),
                          const Divider(
                            thickness: 1.0,
                            color: kBorderColorTextField,
                          ),
                          ListTile(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const TicketDetailScreen(), // 티켓 상세조회 페이지
                                ),
                              );
                            },
                            horizontalTitleGap: 5.0,
                            contentPadding: EdgeInsets.zero,
                            minLeadingWidth: 0,
                            leading: const SizedBox(
                              height: 35.0,
                              width: 35.0,
                              child: Icon(Icons.flight),
                            ),
                            // 출발지 도착지
                            title: Row(
                              children: [
                                Text(
                                  departure,
                                  style: const TextStyle(color: kTitleColor),
                                ),
                                const SizedBox(width: 2.0),

                                // 출발지 도착지 사이 화살표 디자인
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 10.0,
                                      width: 10.0,
                                      decoration: const BoxDecoration(
                                          color: kPrimaryColor,
                                          shape: BoxShape.circle),
                                    ),
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          height: 2.0,
                                          width: 80,
                                          decoration: const BoxDecoration(
                                            color: kPrimaryColor,
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.all(5.0),
                                          decoration: const BoxDecoration(
                                            color: kPrimaryColor,
                                            shape: BoxShape.circle,
                                          ),
                                          child: const Icon(
                                            Icons.arrow_right_alt_outlined,
                                            size: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: 10.0,
                                      width: 10.0,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                        border:
                                            Border.all(color: kPrimaryColor),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),

                                Text(
                                  destination,
                                  style: const TextStyle(color: kTitleColor),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 3.0,
                          ),
                          const Divider(
                            thickness: 1.0,
                            color: kBorderColorTextField,
                          ),
                          const Row(
                            mainAxisAlignment:
                                MainAxisAlignment.start, // 각 요소 사이의 간격을 균등하게 조절
                            children: [
                              Image(
                                width: 20.0,
                                height: 20.0,
                                image: AssetImage('images/mini_logo.png'),
                                fit: BoxFit.cover,
                              ),
                              SizedBox(width: 10.0), // 요소간 간격 추가
                              Text('Dream Air',
                                  style: TextStyle(
                                      fontSize: 12, color: kTitleColor)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
