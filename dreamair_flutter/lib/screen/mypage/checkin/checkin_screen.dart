import 'dart:convert';

import 'package:flight_booking/screen/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../widgets/constant.dart';

class CheckInScreen extends StatefulWidget {
  const CheckInScreen({Key? key}) : super(key: key);

  @override
  State<CheckInScreen> createState() => _CheckInScreenState();
}

class _CheckInScreenState extends State<CheckInScreen> {
  @override
  void initState() {
    super.initState();
    
  }

  String departure = '';
  String destination = '';
  String departureDate = '';
  String selectedSeatNo = '';

  bool isCheckInButtonEnabled = true; // 체크인 버튼 활성화

  List<Widget> resultRows = [];
  String ticketNumber = '';                                               // 탑승권 번호를 저장할 변수
  TextEditingController ticketNumberController = TextEditingController(); // 탑승권 번호를 넘겨줄 컨트롤러

  // 체크인 처리
  Future<void> checkIn(String ticketNumber) async {
    try {
      final url = 'http://13.209.3.162/user/checkin';

      Map<String, dynamic> requestData = {
        'ticketNo': ticketNumber,
        // 추가로 필요한 데이터가 있다면 여기에 추가
      };

      final response = await http.post(
        Uri.parse(url),
        body: json.encode(requestData),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // 서버 응답 성공 시
        print('체크인 완료');
        // 추가로 처리할 내용이 있다면 여기에 추가
      } else {
        // 서버 응답 실패 시
        print('서버 응답 실패: ${response.statusCode}');
        // 추가로 처리할 내용이 있다면 여기에 추가
      }
    } catch (e) {
      // 예외 처리
      print('오류 발생: $e');
      // 추가로 처리할 내용이 있다면 여기에 추가
    }
  }



  // 탑승권 상세 정보 조회
  Future<void> getTicketDetail(UserProvider userProvider) async {
    print('티켓 상세 조회 시작');

    int ticketNo = int.tryParse(ticketNumber) ?? 0;
    String userId = userProvider.userId;

    final url = 'http://13.209.3.162/user/booking/ticketInfo/$ticketNo?userId=$userId';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        print('티켓 상세 내역 조회 응답 성공');
        var utf8Decoded = utf8.decode(response.bodyBytes);
        var result = json.decode(utf8Decoded);

        print(result);

        departure = result['viewTicketDetail'][0]['departure'];
        destination = result['viewTicketDetail'][0]['destination'];
        departureDate = result['viewTicketDetail'][0]['departureDate'];
        selectedSeatNo = result['viewTicketDetail'][0]['seatNo'];

        setState(() {
          // 체크인 버튼 활성화 여부를 판단하여 업데이트
          isCheckInButtonEnabled = !result['isCheckedIn'];
          // 결과 행 업데이트
          resultRows = generateResultRows();
        });
      }
    } catch (e) {
      print('오류 발생: $e');
    }
  }

  // 조회 버튼 클릭 후 보여질 내용
  List<Widget> generateResultRows() {
    return List.generate(10, (index) {
      String title;
      String content;

      // 인덱스에 따라 다른 내용 생성
      if (index == 0) {
        title = '';
        content = '티켓 번호 : $ticketNumber';
      } else if (index == 1) {
        title = '출발지';
        content = '';
      } else if (index == 2) {
        title = '';
        content = '$departure';
      } else if (index == 3) {
        title = '도착지';
        content = '';
      } else if (index == 4) {
        title = '';
        content = '$destination';
      } else if (index == 5) {
        title = '출발일';
        content = '';
      } else if (index == 6) {
        title = '';
        content = '$departureDate';
      } else if (index == 7) {
        title = '선택 좌석';
        content = '';
      } else if (index == 8) {
        title = '';
        content = '$selectedSeatNo';
      } else {
        // '체크인' 버튼 행 추가
        return Column(
          children: [
            ElevatedButton(
              onPressed: isCheckInButtonEnabled ? () {
                // '체크인' 버튼이 눌렸을 때 처리 로직 추가
                checkIn(ticketNumber);

                // 팝업 창
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: Colors.white,
                      title: Text('체크인 완료', style: TextStyle(color: Colors.black, fontSize: 20.0),),
                      content: Text('체크인이 완료되었습니다.', style: TextStyle(color: Colors.black),),
                      actions: [
                        TextButton(
                          onPressed: () {
                            // 팝업 창 닫기
                            Navigator.of(context).pop();

                            // 체크인 버튼 비활성화
                            setState(() {
                              isCheckInButtonEnabled = false;
                            });
                          },
                          child: Text('확인'),
                        ),
                      ],
                    );
                  },
                );
              }
              : null,
              // 체크인 버튼
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white, elevation: 1.0),
              child: Text('체크인', style: TextStyle(color: Colors.black)),
            ),
          ],
        );

      }

      return Column(
        children: [
          Row(  // 가로로 나열 됨
            children: [
              Text(title, style: TextStyle(fontSize: 12.0, color: const Color.fromARGB(255, 109, 109, 109)),),
              Text(content, style: TextStyle(fontSize: 16.0),),
            ],
          ),
          // 짝수 인덱스일 때만 구분선 추가
          if ((index == 0) || (index % 2 == 0 && index > 0 && index < 8)) const Divider(),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('체크인', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
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
            const SizedBox(height: 30),
            const Text(
              '탑승권 번호를 입력하시면 로그인 없이도',
              style: TextStyle(fontSize: 18.0),
            ),
            const Text(
              '체크인/좌석 배정이 가능합니다.',
              style: TextStyle(fontSize: 18.0),
            ),

            const SizedBox(height: 20,),
            Container(
              child: AppTextField(
                cursorColor: kTitleColor,
                textFieldType: TextFieldType.OTHER,
                decoration: kInputDecoration.copyWith(
                  labelText: '탑승권 번호',
                ),
              controller: ticketNumberController, // 컨트롤러 전달
              ),
            ),
            
            // 조회 버튼
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {
                // 조회 버튼 눌렀을 때
                setState(() {
                  ticketNumber = ticketNumberController.text; // 컨트롤러에서 값을 읽어와서 저장
                  
                  // 탑승권 상세 정보 조회
                  getTicketDetail(userProvider);

                  resultRows = generateResultRows();
                });

                // 키패드 숨기기
                FocusScope.of(context).unfocus();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white, elevation: 1.0,),
              child: Text('조회', style: TextStyle(color: Colors.black),),
            ),

            // 탑승권 정보(조회 버튼을 누른 후)
            if (resultRows.isNotEmpty)
              Column(
                children: resultRows,
              ),
          ],
        ),
      ),
    );
  }
}
