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
    tabController = TabController(length: 3, vsync: this);
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

  String departureDateTitle = 'Departure Date';
  String returnDateTitle = 'Return Date';

  DateTime selectedDate = DateTime.now();

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

  void _showDepartureDate() async {
    final DateTimeRange? result = await showDateRangePicker(
      context: context,
      firstDate: selectedDate,
      lastDate: DateTime(2030, 12, 31),
      currentDate: DateTime.now(),
      saveText: 'Done',
    );
    if (result != null && result != _selectedDateRange) {
      setState(() {
        _selectedDateRange = result;
        returnDateTitle = _selectedDateRange.toString().substring(26, 36);

        departureDateTitle = _selectedDateRange.toString().substring(0, 10);
      });
    }
  }

  // void _showReturnDate() async {
  //   final DateTimeRange? result = await showDateRangePicker(
  //     context: context,
  //     firstDate: selectedDate,
  //     lastDate: DateTime(2030, 12, 31),
  //     currentDate: DateTime.now(),
  //     saveText: 'Done',
  //   );
  //   if (result != null && result != _selectedDateRange) {
  //     setState(
  //       () {
  //         _selectedDateRange = result;
  //         returnDateTitle = _selectedDateRange.toString().substring(26, 36);
  //       },
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        initialIndex: 1,
        length: 3,
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
                              title: Row(
                                children: [
                                  Text(
                                    lang.S.of(context).hello,
                                    style: kTextStyle.copyWith(color: kWhite, fontSize: 14),
                                  ),
                                ],
                              ),
                              subtitle: Text(
                                'Shaidul Islam',
                                style: kTextStyle.copyWith(color: kWhite, fontWeight: FontWeight.bold),
                              ),
                              trailing: Container(
                                padding: const EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.transparent,
                                  border: Border.all(color: kWhite),
                                ),
                                child: const Icon(
                                  FeatherIcons.bell,
                                  color: kWhite,
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            Text(
                              lang.S.of(context).bookFlightTitle,
                              style: kTextStyle.copyWith(color: kWhite, fontWeight: FontWeight.bold, fontSize: 25.0),
                            ),
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
                                      text: lang.S.of(context).tab1,
                                    ),
                                    Tab(
                                      text: lang.S.of(context).tab2,
                                    ),
                                    Tab(
                                      text: lang.S.of(context).tab3,
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
                                                  labelText: lang.S.of(context).fromTitle,
                                                  labelStyle: kTextStyle.copyWith(color: kTitleColor),
                                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(8.0),
                                                  ),
                                                ),
                                                child: ListTile(
                                                  onTap: ()=>const Search().launch(context),
                                                  title: Text(
                                                    '(DAC)',
                                                    style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                                  ),
                                                  subtitle: Text(
                                                    'Dhaka, Bangladesh',
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
                                                  labelText: lang.S.of(context).toTitle,
                                                  labelStyle: kTextStyle.copyWith(color: kTitleColor),
                                                  floatingLabelBehavior: FloatingLabelBehavior.always,
                                                  border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(8.0),
                                                  ),
                                                ),
                                                child: ListTile(
                                                  onTap: ()=>const Search().launch(context),
                                                  title: Text(
                                                    '(NYC)',
                                                    style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                                  ),
                                                  subtitle: Text(
                                                    'New Your, United State',
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
                                  TextFormField(
                                    readOnly: true,
                                    keyboardType: TextInputType.name,
                                    cursorColor: kTitleColor,
                                    showCursor: false,
                                    textInputAction: TextInputAction.next,
                                    decoration: kInputDecoration.copyWith(
                                      labelText: lang.S.of(context).dateTitle,
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
                                  TextFormField(
                                    readOnly: true,
                                    keyboardType: TextInputType.name,
                                    cursorColor: kTitleColor,
                                    showCursor: false,
                                    textInputAction: TextInputAction.next,
                                    decoration: kInputDecoration.copyWith(
                                      labelText: lang.S.of(context).returnDate,
                                      labelStyle: kTextStyle.copyWith(color: kTitleColor),
                                      hintText: returnDateTitle,
                                      hintStyle: kTextStyle.copyWith(color: kTitleColor),
                                      focusColor: kTitleColor,
                                      border: const OutlineInputBorder(),
                                      floatingLabelBehavior: FloatingLabelBehavior.always,
                                      suffixIcon: GestureDetector(
                                        // onTap: () {
                                        //   setState(() {
                                        //     _showDepartureDate();
                                        //     isReturn == true;
                                        //   });
                                        // },
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
                                      labelText: lang.S.of(context).travellerTitle,
                                      labelStyle: kTextStyle.copyWith(color: kTitleColor),
                                      hintText: '$adultCount Adult,$childCount child,$infantCount Infants',
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
                                                                  lang.S.of(context).travellerTitle,
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
                                                              'Dhaka to New York, Thu 6 Jan 2023',
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
                                                                      lang.S.of(context).adults,
                                                                      style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                                                    ),
                                                                    Text(
                                                                      '12+ years',
                                                                      style: kTextStyle.copyWith(color: kSubTitleColor),
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
                                                            const SizedBox(height: 15.0),
                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: [
                                                                Column(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    Text(
                                                                      lang.S.of(context).child,
                                                                      style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                                                    ),
                                                                    Text(
                                                                      '2-12 years',
                                                                      style: kTextStyle.copyWith(color: kSubTitleColor),
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
                                                                    color: childCount == 0 ? kPrimaryColor.withOpacity(0.2) : kPrimaryColor,
                                                                  ),
                                                                  child: const Icon(
                                                                    FeatherIcons.minus,
                                                                    color: Colors.white,
                                                                    size: 14.0,
                                                                  ).onTap(() {
                                                                    setStated(() {
                                                                      childCount > 0 ? childCount-- : childCount = 1;
                                                                    });
                                                                  }),
                                                                ),
                                                                const SizedBox(width: 10.0),
                                                                Text(childCount.toString()),
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
                                                                      childCount++;
                                                                    });
                                                                  }),
                                                                ),
                                                              ],
                                                            ),
                                                            const Divider(
                                                              thickness: 1.0,
                                                              color: kBorderColorTextField,
                                                            ),
                                                            const SizedBox(height: 15.0),
                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: [
                                                                Column(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    Text(
                                                                      lang.S.of(context).infants,
                                                                      style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                                                    ),
                                                                    Text(
                                                                      'Under 2 Years',
                                                                      style: kTextStyle.copyWith(color: kSubTitleColor),
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
                                                                    color: infantCount == 0 ? kPrimaryColor.withOpacity(0.2) : kPrimaryColor,
                                                                  ),
                                                                  child: const Icon(
                                                                    FeatherIcons.minus,
                                                                    color: Colors.white,
                                                                    size: 14.0,
                                                                  ).onTap(() {
                                                                    setStated(() {
                                                                      infantCount > 0 ? infantCount-- : infantCount = 1;
                                                                    });
                                                                  }),
                                                                ),
                                                                const SizedBox(width: 10.0),
                                                                Text(infantCount.toString()),
                                                                const SizedBox(width: 10.0),
                                                                Container(
                                                                  padding: const EdgeInsets.all(
                                                                    5.0,
                                                                  ),
                                                                  decoration: const BoxDecoration(shape: BoxShape.circle, color: kPrimaryColor),
                                                                  child: const Icon(FeatherIcons.plus, color: Colors.white, size: 14.0).onTap(() {
                                                                    setStated(() {
                                                                      infantCount++;
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
                                                                buttontext: lang.S.of(context).done,
                                                                buttonDecoration: kButtonDecoration.copyWith(color: kPrimaryColor),
                                                                onPressed: () {
                                                                  setState(() {
                                                                    finish(context);
                                                                    childCount = childCount;
                                                                    adultCount = adultCount;
                                                                    infantCount = infantCount;
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
                                  const SizedBox(height: 20.0),
                                  FormField(
                                    builder: (FormFieldState<dynamic> field) {
                                      return InputDecorator(
                                        decoration: kInputDecoration.copyWith(
                                          enabledBorder: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(8.0),
                                            ),
                                            borderSide: BorderSide(color: kBorderColorTextField, width: 2),
                                          ),
                                          contentPadding: const EdgeInsets.all(7.0),
                                          floatingLabelBehavior: FloatingLabelBehavior.always,
                                          labelText: lang.S.of(context).classTitle,
                                          labelStyle: kTextStyle.copyWith(color: kTitleColor),
                                        ),
                                        child: DropdownButtonHideUnderline(child: getClass()),
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 10.0),
                                  ButtonGlobalWithoutIcon(
                                    buttontext: lang.S.of(context).searchFlight,
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(color: Colors.transparent),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Flight ${flightNumber + 1}',
                                              style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                            ),
                                            const Spacer(),
                                            const Icon(
                                              FeatherIcons.x,
                                              color: kSubTitleColor,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 20.0),
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
                                                        labelText: lang.S.of(context).fromTitle,
                                                        labelStyle: kTextStyle.copyWith(color: kTitleColor),
                                                        floatingLabelBehavior: FloatingLabelBehavior.always,
                                                        border: OutlineInputBorder(
                                                          borderRadius: BorderRadius.circular(8.0),
                                                        ),
                                                      ),
                                                      child: ListTile(
                                                        
                                                        title: Text(
                                                          '(DAC)',
                                                          style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                                        ),
                                                        subtitle: Text(
                                                          'Dhaka, Bangladesh',
                                                          maxLines: 1,
                                                          overflow: TextOverflow.ellipsis,
                                                          style: kTextStyle.copyWith(color: kSubTitleColor),
                                                        ),
                                                        horizontalTitleGap: 0,
                                                        contentPadding: const EdgeInsets.only(left: 5.0),
                                                        minVerticalPadding: 0.0,
                                                        onTap: ()=>const Search().launch(context),
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
                                                        labelText: lang.S.of(context).toTitle,
                                                        labelStyle: kTextStyle.copyWith(color: kTitleColor),
                                                        floatingLabelBehavior: FloatingLabelBehavior.always,
                                                        border: OutlineInputBorder(
                                                          borderRadius: BorderRadius.circular(8.0),
                                                        ),
                                                      ),
                                                      child: ListTile(
                                                        onTap: ()=>const Search().launch(context),
                                                        title: Text(
                                                          '(NYC)',
                                                          style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                                        ),
                                                        subtitle: Text(
                                                          'New Your, United State',
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
                                        TextFormField(
                                          readOnly: true,
                                          keyboardType: TextInputType.name,
                                          cursorColor: kTitleColor,
                                          showCursor: false,
                                          textInputAction: TextInputAction.next,
                                          decoration: kInputDecoration.copyWith(
                                            labelText: lang.S.of(context).dateTitle,
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
                                                });
                                              },
                                              child: const Icon(
                                                IconlyLight.calendar,
                                                color: kSubTitleColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const Divider(
                                          thickness: 1.0,
                                          color: kBorderColorTextField,
                                        ),
                                      ],
                                    ),
                                  ),
                                  ListView.builder(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemCount: flights.length,
                                      itemBuilder: (_, i) {
                                        return Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  'Flight ${i + 2}'.toString(),
                                                  style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                                ),
                                                const Spacer(),
                                                GestureDetector(
                                                  child: const Icon(
                                                    FeatherIcons.x,
                                                    color: kSubTitleColor,
                                                  ),
                                                  onTap: () {
                                                    setState(() {
                                                      flights.remove(flights[i]);
                                                    });
                                                  },
                                                ),
                                              ],
                                            ),
                                            flights[i],
                                          ],
                                        );
                                      }),
                                  ButtonGlobalWithoutIcon(
                                    buttontext: lang.S.of(context).addFightButton,
                                    buttonDecoration: kButtonDecoration.copyWith(
                                      color: kWhite,
                                      border: Border.all(color: kPrimaryColor),
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        flights.add(Container(
                                          decoration: const BoxDecoration(color: Colors.transparent),
                                          child: Column(
                                            children: [
                                              const SizedBox(height: 20.0),
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
                                                              labelText: lang.S.of(context).fromTitle,
                                                              labelStyle: kTextStyle.copyWith(color: kTitleColor),
                                                              floatingLabelBehavior: FloatingLabelBehavior.always,
                                                              border: OutlineInputBorder(
                                                                borderRadius: BorderRadius.circular(8.0),
                                                              ),
                                                            ),
                                                            child: ListTile(
                                                              onTap: ()=>const Search().launch(context),
                                                              title: Text(
                                                                '(DAC)',
                                                                style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                                              ),
                                                              subtitle: Text(
                                                                'Dhaka, Bangladesh',
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
                                                              labelText: lang.S.of(context).toTitle,
                                                              labelStyle: kTextStyle.copyWith(color: kTitleColor),
                                                              floatingLabelBehavior: FloatingLabelBehavior.always,
                                                              border: OutlineInputBorder(
                                                                borderRadius: BorderRadius.circular(8.0),
                                                              ),
                                                            ),
                                                            child: ListTile(
                                                              onTap: ()=>const Search().launch(context),
                                                              title: Text(
                                                                '(NYC)',
                                                                style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                                              ),
                                                              subtitle: Text(
                                                                'New Your, United State',
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
                                              TextFormField(
                                                readOnly: true,
                                                keyboardType: TextInputType.name,
                                                cursorColor: kTitleColor,
                                                showCursor: false,
                                                textInputAction: TextInputAction.next,
                                                decoration: kInputDecoration.copyWith(
                                                  labelText: lang.S.of(context).dateTitle,
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
                                                      });
                                                    },
                                                    child: const Icon(
                                                      IconlyLight.calendar,
                                                      color: kSubTitleColor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 10.0),
                                              const Divider(
                                                thickness: 1.0,
                                                color: kBorderColorTextField,
                                              ),
                                            ],
                                          ),
                                        ));
                                      });
                                    },
                                    buttonTextColor: kPrimaryColor,
                                  ),
                                  const SizedBox(height: 20.0),
                                  TextFormField(
                                    readOnly: true,
                                    keyboardType: TextInputType.name,
                                    cursorColor: kTitleColor,
                                    showCursor: false,
                                    textInputAction: TextInputAction.next,
                                    decoration: kInputDecoration.copyWith(
                                      labelText: lang.S.of(context).travellerTitle,
                                      labelStyle: kTextStyle.copyWith(color: kTitleColor),
                                      hintText: '$adultCount Adult,$childCount child,$infantCount Infants',
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
                                                                  lang.S.of(context).travellerTitle,
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
                                                              'Dhaka to New York, Thu 6 Jan 2023',
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
                                                                      lang.S.of(context).adults,
                                                                      style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                                                    ),
                                                                    Text(
                                                                      '12+ years',
                                                                      style: kTextStyle.copyWith(color: kSubTitleColor),
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
                                                            const SizedBox(height: 15.0),
                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: [
                                                                Column(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    Text(
                                                                      lang.S.of(context).child,
                                                                      style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                                                    ),
                                                                    Text(
                                                                      '2-12 years',
                                                                      style: kTextStyle.copyWith(color: kSubTitleColor),
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
                                                                    color: childCount == 0 ? kPrimaryColor.withOpacity(0.2) : kPrimaryColor,
                                                                  ),
                                                                  child: const Icon(
                                                                    FeatherIcons.minus,
                                                                    color: Colors.white,
                                                                    size: 14.0,
                                                                  ).onTap(() {
                                                                    setStated(() {
                                                                      childCount > 0 ? childCount-- : childCount = 1;
                                                                    });
                                                                  }),
                                                                ),
                                                                const SizedBox(width: 10.0),
                                                                Text(childCount.toString()),
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
                                                                      childCount++;
                                                                    });
                                                                  }),
                                                                ),
                                                              ],
                                                            ),
                                                            const Divider(
                                                              thickness: 1.0,
                                                              color: kBorderColorTextField,
                                                            ),
                                                            const SizedBox(height: 15.0),
                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              children: [
                                                                Column(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    Text(
                                                                      lang.S.of(context).infants,
                                                                      style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                                                    ),
                                                                    Text(
                                                                      'Under 2 Years',
                                                                      style: kTextStyle.copyWith(color: kSubTitleColor),
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
                                                                    color: infantCount == 0 ? kPrimaryColor.withOpacity(0.2) : kPrimaryColor,
                                                                  ),
                                                                  child: const Icon(
                                                                    FeatherIcons.minus,
                                                                    color: Colors.white,
                                                                    size: 14.0,
                                                                  ).onTap(() {
                                                                    setStated(() {
                                                                      infantCount > 0 ? infantCount-- : infantCount = 1;
                                                                    });
                                                                  }),
                                                                ),
                                                                const SizedBox(width: 10.0),
                                                                Text(infantCount.toString()),
                                                                const SizedBox(width: 10.0),
                                                                Container(
                                                                  padding: const EdgeInsets.all(
                                                                    5.0,
                                                                  ),
                                                                  decoration: const BoxDecoration(shape: BoxShape.circle, color: kPrimaryColor),
                                                                  child: const Icon(FeatherIcons.plus, color: Colors.white, size: 14.0).onTap(() {
                                                                    setStated(() {
                                                                      infantCount++;
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
                                                                buttontext: lang.S.of(context).done,
                                                                buttonDecoration: kButtonDecoration.copyWith(color: kPrimaryColor),
                                                                onPressed: () {
                                                                  setState(() {
                                                                    finish(context);
                                                                    childCount = childCount;
                                                                    adultCount = adultCount;
                                                                    infantCount = infantCount;
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
                                  const SizedBox(height: 20.0),
                                  FormField(
                                    builder: (FormFieldState<dynamic> field) {
                                      return InputDecorator(
                                        decoration: kInputDecoration.copyWith(
                                          enabledBorder: const OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(8.0),
                                            ),
                                            borderSide: BorderSide(color: kBorderColorTextField, width: 2),
                                          ),
                                          contentPadding: const EdgeInsets.all(7.0),
                                          floatingLabelBehavior: FloatingLabelBehavior.always,
                                          labelText: lang.S.of(context).classTitle,
                                          labelStyle: kTextStyle.copyWith(color: kTitleColor),
                                        ),
                                        child: DropdownButtonHideUnderline(child: getClass()),
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 10.0),
                                  ButtonGlobalWithoutIcon(
                                    buttontext: lang.S.of(context).searchFlight,
                                    buttonDecoration: kButtonDecoration.copyWith(
                                      color: kPrimaryColor,
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                      const SearchResult().launch(context);
                                      });
                                    },
                                    buttonTextColor: kWhite,
                                  )
                                ],
                              ).visible(selectedIndex == 2)
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Container(
                      width: context.width(),
                      decoration: const BoxDecoration(color: kDarkWhite),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                            child: Text(
                              lang.S.of(context).recentSearch,
                              style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                            ),
                          ),
                          HorizontalList(
                            padding: const EdgeInsets.only(left: 10.0, top: 15.0, bottom: 10.0),
                            itemCount: 10,
                            itemBuilder: (_, i) {
                              return Container(
                                padding: const EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6.0),
                                  color: const Color(0xFFEDF0FF),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Dhaka to New York',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      '17 Jan - 18 Jan ',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: kTextStyle.copyWith(color: kSubTitleColor),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 10.0),
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                            child: Text(
                              lang.S.of(context).flightOfferTitle,
                              style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                            ),
                          ),
                          HorizontalList(
                            padding: const EdgeInsets.only(
                              left: 10.0,
                              top: 15.0,
                              bottom: 15.0,
                              right: 10.0,
                            ),
                            physics: const BouncingScrollPhysics(),
                            itemCount: 10,
                            itemBuilder: (_, i) {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  color: const Color(0xFFEDF0FF),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 120,
                                      width: context.width() / 1.2,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8.0),
                                        color: kWhite,
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 120,
                                            width: 100,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(8.0),
                                                bottomLeft: Radius.circular(8.0),
                                              ),
                                              image: DecorationImage(
                                                image: AssetImage('images/offer1.png'),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Dhaka',
                                                      maxLines: 1,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                                    ),
                                                    const SizedBox(width: 10.0),
                                                    const Icon(
                                                      Icons.flight_land,
                                                      color: kSubTitleColor,
                                                    ),
                                                    const SizedBox(width: 10.0),
                                                    Text(
                                                      'New York',
                                                      maxLines: 1,
                                                      overflow: TextOverflow.ellipsis,
                                                      style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(height: 5.0),
                                                Container(
                                                  height: 1.0,
                                                  width: 120,
                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.0), color: kBorderColorTextField),
                                                ),
                                                const SizedBox(height: 5.0),
                                                SizedBox(
                                                  width: 180,
                                                  child: Text(
                                                    'Lorem ipsum dolor sit am et consectetur adipiscing elit, sed do eiusmod',
                                                    maxLines: 3,
                                                    overflow: TextOverflow.ellipsis,
                                                    style: kTextStyle.copyWith(color: kSubTitleColor),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
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
