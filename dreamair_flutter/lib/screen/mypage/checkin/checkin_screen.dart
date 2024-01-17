import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../widgets/constant.dart';

class CheckInScreen extends StatefulWidget {
  const CheckInScreen({Key? key}) : super(key: key);

  @override
  State<CheckInScreen> createState() => _CheckInScreenState();
}

class _CheckInScreenState extends State<CheckInScreen> {

  List<Widget> resultRows = [];
  String ticketNumber = '';                                               // 탑승권 번호를 저장할 변수
  TextEditingController ticketNumberController = TextEditingController(); // 탑승권 번호를 넘겨줄 컨트롤러
  
  String departure = '김포';
  String destination = '제주';
  String departureDate = '2024/01/25';
  String selectedSeatNo = 'A1';

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
              onPressed: () {
                // '체크인' 버튼이 눌렸을 때 처리 로직 추가
              },
              child: Text('체크인'),
            ),
          ],
        );
      }

      return Column(
        children: [
          Row(  // 가로로 나열 됨
            children: [
              Text(title, style: TextStyle(fontSize: 15.0, color: const Color.fromARGB(255, 109, 109, 109)),),
              Text(content, style: TextStyle(fontSize: 20.0),),
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
                  resultRows = generateResultRows();
                });

                // 키패드 숨기기
                FocusScope.of(context).unfocus();
              },
              child: Text('조회'),
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
