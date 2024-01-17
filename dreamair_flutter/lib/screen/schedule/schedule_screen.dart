// 출도착 페이지
import 'package:flight_booking/generated/l10n.dart' as lang;
import 'package:flight_booking/screen/widgets/constant.dart';
import 'package:flutter/material.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {

  // 출도착 조회 아이템
  List<String> scheduleItem = [];


  // final ScrollController _controller = ScrollController();

  // @override
  // void initState() {
  //   super.initState();

  //   // 처음 데이터
  //   fetch();
    
  //   // 다음 페이지 (스크롤)
  //   _controller.addListener(() { 
  //     // 스크롤 맨 밑
  //     // _controller.position.maxScrollExtent : 스크롤 위치의 최댓값
  //     // _controller.position.offset          : 현재 스크롤 위치
  //     print('현재 스크롤 : ${_controller.offset}');
      
  //     if(_controller.position.maxScrollExtent < _controller.offset + 50) {
  //       // 데이터 요청 (다음 페이지)
  //       fetch();
  //     }
      // });
    // }

  //   Future fetch() async {
  //   print('fetch...');
  //   // http 
  //   // 1. URL 인코딩
  //   // 2. GET 방식 요청
  //   // final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');

  //   final url = Uri.parse('http://10.0.2.2:9090/user/productFlightList');
    
  //   final response = await http.get(url);

  //   if( response.statusCode == 200 ) {
  //     setState(() {
  //       // items.addAll(['New']);
  //         scheduleItem.clear();
  //       // JSON 문자열 ➡ List<>
  //       var utf8Decoded = utf8.decode( response.bodyBytes );
  //       var result = json.decode(utf8Decoded);
  //       final List list = result['list'];

  //       scheduleItem.addAll( list.map<String>((item) {

  //       final flightNo = int.parse(item['flightNo'].toString());
  //       final flightName = item['flightName'] as String;
  //       final routeNo = int.parse(item['routeNo'].toString());
  //       final departure = item['departure'] as String;
  //       final departureDate = item['departureDate'] as String;
  //       final departureTime = item['departureTime'] as String;
  //       final destination = item['destination'] as String;
  //       final destinationDate = item['destinationDate'] as String;
  //       final destinationTime = item['destinationTime'] as String;
  //         return 'Item $flightNo - $flightName - $routeNo - $departure - $departureDate - $departureTime - $destination - $destinationDate - $destinationTime';
  //       }));
  //     });
  //   }

  // }

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
                // controller: _controller,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                // itemCount: scheduleItem.length, 
                itemCount: 5,
                itemBuilder: (_, i) {
                  // final item = scheduleItem[i];
                  return Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: kBorderColorTextField,
                          )),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "항공편명", // 항공편명
                            style: TextStyle(fontSize: 12),
                          ),
                          const Divider(
                            thickness: 1.0,
                            color: kBorderColorTextField,
                          ),
                          ListTile(
                              horizontalTitleGap: 5.0,
                              contentPadding: EdgeInsets.zero,
                              minLeadingWidth: 0,
                              leading: Container(
                                height: 40.0,
                                width: 40.0,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'images/logo3.png'), // 항공편 이미지
                                      fit: BoxFit.cover),
                                ),
                              ),
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '출발지',
                                    style:
                                        kTextStyle.copyWith(color: kTitleColor),
                                  ),
                                  const SizedBox(width: 30),
                                  const Icon(
                                    Icons.swap_horiz,
                                    color: kLightNeutralColor,
                                  ),
                                  const SizedBox(width: 30),
                                  Text(
                                    '도착지',
                                    style:
                                        kTextStyle.copyWith(color: kTitleColor),
                                  )
                                ],
                              ),
                              // 일자/시간
                              subtitle: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '출발일자/시간',
                                    style: kTextStyle.copyWith(
                                        color: kTitleColor, fontSize: 14),
                                  ),
                                  const SizedBox(width: 80),
                                  Text(
                                    '도착일자/시간',
                                    style: kTextStyle.copyWith(
                                        color: kTitleColor, fontSize: 14),
                                  )
                                ],
                              )),
                          const SizedBox(
                            height: 3.0,
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
      ),
    );
  }
}
