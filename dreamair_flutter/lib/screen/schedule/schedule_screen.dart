import 'package:flutter/material.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
        children: const <Widget>
        [
        Card(
            child: ListTile(
              leading: FlutterLogo(size: 72.0), // 왼쪽에 이미지
              title: Text('항공편명'), // 항공편 명
              subtitle: Text('출발지/출발일자/출발시간'),
              trailing: Text('도착지/도착일자/도착시간'),
              isThreeLine: true,
              //dense: true,
            ),),
        ]
    );
  }
}