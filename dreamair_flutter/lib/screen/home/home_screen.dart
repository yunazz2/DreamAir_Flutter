// 항공권 예약 페이지
import 'package:flight_booking/generated/l10n.dart' as lang;
import 'package:flight_booking/screen/booking/backSearch.dart';
import 'package:flight_booking/screen/booking/provider/booking_provider.dart';
import 'package:flight_booking/screen/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../booking/goSearch.dart';
// import '../booking/backSearch.dart';
import '../booking/search_result.dart';
import '../widgets/button_global.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  List<Widget> flights = [];

  int adultCount = 1;
  int flightNumber = 0;
  bool showCounter = false;

  List<String> classList = [
    'Economy',
    'Business',
  ];
  String selectedClass = 'Economy';

  DropdownButton<String> getClass() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String des in classList) {
      var item = DropdownMenuItem(
        value: des,
        child: Text(des),
      );
      dropDownItems.add(item);
    }
    return DropdownButton(
      icon: const Icon(
        IconlyLight.arrowDown2,
        color: kSubTitleColor,
      ),
      items: dropDownItems,
      value: selectedClass,
      onChanged: (value) {
        setState(() {
          selectedClass = value!;
        });
      },
    );
  }

  DateTimeRange? _selectedDateRange;

  String singleDepDate = '출발 날짜';
  String departureDateTitle = '출발 날짜';
  String returnDateTitle = '돌아오는 날짜';

  DateTime selectedDate = DateTime.now();

  // 편도 날짜 선택
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      locale: Locale('ko'),
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        singleDepDate = selectedDate.toString().substring(0, 10);
        var parts = singleDepDate.split("-");
        singleDepDate = parts[0] + "/" + parts[1] + "/" + parts[2];
      });
    }
  }

  // 왕복 날짜 선택
  void _showDepartureDate() async {
    final DateTimeRange? result = await showDateRangePicker(
      context: context,
      locale: Locale('ko'),
      firstDate: selectedDate,
      lastDate: DateTime(2030, 12, 31),
      currentDate: DateTime.now(),
      saveText: '선택완료',
    );
    if (result != null && result != _selectedDateRange) {
      setState(() {
        _selectedDateRange = result;

        departureDateTitle = _selectedDateRange.toString().substring(0, 10);    // 가는편 날짜
        var parts = departureDateTitle.split("-");
        departureDateTitle = parts[0] + "/" + parts[1] + "/" + parts[2];

        returnDateTitle = _selectedDateRange.toString().substring(26, 36);    // 돌아오는편 날짜
        parts = returnDateTitle.split("-");
        returnDateTitle = parts[0] + "/" + parts[1] + "/" + parts[2];

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          backgroundColor: kDarkWhite,
          body: Consumer<BookingProvider>(
                builder: (context, booking, child) =>  
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Column(
                      children: [
                        Stack(
                          alignment: Alignment.topLeft,
                          children: [
                            Container(
                              height: 260,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(30.0),
                                  bottomLeft: Radius.circular(30.0),
                                ),
                                image: DecorationImage(image: AssetImage('images/bg.png'), fit: BoxFit.cover),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    // 메인 화면 왼쪽 위
                                    title: Row(
                                      children: [
                                        Text('안녕하세요!', style: TextStyle(color: Colors.white, fontSize: 16.0),),
                                      ],
                                    ),
                                  ),
                                  // 메인 화면 Dream Air 문구
                                  const SizedBox(height: 30),
                                  Text('Dream Air',  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30.0),),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 200, left: 15.0, right: 15),
                            child: Material(
                              borderRadius: BorderRadius.circular(30.0),
                              elevation: 2,
                              shadowColor: kDarkWhite,
                              child: Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  color: kWhite,
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30.0),
                                        color: const Color(0xFFEDF0FF),
                                      ),
                                      child: TabBar(
                                        labelStyle: kTextStyle.copyWith(color: Colors.white),
                                        unselectedLabelColor: kSubTitleColor,
                                        indicatorColor: kPrimaryColor,
                                        labelColor: Colors.white,
                                        indicator: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30.0),
                                          color: kPrimaryColor,
                                        ),
                                        onTap: (index) {
                                          if (index == 0) {
                                            booking.setRoundTrip = '편도';
                                          } else if(index == 1) {
                                            booking.setRoundTrip = '왕복 가는편';
                                          }
                                          setState(() {
                                            selectedIndex = index;
                                          });
                                        },
                                        tabs: [
                                          Tab(
                                            text: '편도',
                                          ),
                                          Tab(
                                            text: '왕복',
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 20.0),
                                    Column(
                                      children: [
                                        Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: SizedBox(
                                                    height: 90,
                                                    child: InputDecorator(
                                                      decoration: kInputDecoration.copyWith(
                                                        contentPadding: const EdgeInsets.only(left: 10.0),
                                                        labelText: '출발지',
                                                        labelStyle: kTextStyle.copyWith(color: kTitleColor),
                                                        floatingLabelBehavior: FloatingLabelBehavior.always,
                                                        border: OutlineInputBorder(
                                                          borderRadius: BorderRadius.circular(8.0),
                                                        ),
                                                      ),
                                                      child: ListTile(
                                                        onTap: ()=>const goSearch().launch(context),    // 가는편 목적지 선택
                                                        title: Text(
                                                          '${booking.getDepartureEng}',    
                                                          style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                                        ),
                                                        subtitle: Text(
                                                          '${booking.getDeparture}',     
                                                          maxLines: 1,
                                                          overflow: TextOverflow.ellipsis,
                                                          style: TextStyle(color: kSubTitleColor),
                                                        ),
                                                        horizontalTitleGap: 0,
                                                        contentPadding: const EdgeInsets.only(left: 5.0),
                                                        minVerticalPadding: 0.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                Expanded(
                                                  child: SizedBox(
                                                    height: 90,
                                                    child: InputDecorator(
                                                      decoration: kInputDecoration.copyWith(
                                                        contentPadding: const EdgeInsets.only(left: 10.0),
                                                        labelText: '도착지',
                                                        labelStyle: kTextStyle.copyWith(color: kTitleColor),
                                                        floatingLabelBehavior: FloatingLabelBehavior.always,
                                                        border: OutlineInputBorder(
                                                          borderRadius: BorderRadius.circular(8.0),
                                                        ),
                                                      ),
                                                      child: ListTile(
                                                        onTap: ()=>const backSearch().launch(context),    // 오는편 목적지 선택
                                                        title: Text(
                                                          '${booking.getDestinationEng}',
                                                          style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                                        ),
                                                        subtitle: Text(
                                                          '${booking.getDestination}',
                                                          maxLines: 1,
                                                          overflow: TextOverflow.ellipsis,
                                                          style: TextStyle(color: kSubTitleColor),
                                                        ),
                                                        horizontalTitleGap: 0,
                                                        contentPadding: const EdgeInsets.only(left: 5.0),
                                                        minVerticalPadding: 0.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(bottom: 20.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white,
                                                  border: Border.all(
                                                    color: kPrimaryColor.withOpacity(0.3),
                                                  ),
                                                ),
                                                child: const Icon(
                                                  Icons.swap_horiz_outlined,
                                                  color: kPrimaryColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        // 편도 날짜
                                        TextFormField(
                                          readOnly: true,
                                          keyboardType: TextInputType.name,
                                          cursorColor: kTitleColor,
                                          showCursor: false,
                                          textInputAction: TextInputAction.next,
                                          decoration: kInputDecoration.copyWith(
                                            labelText: '날짜',
                                            labelStyle: kTextStyle.copyWith(color: kTitleColor),
                                            hintText: singleDepDate,
                                            hintStyle: kTextStyle.copyWith(color: kTitleColor),
                                            focusColor: kTitleColor,
                                            border: const OutlineInputBorder(),
                                            floatingLabelBehavior: FloatingLabelBehavior.always,
                                            suffixIcon: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  _selectDate(context);  
                                                  booking.setDeprtureDate = singleDepDate;
                                                  print(booking.getDepartureDate);
                                                });
                                              },
                                              child: const Icon(
                                                IconlyLight.calendar,
                                                color: kSubTitleColor,
                                              ),
                                            ),
                                          ),
                                        ).visible(selectedIndex == 0),
                                        const SizedBox(height: 20.0).visible(selectedIndex == 1),
                                        // 왕복 날짜 
                                        TextFormField(
                                          readOnly: true,
                                          keyboardType: TextInputType.name,
                                          cursorColor: kTitleColor,
                                          showCursor: false,
                                          textInputAction: TextInputAction.next,
                                          decoration: kInputDecoration.copyWith(
                                            labelText: '날짜',
                                            labelStyle: kTextStyle.copyWith(color: kTitleColor),
                                            hintText: departureDateTitle,
                                            hintStyle: kTextStyle.copyWith(color: kTitleColor),
                                            focusColor: kTitleColor,
                                            border: const OutlineInputBorder(),
                                            floatingLabelBehavior: FloatingLabelBehavior.always,
                                            suffixIcon: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  _showDepartureDate();
                                                  booking.setDeprtureDate = departureDateTitle + ' ~ ' + returnDateTitle;
                                                  print(booking.getDepartureDate);
                                                });
                                              },
                                              child: const Icon(
                                                IconlyLight.calendar,
                                                color: kSubTitleColor,
                                              ),
                                            ),
                                          ),
                                        ).visible(selectedIndex == 1),
                                        const SizedBox(height: 20.0),
                                        TextFormField(
                                          readOnly: true,
                                          keyboardType: TextInputType.name,
                                          cursorColor: kTitleColor,
                                          showCursor: false,
                                          textInputAction: TextInputAction.next,
                                          decoration: kInputDecoration.copyWith(
                                            labelText: '날짜',
                                            labelStyle: kTextStyle.copyWith(color: kTitleColor),
                                            hintText: returnDateTitle,
                                            hintStyle: kTextStyle.copyWith(color: kTitleColor),
                                            focusColor: kTitleColor,
                                            border: const OutlineInputBorder(),
                                            floatingLabelBehavior: FloatingLabelBehavior.always,
                                            suffixIcon: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  _showDepartureDate();
                                                  booking.setDeprtureDate = departureDateTitle + ' ~ ' + returnDateTitle;
                                                  print(booking.getDepartureDate);
                                                });
                                              },
                                              child: const Icon(
                                                IconlyLight.calendar,
                                                color: kSubTitleColor,
                                              ),
                                            ),
                                          ),
                                        ).visible(selectedIndex == 1),
                                        const SizedBox(height: 20.0),
                                        TextFormField(
                                          readOnly: true,
                                          keyboardType: TextInputType.name,
                                          cursorColor: kTitleColor,
                                          showCursor: false,
                                          textInputAction: TextInputAction.next,
                                          decoration: kInputDecoration.copyWith(
                                            labelText: '탑승객 인원',
                                            labelStyle: kTextStyle.copyWith(color: kTitleColor),
                                            hintText: '$adultCount 성인',     // 데이터
                                            hintStyle: kTextStyle.copyWith(color: kSubTitleColor),
                                            border: const OutlineInputBorder(),
                                            floatingLabelBehavior: FloatingLabelBehavior.always,
                                            suffixIcon: GestureDetector(
                                              onTap: (() => showModalBottomSheet(
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(30.0),
                                                    ),
                                                    context: context,
                                                    builder: (BuildContext context) {
                                                      return StatefulBuilder(builder: (BuildContext context, setStated) {
                                                        return Column(
                                                          mainAxisSize: MainAxisSize.min,
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Padding(
                                                              padding: const EdgeInsets.all(20.0),
                                                              child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Text(
                                                                        '탑승객 인원',
                                                                        style: kTextStyle.copyWith(
                                                                          color: kTitleColor,
                                                                          fontSize: 18.0,
                                                                          fontWeight: FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                      const Spacer(),
                                                                      const Icon(FeatherIcons.x, size: 18.0, color: kTitleColor).onTap(
                                                                        () => finish(context),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Text(
                                                                    '탑승객 인원을 선택해주세요.',
                                                                    style: kTextStyle.copyWith(color: kSubTitleColor),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            Container(
                                                              padding: const EdgeInsets.all(20.0),
                                                              decoration: const BoxDecoration(
                                                                borderRadius: BorderRadius.only(
                                                                  topRight: Radius.circular(30.0),
                                                                  topLeft: Radius.circular(30.0),
                                                                ),
                                                                color: kWhite,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    color: kDarkWhite,
                                                                    spreadRadius: 5.0,
                                                                    blurRadius: 7.0,
                                                                    offset: Offset(0, -5),
                                                                  ),
                                                                ],
                                                              ),
                                                              child: Column(
                                                                children: [
                                                                  Row(
                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                    children: [
                                                                      Column(
                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            '성인',
                                                                            style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      const Spacer(),
                                                                      Container(
                                                                        padding: const EdgeInsets.all(
                                                                          5.0,
                                                                        ),
                                                                        decoration: BoxDecoration(
                                                                          shape: BoxShape.circle,
                                                                          color: adultCount == 1 ? kPrimaryColor.withOpacity(0.2) : kPrimaryColor,
                                                                        ),
                                                                        child: const Icon(
                                                                          FeatherIcons.minus,
                                                                          color: Colors.white,
                                                                          size: 14.0,
                                                                        ).onTap(() {
                                                                          setStated(() {
                                                                            adultCount > 1 ? adultCount-- : adultCount = 1;
                                                                          });
                                                                        }),
                                                                      ),
                                                                      const SizedBox(width: 10.0),
                                                                      Text(
                                                                        adultCount.toString(),
                                                                      ),
                                                                      const SizedBox(width: 10.0),
                                                                      Container(
                                                                        padding: const EdgeInsets.all(
                                                                          5.0,
                                                                        ),
                                                                        decoration: const BoxDecoration(
                                                                          shape: BoxShape.circle,
                                                                          color: kPrimaryColor,
                                                                        ),
                                                                        child: const Icon(
                                                                          FeatherIcons.plus,
                                                                          color: Colors.white,
                                                                          size: 14.0,
                                                                        ).onTap(() {
                                                                          setStated(() {
                                                                            adultCount++;
                                                                          });
                                                                        }),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  const Divider(
                                                                    thickness: 1.0,
                                                                    color: kBorderColorTextField,
                                                                  ),
                                                                  const SizedBox(
                                                                    height: 20.0,
                                                                  ),
                                                                  ButtonGlobal(
                                                                      buttontext: '선택 완료',
                                                                      buttonDecoration: kButtonDecoration.copyWith(color: kPrimaryColor),
                                                                      onPressed: () {
                                                                        setState(() {
                                                                          finish(context);
                                                                          adultCount = adultCount;
                                                                          booking.setPasCount = adultCount;
                                                                        });
                                                                      }),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      });
                                                    },
                                                  )),
                                              child: const Icon(
                                                IconlyLight.arrowDown2,
                                                color: kSubTitleColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 10.0),
                                        ButtonGlobalWithoutIcon(
                                          buttontext: '항공권 조회',
                                          buttonDecoration: kButtonDecoration.copyWith(
                                            color: kPrimaryColor,
                                            borderRadius: BorderRadius.circular(30.0),
                                          ),
                                          onPressed: () {
                                            const SearchResult().launch(context);
                                          },
                                          buttonTextColor: kWhite,
                                        )
                                      ],
                                    ).visible(selectedIndex != 2),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
            ),
          )
        ),
      ),
    );
  }
}
