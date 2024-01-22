// 출도착 페이지
import 'dart:convert';

import 'package:flight_booking/generated/l10n.dart' as lang;
import 'package:flight_booking/screen/schedule/schedule.dart';
import 'package:flight_booking/screen/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {

  // 출도착 조회 아이템
  List<Schedule> _scheduleList = [];

  @override
  void initState() {
    super.initState();

    getScheduleList().then((result) {
      setState(() {
        _scheduleList = result;
      });
    });
  }

  Future<List<Schedule>> getScheduleList() async {
    // 서버로 요청
    var url = 'http://10.0.2.2:9090/user/productFlightList';
    // http.get(url, header)
    // http.get(Uri.parse(url))
    var response = await http.get(Uri.parse(url));
    // response : [ { "title" : '제목' }, { "writer" : '작성자' }, { "content" : '내용' }, ... ]

    print('response.body : ');
    print(response.body);

    print('scheduleList : ');
    // UTF-8 디코딩
    var utf8Decoded = utf8.decode(response.bodyBytes);

    var scheduleList = jsonDecode(utf8Decoded);
    List<Schedule> result = [];

    for (var i = 0; i < scheduleList.length; i++) {
      result.add(Schedule(
          flightNo: scheduleList[i]['flightNo'],
          flightName: scheduleList[i]['flightName'],
          routeNo: scheduleList[i]['routeNo'],
          departure: scheduleList[i]['departure'],
          departureDate: scheduleList[i]['departureDate'],
          departureTime: scheduleList[i]['departureTime'],
          destination: scheduleList[i]['destination'],
          destinationDate: scheduleList[i]['destinationDate'],
          destinationTime: scheduleList[i]['destinationTime'],
          ));
    }

    print(result);
    return result;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        titleSpacing: 0,
        elevation: 0,
        backgroundColor: kPrimaryColor,
        iconTheme: const IconThemeData(color: kWhite),
        centerTitle: true,
        title: Text(
          lang.S.of(context).ScheduleTitle,
          style: kTextStyle.copyWith(
            color: kWhite,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        primary: false,
        physics: const BouncingScrollPhysics(),
        child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: 700),
            child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10.0),
          decoration: const BoxDecoration(
            color: kWhite,
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
  physics: NeverScrollableScrollPhysics(),
  itemCount: _scheduleList.length,
  itemBuilder: (context, index) {
    Schedule schedule = _scheduleList[index];

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
            Text(
              schedule.flightName ?? '항공편명',
              style: const TextStyle(fontSize: 16),
            ),
            const Divider(
              thickness: 1.0,
              color: kBorderColorTextField,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('images/logo3.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 40),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '${schedule.departure}',
                      style: kTextStyle.copyWith(color: kTitleColor, fontSize: 18), 
                    ),
                    const SizedBox(height: 5, width: 50,),
                    const Icon(
                      Icons.swap_horiz,
                      color: kLightNeutralColor,
                    ),
                    const SizedBox(height: 5, width: 60,),
                    Text(
                      '${schedule.destination}',
                      style: kTextStyle.copyWith(color: kTitleColor, fontSize: 18),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '${schedule.departureDate} ${schedule.departureTime}',
                  style: kTextStyle.copyWith(color: kTitleColor, fontSize: 14),
                ),
                Text(
                  '${schedule.destinationDate} ${schedule.destinationTime}',
                  style: kTextStyle.copyWith(color: kTitleColor, fontSize: 14),
                ),
              ],
            ),
            const SizedBox(height: 3.0),
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
      ),
    );
  }
}
