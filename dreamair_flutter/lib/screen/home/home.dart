import 'package:flight_booking/screen/History_Screen/history_screen.dart';
import 'package:flight_booking/screen/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../my_boking_screen/my_boking.dart';
import 'home_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentPage = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(), // 항공권 예약
    MyBooking(), // 예약 조회
    History(), // 체크인 -> 변경해야함
    ScheduleScreen(), //  출도착 조회
    BoardScreen(), // 게시판
    Mypage(),  // 마이페이지
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_currentPage),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: BottomNavigationBar(
          elevation: 0.0,
          selectedItemColor: kPrimaryColor,
          unselectedItemColor: kSubTitleColor,
          backgroundColor: Colors.white,
          showUnselectedLabels: true,
          items: const [
            /// 항공권 예약
            BottomNavigationBarItem(icon: Icon(Icons.flight), label: '항공권 예약'),

            /// 예약 조회
            BottomNavigationBarItem(
                icon: Icon(IconlyBold.bookmark), label: '예약 조회'),

            /// 체크인
            BottomNavigationBarItem(
              icon: Icon(Icons.airplane_ticket),
              label: '체크인',
            ),
            // 출도착조회
            BottomNavigationBarItem(
                icon: Icon(Icons.schedule), label: '출도착 조회'),
            // 게시판
            BottomNavigationBarItem(
                icon: Icon(Icons.description), label: '커뮤니티'),
            // 마이 페이지
            BottomNavigationBarItem(icon: Icon(Icons.person), label: '마이페이지'),
          ],
          onTap: (int index) {
            setState(() => _currentPage = index);
          },
          currentIndex: _currentPage,
        ),
      ),
    );
  }
}
