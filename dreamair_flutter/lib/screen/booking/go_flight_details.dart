import 'package:flight_booking/screen/booking/back_search_result.dart';
import 'package:flight_booking/screen/booking/provider/booking_provider.dart';
import 'package:flight_booking/screen/widgets/button_global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../booking/book_proceed.dart';
import '../widgets/constant.dart';
import 'package:flight_booking/generated/l10n.dart' as lang;

class GoFlightDetails extends StatefulWidget {
  const GoFlightDetails({Key? key}) : super(key: key);

  @override
  State<GoFlightDetails> createState() => _GoFlightDetailsState();
}

class _GoFlightDetailsState extends State<GoFlightDetails> with TickerProviderStateMixin {

  List<Map<String, String>> serviceList = [
    {
      'cabinBaggage': '5gk',
      'cancell': '10% 면제',
      'seat': '선택가능',
      'checkedBaggage': '20kg',
      'meal': '기내식 제공',
      'date': '10% 할인',
      'price': '15,000원',
      'salePrice': '10,000원',
    },
    {
      'cabinBaggage': '10gk',
      'cancell': '15% 면제',
      'seat': '선택가능',
      'checkedBaggage': '30kg',
      'meal': '기내식 제공',
      'date': '15% 할인', 
      'price': '22,000원',
      'salePrice': '15,000원' 
    },
    {
      'cabinBaggage': '15gk',
      'cancell': '20% 면제',
      'seat': '선택가능',
      'checkedBaggage': '40kg',
      'meal': '기내식 제공',
      'date': '20% 할인', 
      'price': '30,000원',
      'salePrice': '20,000원' 
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BookingProvider>(
        builder: ((context, booking, child) =>   
          SafeArea(
            child: Scaffold(
              bottomNavigationBar: Container(
                decoration: const BoxDecoration(color: Colors.white),
                child: ListTile(
                  contentPadding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  visualDensity: const VisualDensity(vertical: 2),
                  title: Text(
                    '금액',
                    style: TextStyle(color: kSubTitleColor),
                  ),
                  subtitle: Text(
                    ' ${booking.getTotalPrice} 원', 
                    style: TextStyle(color: kTitleColor, fontWeight: FontWeight.bold),
                  ),
                  trailing: SizedBox(
                    height: 80,
                    width: 200,
                    child: ButtonGlobalWithoutIcon(
                      buttontext: '예매하기',
                      buttonDecoration: kButtonDecoration.copyWith(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      onPressed: () {             
                        setState(() {
                            booking.setDiscountPrice = booking.getTotalPrice;
                            const BookProceed().launch(context);         // 예매하기 버튼
                        });
                      },       
                      buttonTextColor: kWhite,
                    ),
                  ),
                ),
              ),
              backgroundColor: kPrimaryColor,
              body: Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            children: [
                              Text(
                                '항공권 상세정보',
                                style: TextStyle(color: kTitleColor, fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    Navigator.pop(context);
                                  });
                                },
                                child: const Icon(
                                  FeatherIcons.x,
                                  color: kSubTitleColor,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30.0),
                              topLeft: Radius.circular(30.0),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: kDarkWhite,
                                spreadRadius: 2,
                                blurRadius: 7.0,
                                offset: Offset(0, -4),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Divider(height: 0, thickness: 1.0, color: kBorderColorTextField),
                              //_________________________________________________________________________Onward
                              ListView.builder(
                                itemCount: 1,
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (_, i) {
                                  return Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        Container(
                                          width: context.width(),
                                          padding: const EdgeInsets.all(20.0),
                                          decoration: BoxDecoration(
                                            color: kSecondaryColor,
                                            borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(8.0),
                                              topRight: Radius.circular(8.0),
                                            ),
                                            border: Border.all(color: kSecondaryColor),
                                          ),
                                          child: Column(
                                            children: [
                                              Text(
                                                '${booking.getDeparture} - ${booking.getDestination}',
                                                style: TextStyle(
                                                  color: kTitleColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                '직항 | ${booking.getDuration} 시간 | Economy',    // 좌석 등급 살리기
                                                style: TextStyle(color: kSubTitleColor),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          height: 0,
                                          thickness: 1.0,
                                          color: kPrimaryColor.withOpacity(0.2),
                                        ),
                                        Container(
                                          width: context.width(),
                                          padding: const EdgeInsets.all(10.0),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: const BorderRadius.only(
                                              bottomLeft: Radius.circular(8.0),
                                              bottomRight: Radius.circular(8.0),
                                            ),
                                            border: Border.all(color: kSecondaryColor),
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              ListTile(
                                                onTap: () {
                                                  setState(() {});
                                                },
                                                dense: true,
                                                horizontalTitleGap: 10,
                                                contentPadding: EdgeInsets.zero,
                                                minVerticalPadding: 0,
                                                leading: Container(
                                                  height: 34.0,
                                                  width: 34.0,
                                                  decoration: const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(image: AssetImage('images/logo.png'), fit: BoxFit.cover),    // 로고 자리
                                                  ),
                                                ),
                                                title: Text(
                                                  'Dream Air',
                                                  style: TextStyle(color: kTitleColor, fontWeight: FontWeight.bold),
                                                ),
                                                subtitle: Text(
                                                  '${booking.getDuration} 시간 in flight',
                                                  style: TextStyle(color: kSubTitleColor),
                                                ),
                                              ),
                                              const SizedBox(height: 10.0),
                                              Container(
                                                decoration: const BoxDecoration(color: Colors.transparent),
                                                child: Row(
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Stack(
                                                          alignment: Alignment.topCenter,
                                                          children: [
                                                            Container(
                                                              height: 100.0,
                                                              width: 2,
                                                              decoration: BoxDecoration(
                                                                color: kPrimaryColor.withOpacity(0.5),
                                                              ),
                                                            ),
                                                            const Padding(
                                                              padding: EdgeInsets.only(right: 1.0, bottom: 5),
                                                              child: RotatedBox(
                                                                quarterTurns: 2,
                                                                child: Icon(
                                                                  Icons.flight,
                                                                  color: kPrimaryColor,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 5.0),
                                                          child: Container(
                                                            height: 15.0,
                                                            width: 15.0,
                                                            decoration: BoxDecoration(
                                                              color: Colors.white,
                                                              shape: BoxShape.circle,
                                                              border: Border.all(color: kPrimaryColor.withOpacity(0.5), width: 3),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(width: 25.0),
                                                    Column(
                                                      mainAxisSize: MainAxisSize.min,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          '${booking.getGoDepartureTime} - ${booking.getDeparture}',
                                                          style: TextStyle(color: kTitleColor, fontWeight: FontWeight.bold),
                                                        ),
                                                        SizedBox(
                                                          width: 265,
                                                          child: Text(
                                                            '${booking.getDepartureDate} - ${booking.getDeparture} 공항 ${booking.getDepartureEng}',
                                                            maxLines: 2,
                                                            style: TextStyle(color: kSubTitleColor),
                                                            overflow: TextOverflow.ellipsis,
                                                          ),
                                                        ),
                                                        const SizedBox(height: 10.0),
                                                        Text(
                                                          '${booking.getGoDestinationTime}  -  ${booking.getDestination}',
                                                          style: TextStyle(color: kTitleColor, fontWeight: FontWeight.bold),
                                                        ),
                                                        SizedBox(
                                                          width: 265,
                                                          child: Text(
                                                            '${booking.getDepartureDate} - ${booking.getDestination} 공항 ${booking.getDestinationEng}',
                                                            maxLines: 2,
                                                            style: TextStyle(color: kSubTitleColor),
                                                            overflow: TextOverflow.ellipsis,
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(height: 20.0),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                              //_________________________________________________________________________Select_Services
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '추가 서비스 선택',
                                      style: TextStyle(color: kTitleColor, fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 10.0),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: titleList.length,
                                      physics: const NeverScrollableScrollPhysics(),
                                      padding: EdgeInsets.zero,
                                      itemBuilder: (_, i) {
                                        return Padding(
                                          padding: const EdgeInsets.only(bottom: 10.0),
                                          child: Container(
                                            decoration:
                                                BoxDecoration(borderRadius: BorderRadius.circular(8.0), color: Colors.white, border: Border.all(color: kSecondaryColor)),
                                            child: Column(
                                              children: [
                                                ListTile(
                                                  dense: true,
                                                  horizontalTitleGap: 0,
                                                  contentPadding: EdgeInsets.zero,
                                                  leading: Radio(
                                                    visualDensity: const VisualDensity(
                                                      horizontal: VisualDensity.minimumDensity,
                                                      vertical: VisualDensity.minimumDensity,
                                                    ),
                                                    value: titleList[i],
                                                    groupValue: gValue,
                                                    onChanged: (value) {

                                                      if (value.toString() == 'Saver 패키지') {
                                                        booking.setTotalPrcie = booking.getProductPrice * booking.getPasCount;
                                                        booking.setTotalPrcie = booking.getTotalPrice + (10000 * booking.getPasCount);
                                                      } else if (value.toString() == 'Flexi 패키지') {
                                                        booking.setTotalPrcie = booking.getProductPrice * booking.getPasCount;
                                                        booking.setTotalPrcie = booking.getTotalPrice + (15000 * booking.getPasCount);
                                                      } else if (value.toString() == 'Super 패키지') {
                                                        booking.setTotalPrcie = booking.getProductPrice * booking.getPasCount;
                                                        booking.setTotalPrcie = booking.getTotalPrice + (20000 * booking.getPasCount); 
                                                      }
                                                      booking.setDiscountPrice = booking.getTotalPrice;

                                                      setState(() {
                                                        gValue = value.toString();
                                                      });
                                                    },
                                                  ),
                                                  title: Row(
                                                    children: [
                                                      Text(
                                                        '제공 가능한 서비스',
                                                        style: TextStyle(
                                                          color: kTitleColor,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                      const Spacer(),
                                                      Text(
                                                        '${serviceList[i]['price']}',
                                                        style: TextStyle(color: kSubTitleColor, decoration: TextDecoration.lineThrough, fontSize: 12.0),
                                                      ),
                                                    ],
                                                  ),
                                                  subtitle: Row(
                                                    children: [
                                                      Text(
                                                        titleList[i],
                                                        style: TextStyle(
                                                          color: kSubTitleColor,
                                                        ),
                                                      ),
                                                      const Spacer(),
                                                      Text(
                                                        '${serviceList[i]['salePrice']}',
                                                        style: TextStyle(color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 16.0),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(height: 10.0),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        children: [
                                                          ListTile(
                                                            dense: true,
                                                            visualDensity: const VisualDensity(vertical: -4),
                                                            horizontalTitleGap: 0,
                                                            contentPadding: const EdgeInsets.only(left: 10.0),
                                                            leading: Container(
                                                              width: 24,
                                                              height: 24,
                                                              decoration: const BoxDecoration(
                                                                shape: BoxShape.rectangle,
                                                                image: DecorationImage(image: AssetImage('images/traveller.png'), fit: BoxFit.cover),
                                                              ),
                                                            ),
                                                            title: Text(
                                                              '기내 수화물',
                                                              style: TextStyle(
                                                                color: kTitleColor,
                                                                fontWeight: FontWeight.bold,
                                                              ),
                                                            ),
                                                            subtitle: Text(
                                                              '${serviceList[i]['cabinBaggage']}',
                                                              style: TextStyle(
                                                                color: kSubTitleColor,
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(height: 10.0),
                                                          ListTile(
                                                            dense: true,
                                                            visualDensity: const VisualDensity(vertical: -4),
                                                            horizontalTitleGap: 0,
                                                            contentPadding: const EdgeInsets.only(left: 10.0),
                                                            leading: Container(
                                                              width: 24,
                                                              height: 24,
                                                              decoration: const BoxDecoration(
                                                                shape: BoxShape.rectangle,
                                                                image: DecorationImage(image: AssetImage('images/seat.png'), fit: BoxFit.cover),
                                                              ),
                                                            ),
                                                            title: Text(
                                                              '좌석 선택',
                                                              style: TextStyle(
                                                                color: kTitleColor,
                                                                fontWeight: FontWeight.bold,
                                                              ),
                                                            ),
                                                            subtitle: Text(
                                                              '${serviceList[i]['seat']}',
                                                              style: TextStyle(
                                                                color: kSubTitleColor,
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(height: 10.0),
                                                          ListTile(
                                                            dense: true,
                                                            visualDensity: const VisualDensity(vertical: -4),
                                                            horizontalTitleGap: 0,
                                                            contentPadding: const EdgeInsets.only(left: 10.0),
                                                            leading: Container(
                                                              width: 24,
                                                              height: 24,
                                                              decoration: const BoxDecoration(
                                                                shape: BoxShape.rectangle,
                                                                image: DecorationImage(image: AssetImage('images/dollar.png'), fit: BoxFit.cover),
                                                              ),
                                                            ),
                                                            title: Text(
                                                              '취소 수수료 면제',
                                                              style: TextStyle(
                                                                color: kTitleColor,
                                                                fontWeight: FontWeight.bold,
                                                              ),
                                                            ),
                                                            subtitle: Text(
                                                              '${serviceList[i]['cancell']}',
                                                              style: TextStyle(
                                                                color: kSubTitleColor,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      height: 140,
                                                      width: 2.0,
                                                      decoration: const BoxDecoration(
                                                        color: kSecondaryColor,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        children: [
                                                          ListTile(
                                                            dense: true,
                                                            visualDensity: const VisualDensity(vertical: -4),
                                                            horizontalTitleGap: 0,
                                                            contentPadding: const EdgeInsets.only(left: 10.0),
                                                            leading: Container(
                                                              width: 24,
                                                              height: 24,
                                                              decoration: const BoxDecoration(
                                                                shape: BoxShape.rectangle,
                                                                image: DecorationImage(image: AssetImage('images/bag.png'), fit: BoxFit.cover),
                                                              ),
                                                            ),
                                                            title: Text(
                                                              '위탁 수화물',
                                                              style: TextStyle(
                                                                color: kTitleColor,
                                                                fontWeight: FontWeight.bold,
                                                              ),
                                                            ),
                                                            subtitle: Text(
                                                              '${serviceList[i]['checkedBaggage']}',
                                                              style: TextStyle(
                                                                color: kSubTitleColor,
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(height: 10.0),
                                                          ListTile(
                                                            dense: true,
                                                            visualDensity: const VisualDensity(vertical: -4),
                                                            horizontalTitleGap: 0,
                                                            contentPadding: const EdgeInsets.only(left: 10.0),
                                                            leading: Container(
                                                              width: 24,
                                                              height: 24,
                                                              decoration: const BoxDecoration(
                                                                shape: BoxShape.rectangle,
                                                                image: DecorationImage(image: AssetImage('images/meal.png'), fit: BoxFit.cover),
                                                              ),
                                                            ),
                                                            title: Text(
                                                              '기내식',
                                                              style: TextStyle(
                                                                color: kTitleColor,
                                                                fontWeight: FontWeight.bold,
                                                              ),
                                                            ),
                                                            subtitle: Text(
                                                              '${serviceList[i]['meal']}',
                                                              style: TextStyle(
                                                                color: kSubTitleColor,
                                                              ),
                                                            ),
                                                          ),
                                                          const SizedBox(height: 10.0),
                                                          ListTile(
                                                            dense: true,
                                                            visualDensity: const VisualDensity(vertical: -4),
                                                            horizontalTitleGap: 0,
                                                            contentPadding: const EdgeInsets.only(left: 10.0),
                                                            leading: Container(
                                                              width: 24,
                                                              height: 24,
                                                              decoration: const BoxDecoration(
                                                                shape: BoxShape.rectangle,
                                                                image: DecorationImage(image: AssetImage('images/watch.png'), fit: BoxFit.cover),
                                                              ),
                                                            ),
                                                            title: Text(
                                                              '일정 변경',
                                                              style: TextStyle(
                                                                color: kTitleColor,
                                                                fontWeight: FontWeight.bold,
                                                              ),
                                                            ),
                                                            subtitle: Text(
                                                              '${serviceList[i]['date']}',
                                                              style: TextStyle(
                                                                color: kSubTitleColor,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        )
      )
    );
  }
}
