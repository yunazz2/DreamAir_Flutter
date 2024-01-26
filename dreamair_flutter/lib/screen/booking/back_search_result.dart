import 'dart:convert';

import 'package:flight_booking/screen/booking/back_flight_details.dart';
import 'package:flight_booking/screen/booking/provider/booking_provider.dart';
import 'package:flight_booking/screen/booking/go_flight_details.dart';
import 'package:flight_booking/screen/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class BackSearchResult extends StatefulWidget {
  const BackSearchResult({Key? key}) : super(key: key);

  @override
  State<BackSearchResult> createState() => _BackSearchResultState();
}

class _BackSearchResultState extends State<BackSearchResult> {

  var bookingList = [];
  late BookingProvider bookingProvider;

  // 매개변수
  String roundTrip = '';
  String departure = '';
  String destination = '';
  String departureDate = '';
  int pasCount = 0;

  @override
  void initState() {
    super.initState();

    bookingProvider = Provider.of<BookingProvider>(context, listen: false);

    roundTrip = bookingProvider.getRoundTrip;
    departure = bookingProvider.getDestination;
    destination = bookingProvider.getDeparture;
    departureDate = bookingProvider.getDepartureDate;
    pasCount = bookingProvider.getPasCount;

    getBookingList();
  }

  Future<void> getBookingList() async {
    var url = 'http://13.209.3.162/booking/comeList?roundTrip=$roundTrip&departure=$departure&destination=$destination&departureDate=$departureDate&pasCount=$pasCount' ;
    var response = await http.get(Uri.parse(url));

    var utf8Decoded = utf8.decode(response.bodyBytes);
    setState(() {
      bookingList = jsonDecode(utf8Decoded);
    });

    print('bookingProvider');
    print(bookingList);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BookingProvider>(
           builder: (context, booking, child) => 
           Scaffold(
              backgroundColor: kPrimaryColor,
              appBar: AppBar(
                titleSpacing: 0,
                elevation: 0,
                backgroundColor: kPrimaryColor,
                iconTheme: const IconThemeData(color: Colors.white),
                title: ListTile(
                  dense: true,
                  visualDensity: const VisualDensity(vertical: -2),
                  horizontalTitleGap: 00.0,
                  contentPadding: const EdgeInsets.only(right: 15.0),
                  title: Text(
                    '${booking.getDestination} - ${booking.getDeparture}',      
                    style: kTextStyle.copyWith(
                      color: kWhite,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    '${booking.getDepartureDate} | ${booking.getPasCount} 성인',    
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Container(
                  width: context.width(),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30.0),
                      topLeft: Radius.circular(30.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
                        child: Text(
                          '오는편 항공편 일정',
                          style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ListView.builder(
                          itemCount: bookingList.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.only(bottom: 15.0),
                          itemBuilder: (_, i) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.white,
                                  border: Border.all(color: kBorderColorTextField),
                                ),
                                child: Column(
                                  children: [
                                    ListTileTheme(
                                      contentPadding: const EdgeInsets.all(0),
                                      dense: true,
                                      horizontalTitleGap: 0.0,
                                      minLeadingWidth: 0,
                                      child: ListTile(
                                        dense: true,
                                        horizontalTitleGap: 10.0,
                                        contentPadding: EdgeInsets.zero,
                                        leading: Container(
                                          height: 20.0,
                                          width: 20.0,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(image: AssetImage('images/logo.png'), fit: BoxFit.cover),      // 로고 들어갈 자리
                                          ),
                                        ),
                                        title: Text(
                                          'Dream Air',
                                          style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                        ),
                                        trailing: Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  '${bookingList[i]['productPrice'] * 2} 원',   
                                                  style: kTextStyle.copyWith(color: kSubTitleColor, decoration: TextDecoration.lineThrough, fontSize: 12.0),
                                                ),
                                                const SizedBox(width: 5.0),
                                                Text(
                                                  '%50',    
                                                  style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              '${bookingList[i]['productPrice']} 원',   // 최종가격
                                              style: kTextStyle.copyWith(color: Colors.red, fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const Divider(
                                      thickness: 1.0,
                                      height: 1,
                                      color: kBorderColorTextField,
                                    ),
                                    const SizedBox(height: 10.0),
                                    Material(
                                      elevation: 1.0,
                                      shadowColor: kDarkWhite,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                        side: const BorderSide(color: kBorderColorTextField),
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          // 선택한 항공권 데이터를 provider에 넣기
                                          booking.setProductNoDes = bookingList[i]['productNo'];
                                          booking.setRouteNoDes = bookingList[i]['routeNo'];
                                          booking.setBackDepartureTime = bookingList[i]['departureTime'];
                                          booking.setBackDestinationTime = bookingList[i]['destinationTime'];
                                          booking.setTotalPrcie = bookingList[i]['productPrice'] * booking.getPasCount * 2;
                                          booking.setProductPrice = bookingList[i]['productPrice'];
                                          print(booking.getTotalPrice);

                                          const BackFlightDetails().launch(context);       // 버튼
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(5.0),
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
                                          child: Column(
                                            children: [
                                              ListTile(
                                                dense: true,
                                                horizontalTitleGap: 10.0,
                                                contentPadding: EdgeInsets.zero,
                                                title: Text(
                                                  '  ${bookingList[i]['flightName']}',
                                                  style: TextStyle(color: kTitleColor, fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  Column(
                                                    children: [
                                                      Text(
                                                        '${bookingList[i]['departureTime']}',
                                                        style: TextStyle(color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 12),
                                                      ),
                                                      Text(
                                                        '${bookingList[i]['departure']}',
                                                        style: TextStyle(color: kSubTitleColor, fontSize: 12),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(width: 5.0),
                                                  Column(
                                                    children: [
                                                      Text(
                                                        '${bookingList[i]['duration']}시간',
                                                        style: TextStyle(color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 12),
                                                      ),
                                                      const SizedBox(height: 2.0),
                                                      Row(
                                                        children: [
                                                          Container(
                                                            height: 10.0,
                                                            width: 10.0,
                                                            decoration: const BoxDecoration(color: kPrimaryColor, shape: BoxShape.circle),
                                                          ),
                                                          Stack(
                                                            alignment: Alignment.center,
                                                            children: [
                                                              Container(
                                                                height: 2.0,
                                                                width: 100,
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
                                                                  Icons.flight_takeoff_outlined,  
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
                                                      const SizedBox(height: 2.0),
                                                      Text(
                                                        '직항',
                                                        style: TextStyle(color: kSubTitleColor, fontSize: 12),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(width: 5.0),
                                                  Column(
                                                    children: [
                                                      Text(
                                                        '${bookingList[i]['destinationTime']}',
                                                        style: TextStyle(color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 12),
                                                      ),
                                                      Text(
                                                        '${bookingList[i]['destination']}',
                                                        style: TextStyle(color: kSubTitleColor, fontSize: 12),
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(width: 5.0),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 10.0),
                                    const SizedBox(height: 10.0),
                                    Container(
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.0), color: const Color(0xFFFFF5D5)),
                                      child: Row(
                                        children: [
                                          Icon(
                                            MdiIcons.circleMedium,
                                            color: const Color(0xFFFFB33E),
                                          ),
                                          Flexible(
                                            child: Text(
                                              '출발시간과 도착시간을 확인하세요.',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(color: kTitleColor, fontSize: 12.0),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          })
                    ],
                  ),
                ),
              ),
            )
    );
  }
}
