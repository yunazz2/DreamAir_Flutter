import 'dart:convert';

import 'package:flight_booking/screen/provider/user_provider.dart';
import 'package:flight_booking/screen/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:http/http.dart' as http;

import '../ticket_detail/ticket_detail_screen.dart';

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
    getBookingListByUser();
  }
  
  int _bookedTicketCount = 0;
  List<Map<String, dynamic>> _bookingList = [];

  TextEditingController phoneController = TextEditingController();
  TextEditingController orderPasswordController = TextEditingController();

  // 회원 예매 내역 조회
  Future getBookingListByUser() async {
    print('회원 예매 내역 조회 시작');

    String userId = UserProvider.userId;

    final url = 'http://10.0.2.2:9090/user/bookingList/$userId';

    try {
      final response = await http.get(Uri.parse(url));
      if(response.statusCode == 200) {
        print('회원 예매 내역 조회 응답 성공');
        var utf8Decoded = utf8.decode(response.bodyBytes);
        var result = json.decode(utf8Decoded);
        
        _bookingList = List<Map<String, dynamic>>.from(result);
        _bookedTicketCount = result.length;

        print(_bookingList);
        setState(() {}); // 화면 갱신을 위해 setState 호출
      }
    } catch (e) {
      print('오류 발생: $e');
    }
  }

  // 비회원 예매 내역 조회
  Future getBookingListByGuest() async {
    print('비회원 예매 내역 조회 시작');
    
    String phone = phoneController.text;
    String orderPassword = orderPasswordController.text;

    // final url = 'http://10.0.2.2:9090/user/'
  }

  @override
  Widget build(BuildContext context) {

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
              // 회원일 때
              if (UserProvider.isLogin)
                _bookedTicketCount > 0
                  ? ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _bookedTicketCount,
                    itemBuilder: (_, i) {
                      var ticketInfo = _bookingList[i];
                      var ticketNo = ticketInfo['ticketNo'];
                      var departure = ticketInfo['departure'];
                      var destination = ticketInfo['destination'];

                      return Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: kBorderColorTextField,
                            ),
                          ),
                          child: Column(
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
                                      builder: (context) => TicketDetailScreen(ticketNo: ticketNo),
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
                                title: Row(
                                  children: [
                                    Text(
                                      departure,
                                      style: const TextStyle(color: kTitleColor),
                                    ),
                                    const SizedBox(width: 2.0),
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
                                            shape: BoxShape.circle,
                                          ),
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
                                            border: Border.all(color: kPrimaryColor),
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
                                    MainAxisAlignment.start,
                                children: [
                                  Image(
                                    width: 20.0,
                                    height: 20.0,
                                    image: AssetImage('images/mini_logo.png'),
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(width: 10.0),
                                  Text('Dream Air',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: kTitleColor,
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                : Column(children: [
                    SizedBox(height: 30.0,),
                    Text('예매된 탑승권이 없습니다.', style: TextStyle(fontSize: 18.0),),
                    SizedBox(height: 1000.0,),
                  ],)
              // 비회원일 때
              else
                Column(
                  children: [
                    const SizedBox(height: 30),
                    const Text(
                      '비회원 탑승권 조회 시',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    const Text(
                      '핸드폰 번호와 예매 비밀번호를 입력해주세요.',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    SizedBox(height: 30.0,),
                    Container(
                      child: Column(
                        children: [
                          // 핸드폰 번호 입력 필드
                          AppTextField(
                            cursorColor: kTitleColor,
                            textFieldType: TextFieldType.NUMBER,
                            decoration: kInputDecoration.copyWith(
                              labelText: '핸드폰 번호',
                            ),
                          ),

                          SizedBox(height: 10.0,),

                          // 예매 비밀번호 입력 필드
                          AppTextField(
                            cursorColor: kTitleColor,
                            textFieldType: TextFieldType.OTHER,
                            decoration: kInputDecoration.copyWith(
                              labelText: '예매 비밀번호',
                            ),
                          ),
                          SizedBox(height: 10.0,),

                          // 조회 버튼
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.white, elevation: 1.0,),
                            child: Text('조회'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );

  }
}
