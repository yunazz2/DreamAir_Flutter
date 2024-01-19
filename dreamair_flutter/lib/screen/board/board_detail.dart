import 'package:flutter/material.dart';

class BoardDetail extends StatefulWidget {
  const BoardDetail({super.key});

  @override
  State<BoardDetail> createState() => _BoardDetailState();
}

class _BoardDetailState extends State<BoardDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("다음 화면"),
      ),
      body: Center(
        child: Text("여기는 다음 화면입니다."),
      ),
    );
  }
}