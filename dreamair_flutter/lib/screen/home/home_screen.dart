// 항공권 예약 페이지
import 'package:flight_booking/generated/l10n.dart' as lang;
import 'package:flight_booking/screen/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:nb_utils/nb_utils.dart';

import '../search/search.dart';
import '../search/search_result.dart';
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
  int childCount = 0;
  int infantCount = 0;
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

  String departureDateTitle = '출발 날짜';
  String returnDateTitle = '돌아오는 날짜';

  DateTime selectedDate = DateTime.now();

  // 단일 날짜 선택
  // Future<void> _selectDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: selectedDate,
  //     lastDate: DateTime(2101),
  //   );
  //   if (picked != null && picked != selectedDate) {
  //     setState(() {
  //       selectedDate = picked;
  //       departureDateTitle = selectedDate.toString().substring(0, 10);
  //     });
  //   }
  // }

  // 편도 날짜 선택

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
        print(departureDateTitle);


        returnDateTitle = _selectedDateRange.toString().substring(26, 36);    // 돌아오는편 날짜
        parts = returnDateTitle.split("-");
        returnDateTitle = parts[0] + "/" + parts[1] + "/" + parts[2];
        print(returnDateTitle);

        var resultDate = departureDateTitle + " ~ " + returnDateTitle;
        print(resultDate);

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        initialIndex: 1,
        length: 2,
        child: Scaffold(
          backgroundColor: kDarkWhite,
          body: Stack(
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
                              leading: Container(
                                height: 44,
                                width: 44,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage('images/profile1.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              // 메인 화면 왼쪽 위
                              title: Row(
                                children: [
                                  Text('안녕하세요!', style: TextStyle(color: Colors.white, fontSize: 16.0),),
                                ],
                              ),
                              // 메인 화면 프로필
                              trailing: GestureDetector(
                                onTap: () {
                                  print('클릭!');
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(5.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Colors.white),
                                  ),
                                  child: const Icon(Icons.person, color: Colors.white),
                                ),
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
                                                  onTap: ()=>const Search().launch(context),
                                                  title: Text(
                                                    '(GMP)',
                                                    style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                                  ),
                                                  subtitle: Text(
                                                    '김포',
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: kTextStyle.copyWith(color: kSubTitleColor),
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
                                                  onTap: ()=>const Search().launch(context),
                                                  title: Text(
                                                    '(GMP)',
                                                    style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                                  ),
                                                  subtitle: Text(
                                                    '김포',
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: kTextStyle.copyWith(color: kSubTitleColor),
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
                                            color: kWhite,
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
                                  // visible(selectedIndex == 0) 일때 싱글데이터 피커사용하기 
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
                                            // _selectDate(context);  
                                            _showDepartureDate();   // 단일 날짜선택 불러오기;
                                          });
                                        },
                                        child: const Icon(
                                          IconlyLight.calendar,
                                          color: kSubTitleColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20.0).visible(selectedIndex == 1),
                                  // 왕복날짜 2개 만들기
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
                                            // isReturn == true;
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
                                      hintText: '$adultCount 성인',
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
                                                                    childCount = childCount;
                                                                    // adultCount = adultCount;
                                                                    // infantCount = infantCount;
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
        ),
      ),
    );
  }
}
