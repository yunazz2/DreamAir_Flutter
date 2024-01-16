import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../widgets/constant.dart';

class CheckInScreen extends StatefulWidget {
  const CheckInScreen({Key? key}) : super(key: key);

  @override
  State<CheckInScreen> createState() => _CheckInScreenState();
}

class _CheckInScreenState extends State<CheckInScreen> {
  bool check = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          '체크인',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
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
            Text(
              '탑승권 번호를 입력하시면 로그인 없이도',
              style: TextStyle(fontSize: 18.0),
            ),
            Text(
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
              ),
            ),
            // 조회 버튼
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {},
              child: Text('조회'),
            ),
          ],
        ),
      ),
    );
  }
}
