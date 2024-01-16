import 'package:flight_booking/screen/widgets/button_global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import '../widgets/constant.dart';
import 'package:flight_booking/generated/l10n.dart' as lang;

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> with TickerProviderStateMixin {
  double price = 0.00;

  List<String> titleList = ['Non Stop', 'Up to 1 Stop', 'Any'];
  String gValue = 'Non Stop';

  List<String> departureTime = [
    'Before 6AM',
    '6AM-12PM',
    '12PM-6PM',
    '6AM-12AM',
  ];

  String selectedDepartureTime = 'Before 6AM';

  List<String> arrivalTime = [
    'Before 6AM',
    '6AM-12PM',
    '12PM-6PM',
    '6AM-12AM',
  ];

  String selectedArrivalTime = 'Before 6AM';

  TabController? tabController;

  List<IconData> iconList = [
    Icons.sunny,
    Icons.sunny,
    FontAwesomeIcons.cloudMoon,
    FontAwesomeIcons.cloudSun,
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  List<String> flightNameList = [
    'Indigo',
    'Spice jet',
    'Air Asia',
    'Arab Emirates',
  ];

  List<String> selectedFlightNameList = [];

  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(5.0),
          decoration: const BoxDecoration(
            color: kWhite,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: ButtonGlobalWithoutIcon(
                  buttontext: lang.S.of(context).cancelButton,
                  buttonDecoration: kButtonDecoration.copyWith(
                    color: kWhite,
                    border: Border.all(color: Colors.red),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  buttonTextColor: Colors.red,
                ),
              ),
              Expanded(
                child: ButtonGlobalWithoutIcon(
                  buttontext: lang.S.of(context).applyButton,
                  buttonDecoration: kButtonDecoration.copyWith(
                    color: kPrimaryColor,
                  ),
                  onPressed: () {
                    finish(context);
                  },
                  buttonTextColor: kWhite,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: kPrimaryColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kPrimaryColor,
          centerTitle: true,
          title: Text(lang.S.of(context).filter),
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(
              FeatherIcons.x,
              color: kWhite,
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: const BoxDecoration(
            color: kWhite,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.0),
              topLeft: Radius.circular(30.0),
            ),
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(height: 10.0),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  width: context.width(),
                  decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: kBorderColorTextField),
                    boxShadow: const [
                      BoxShadow(
                        color: kBorderColorTextField,
                        blurRadius: 5.0,
                        spreadRadius: 1.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Stops',
                        style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8.0),
                      HorizontalList(
                        itemCount: titleList.length,
                        padding: EdgeInsets.zero,
                        itemBuilder: (_, i) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Radio(
                                visualDensity: const VisualDensity(
                                  horizontal: VisualDensity.minimumDensity,
                                  vertical: VisualDensity.minimumDensity,
                                ),
                                value: titleList[i],
                                groupValue: gValue,
                                onChanged: (value) {
                                  setState(() {
                                    gValue = value.toString();
                                  });
                                },
                              ),
                              Text(
                                titleList[i],
                                style: kTextStyle.copyWith(color: kSubTitleColor),
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                Container(
                  decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: kBorderColorTextField),
                    boxShadow: const [
                      BoxShadow(
                        color: kBorderColorTextField,
                        blurRadius: 5.0,
                        spreadRadius: 1.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TabBar(
                        labelStyle: kTextStyle.copyWith(color: kPrimaryColor, fontWeight: FontWeight.bold),
                        unselectedLabelColor: kSubTitleColor,
                        indicatorColor: kPrimaryColor,
                        labelColor: kPrimaryColor,
                        indicator: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8.0),
                            topLeft: Radius.circular(8.0),
                          ),
                          color: Color(0xFFEDF0FF),
                        ),
                        onTap: (index) {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        tabs: [
                          Row(
                            children: [
                              Transform.rotate(
                                angle: 45,
                                child: const Icon(
                                  Icons.flight,
                                ),
                              ),
                              const SizedBox(width: 5.0),
                              Tab(
                                text: lang.S.of(context).departure,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Transform.rotate(
                                angle: 90,
                                child: const Icon(
                                  Icons.flight,
                                ),
                              ),
                              const SizedBox(width: 5.0),
                              Tab(
                                text: lang.S.of(context).arrival,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          children: [
                            Text(
                              'Departure from Dhaka',
                              style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: HorizontalList(
                            padding: EdgeInsets.zero,
                            spacing: 0,
                            itemCount: departureTime.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (_, i) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedDepartureTime = departureTime[i];
                                    i == 0 ? Navigator.push(context, MaterialPageRoute(builder: (context) => const Filter())) : null;
                                  });
                                },
                                child: Container(
                                  width: 79,
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    color: selectedDepartureTime == departureTime[i] ? kPrimaryColor : kWhite,
                                    border: Border.all(
                                      color: selectedDepartureTime == departureTime[i] ? kPrimaryColor : kBorderColorTextField,
                                    ),
                                    borderRadius: i == 0
                                        ? const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            bottomLeft: Radius.circular(4.0),
                                          )
                                        : i == 3
                                            ? const BorderRadius.only(
                                                topRight: Radius.circular(4.0),
                                                bottomRight: Radius.circular(4.0),
                                              )
                                            : BorderRadius.circular(0.0),
                                  ),
                                  child: Column(
                                    children: [
                                      Icon(
                                        iconList[i],
                                        color: selectedDepartureTime == departureTime[i] ? kWhite : kSubTitleColor,
                                      ),
                                      Divider(
                                        thickness: 1.0,
                                        color: selectedDepartureTime == departureTime[i] ? kWhite : kBorderColorTextField,
                                      ),
                                      Text(
                                        departureTime[i],
                                        style: kTextStyle.copyWith(color: selectedDepartureTime == departureTime[i] ? kWhite : kSubTitleColor, fontSize: 10.0),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          children: [
                            Text(
                              'Arrive in New Delhi',
                              style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: HorizontalList(
                            padding: EdgeInsets.zero,
                            spacing: 0,
                            itemCount: departureTime.length,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (_, i) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedArrivalTime = arrivalTime[i];
                                    i == 0 ? Navigator.push(context, MaterialPageRoute(builder: (context) => const Filter())) : null;
                                  });
                                },
                                child: Container(
                                  width: 79,
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    color: selectedArrivalTime == arrivalTime[i] ? kPrimaryColor : kWhite,
                                    border: Border.all(
                                      color: selectedArrivalTime == arrivalTime[i] ? kPrimaryColor : kBorderColorTextField,
                                    ),
                                    borderRadius: i == 0
                                        ? const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            bottomLeft: Radius.circular(4.0),
                                          )
                                        : i == 3
                                            ? const BorderRadius.only(
                                                topRight: Radius.circular(4.0),
                                                bottomRight: Radius.circular(4.0),
                                              )
                                            : BorderRadius.circular(0.0),
                                  ),
                                  child: Column(
                                    children: [
                                      Icon(
                                        iconList[i],
                                        color: selectedArrivalTime == arrivalTime[i] ? kWhite : kSubTitleColor,
                                      ),
                                      Divider(
                                        thickness: 1.0,
                                        color: selectedArrivalTime == arrivalTime[i] ? kWhite : kBorderColorTextField,
                                      ),
                                      Text(
                                        arrivalTime[i],
                                        style: kTextStyle.copyWith(color: selectedArrivalTime == arrivalTime[i] ? kWhite : kSubTitleColor, fontSize: 10.0),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: kBorderColorTextField),
                    boxShadow: const [
                      BoxShadow(
                        color: kBorderColorTextField,
                        blurRadius: 5.0,
                        spreadRadius: 1.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Price',
                        style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                      ),
                      Center(
                        child: RichText(
                          text: TextSpan(
                            text: 'Up to USD ',
                            style: kTextStyle.copyWith(color: kSubTitleColor),
                            children: [
                              TextSpan(
                                text: '$currencySign${150000}',
                                style: kTextStyle.copyWith(color: kTitleColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Slider(
                        activeColor: kPrimaryColor,
                        inactiveColor: kPrimaryColor.withOpacity(0.1),
                        max: 1500000.00,
                        value: price,
                        onChanged: (double newVal) {
                          setState(
                            () {
                              newVal > 0.00 && newVal < 1499999.00 ? price = newVal : price = 10.00;
                            },
                          );
                        },
                      ),
                      Row(
                        children: [
                          Text(
                            'USD $currencySign${price.toString()}',
                            style: kTextStyle.copyWith(color: kSubTitleColor),
                          ),
                          const Spacer(),
                          Text(
                            'USD \$1500000.00',
                            style: kTextStyle.copyWith(color: kSubTitleColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: kBorderColorTextField),
                    boxShadow: const [
                      BoxShadow(
                        color: kBorderColorTextField,
                        blurRadius: 5.0,
                        spreadRadius: 1.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Airlines',
                        style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                      ),
                      ListTileTheme(
                        minLeadingWidth: 10,
                        child: ListTile(
                          onTap: () {
                            setState(() {
                              for (var element in flightNameList) {
                                selectedFlightNameList.contains(element) ? selectedFlightNameList.remove(element) : selectedFlightNameList.add(element);
                              }
                            });
                          },
                          dense: true,
                          horizontalTitleGap: 10,
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            'Select All',
                            style: kTextStyle.copyWith(color: kSubTitleColor),
                          ),
                          leading: Icon(
                            selectedFlightNameList.length == flightNameList.length ? Icons.check_box_rounded : Icons.check_box_outline_blank_rounded,
                            color: selectedFlightNameList.length == flightNameList.length ? kPrimaryColor : kSubTitleColor,
                          ),
                        ),
                      ),
                      ListTile(
                        dense: true,
                        horizontalTitleGap: 10,
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          'Show Alliances',
                          style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                        ),
                        trailing: Switch(
                          activeColor: kPrimaryColor,
                          inactiveThumbColor: kSubTitleColor,
                          onChanged: (bool value) {
                            setState(() {
                              isOn = value;
                            });
                          },
                          value: isOn,
                        ),
                      ),
                      const Divider(
                        thickness: 1.0,
                        height: 1,
                        color: kBorderColorTextField,
                      ),
                      ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: flightNameList.length,
                        itemBuilder: (_, i) {
                          return Column(
                            children: [
                              ListTileTheme(
                                minLeadingWidth: 10,
                                child: ListTile(
                                  onTap: () {
                                    setState(() {
                                      selectedFlightNameList.contains(
                                        flightNameList[i],
                                      )
                                          ? selectedFlightNameList.remove(flightNameList[i])
                                          : selectedFlightNameList.add(flightNameList[i]);
                                    });
                                  },
                                  dense: true,
                                  horizontalTitleGap: 10,
                                  contentPadding: EdgeInsets.zero,
                                  leading: Icon(
                                      selectedFlightNameList.contains(
                                        flightNameList[i],
                                      )
                                          ? Icons.check_box_rounded
                                          : Icons.check_box_outline_blank_rounded,
                                      color: selectedFlightNameList.contains(
                                        flightNameList[i],
                                      )
                                          ? kPrimaryColor
                                          : kSubTitleColor),
                                  title: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 20.0,
                                        width: 20.0,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          image: DecorationImage(image: AssetImage('images/indigo.png'), fit: BoxFit.cover),
                                        ),
                                      ),
                                      const SizedBox(width: 10.0),
                                      Text(
                                        flightNameList[i],
                                        style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
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
                            ],
                          );
                        },
                      ).visible(isOn == true)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
