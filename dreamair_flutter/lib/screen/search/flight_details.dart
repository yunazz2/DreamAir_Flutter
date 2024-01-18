import 'package:flight_booking/screen/widgets/button_global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:nb_utils/nb_utils.dart';

import '../book proceed/book_proceed.dart';
import '../widgets/constant.dart';
import 'package:flight_booking/generated/l10n.dart' as lang;

class FlightDetails extends StatefulWidget {
  const FlightDetails({super.key});

  @override
  State<FlightDetails> createState() => _FlightDetailsState();
}

class _FlightDetailsState extends State<FlightDetails>
    with TickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        initialIndex: 1,
        child: Scaffold(
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: ListTile(
              contentPadding: const EdgeInsets.only(left: 15.0, right: 15.0),
              visualDensity: const VisualDensity(vertical: 2),
              title: const Text(
                'Total Price',
                style: TextStyle(color: kSubTitleColor),
              ),
              subtitle: const Text(
                ' $currencySign${45000.00}',
                style:
                    TextStyle(color: kTitleColor, fontWeight: FontWeight.bold),
              ),
              trailing: SizedBox(
                height: 80,
                width: 200,
                child: ButtonGlobalWithoutIcon(
                  buttontext: 'Proceed to Book',
                  buttonDecoration: kButtonDecoration.copyWith(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  onPressed: () {
                    setState(() {
                      const BookProceed().launch(context);
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
                            lang.S.of(context).flightDetails,
                            style: const TextStyle(
                                color: kTitleColor,
                                fontWeight: FontWeight.bold),
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
                          TabBar(
                            labelStyle: kTextStyle.copyWith(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold),
                            unselectedLabelColor: kSubTitleColor,
                            indicatorColor: kPrimaryColor,
                            labelColor: kPrimaryColor,
                            indicatorSize: TabBarIndicatorSize.tab,
                            indicator: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30.0),
                                topLeft: Radius.circular(30.0),
                              ),
                              color: Color(0xFFEDF0FF),
                            ),
                            onTap: (index) {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            tabs: [
                              Tab(
                                text: lang.S.of(context).onwardTitle,
                              ),
                              Tab(
                                text: lang.S.of(context).returnTitle,
                              ),
                            ],
                          ),
                          const Divider(
                              height: 0,
                              thickness: 1.0,
                              color: kBorderColorTextField),
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
                                        border:
                                            Border.all(color: kSecondaryColor),
                                      ),
                                      child: const Column(
                                        children: [
                                          Text(
                                            'Dhaka - New Delhi',
                                            style: TextStyle(
                                              color: kTitleColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            '1 stop | 5 hrs 40 mins | Economy',
                                            style: TextStyle(
                                                color: kSubTitleColor),
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
                                        border:
                                            Border.all(color: kSecondaryColor),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        'images/indigo.png'),
                                                    fit: BoxFit.cover),
                                              ),
                                            ),
                                            title: const Text(
                                              'IndiGo',
                                              style: TextStyle(
                                                  color: kTitleColor,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            subtitle: const Text(
                                              '05h 25m in flight',
                                              style: TextStyle(
                                                  color: kSubTitleColor),
                                            ),
                                          ),
                                          const SizedBox(height: 10.0),
                                          Container(
                                            decoration: const BoxDecoration(
                                                color: Colors.transparent),
                                            child: Row(
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Stack(
                                                      alignment:
                                                          Alignment.topCenter,
                                                      children: [
                                                        Container(
                                                          height: 100.0,
                                                          width: 2,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: kPrimaryColor
                                                                .withOpacity(
                                                                    0.5),
                                                          ),
                                                        ),
                                                        const Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 1.0,
                                                                  bottom: 5),
                                                          child: RotatedBox(
                                                            quarterTurns: 2,
                                                            child: Icon(
                                                              Icons.flight,
                                                              color:
                                                                  kPrimaryColor,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 5.0),
                                                      child: Container(
                                                        height: 15.0,
                                                        width: 15.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border.all(
                                                              color: kPrimaryColor
                                                                  .withOpacity(
                                                                      0.5),
                                                              width: 3),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(width: 25.0),
                                                const Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '11:40 pm  -  Dhaka',
                                                      style: TextStyle(
                                                          color: kTitleColor,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      width: 265,
                                                      child: Text(
                                                        'Thu 6 Jan - Hazrat Shahjala International Airport',
                                                        maxLines: 2,
                                                        style: TextStyle(
                                                            color:
                                                                kSubTitleColor),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                    SizedBox(height: 10.0),
                                                    Text(
                                                      '11:40 pm  -  Dhaka',
                                                      style: TextStyle(
                                                          color: kTitleColor,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      width: 265,
                                                      child: Text(
                                                        'Thu 6 Jan - Netaji Subhash Chandra Bose International Airport',
                                                        maxLines: 2,
                                                        style: TextStyle(
                                                            color:
                                                                kSubTitleColor),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 20.0),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: const Color(0xFFE3E7EA),
                                              borderRadius:
                                                  BorderRadius.circular(6.0),
                                            ),
                                            child: ListTile(
                                              onTap: () {
                                                setState(() {});
                                              },
                                              dense: true,
                                              horizontalTitleGap: 0,
                                              contentPadding: EdgeInsets.zero,
                                              minVerticalPadding: 0,
                                              leading: Container(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                decoration: const BoxDecoration(
                                                    color: Colors.transparent),
                                                child: const Icon(
                                                  Icons
                                                      .directions_walk_outlined,
                                                  color: kSubTitleColor,
                                                ),
                                              ),
                                              title: const Text(
                                                'Overnight layover in Dubai',
                                                style: TextStyle(
                                                    color: kTitleColor,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              subtitle: const Text(
                                                '07h 05m',
                                                style: TextStyle(
                                                    color: kSubTitleColor),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 10.0),
                                          Container(
                                            decoration: const BoxDecoration(
                                                color: Colors.transparent),
                                            child: Row(
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 5.0),
                                                      child: Container(
                                                        height: 15.0,
                                                        width: 15.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.white,
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border.all(
                                                              color: kPrimaryColor
                                                                  .withOpacity(
                                                                      0.5),
                                                              width: 3),
                                                        ),
                                                      ),
                                                    ),
                                                    Stack(
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      children: [
                                                        Container(
                                                          height: 100.0,
                                                          width: 2,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: kPrimaryColor
                                                                .withOpacity(
                                                                    0.5),
                                                          ),
                                                        ),
                                                        const Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 1.0),
                                                          child: RotatedBox(
                                                            quarterTurns: 2,
                                                            child: Icon(
                                                              Icons.flight,
                                                              color:
                                                                  kPrimaryColor,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                const SizedBox(width: 25.0),
                                                const Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      '11:40 pm  -  Dhaka',
                                                      style: TextStyle(
                                                          color: kTitleColor,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      width: 265,
                                                      child: Text(
                                                        'Thu 6 Jan - Hazrat Shahjala International Airport',
                                                        maxLines: 2,
                                                        style: TextStyle(
                                                            color:
                                                                kSubTitleColor),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                    SizedBox(height: 10.0),
                                                    Text(
                                                      '11:40 pm  -  Dhaka',
                                                      style: TextStyle(
                                                          color: kTitleColor,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      width: 265,
                                                      child: Text(
                                                        'Thu 6 Jan - Netaji Subhash Chandra Bose International Airport',
                                                        maxLines: 2,
                                                        style: TextStyle(
                                                            color:
                                                                kSubTitleColor),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          //_________________________________________________________________________Return
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                  child: const Column(
                                    children: [
                                      Text(
                                        'New Delhi - Dhaka',
                                        style: TextStyle(
                                          color: kTitleColor,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'Non stop | 3 hrs 40 mins | Economy ',
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'images/indigo.png'),
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                        title: const Text(
                                          'IndiGo',
                                          style: TextStyle(
                                              color: kTitleColor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        subtitle: const Text(
                                          '05h 25m in flight',
                                          style:
                                              TextStyle(color: kSubTitleColor),
                                        ),
                                      ),
                                      Container(
                                        decoration: const BoxDecoration(
                                            color: Colors.transparent),
                                        child: Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 5.0),
                                                  child: Container(
                                                    height: 15.0,
                                                    width: 15.0,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                          color: kPrimaryColor
                                                              .withOpacity(0.5),
                                                          width: 3),
                                                    ),
                                                  ),
                                                ),
                                                Stack(
                                                  alignment:
                                                      Alignment.bottomCenter,
                                                  children: [
                                                    Container(
                                                      height: 100.0,
                                                      width: 2,
                                                      decoration: BoxDecoration(
                                                        color: kPrimaryColor
                                                            .withOpacity(0.5),
                                                      ),
                                                    ),
                                                    const Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 1.0),
                                                      child: Icon(
                                                        Icons.flight,
                                                        color: kPrimaryColor,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            const SizedBox(width: 25.0),
                                            const Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '11:40 pm  -  Dhaka',
                                                  style: TextStyle(
                                                      color: kTitleColor,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  width: 265,
                                                  child: Text(
                                                    'Thu 6 Jan - Hazrat Shahjala International Airport',
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                        color: kSubTitleColor),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                SizedBox(height: 10.0),
                                                Text(
                                                  '11:40 pm  -  Dhaka',
                                                  style: TextStyle(
                                                      color: kTitleColor,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  width: 265,
                                                  child: Text(
                                                    'Thu 6 Jan - Netaji Subhash Chandra Bose International Airport',
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                        color: kSubTitleColor),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ).visible(selectedIndex == 1),
                          //_________________________________________________________________________Select_Services
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  lang.S.of(context).selectService,
                                  style: const TextStyle(
                                      color: kTitleColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 10.0),
                                ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: titleList.length,
                                  physics: const NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.zero,
                                  itemBuilder: (_, i) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            color: Colors.white,
                                            border: Border.all(
                                                color: kSecondaryColor)),
                                        child: Column(
                                          children: [
                                            ListTile(
                                              dense: true,
                                              horizontalTitleGap: 0,
                                              contentPadding: EdgeInsets.zero,
                                              leading: Radio(
                                                visualDensity:
                                                    const VisualDensity(
                                                  horizontal: VisualDensity
                                                      .minimumDensity,
                                                  vertical: VisualDensity
                                                      .minimumDensity,
                                                ),
                                                value: titleList[i],
                                                groupValue: gValue,
                                                onChanged: (value) {
                                                  setState(() {
                                                    gValue = value.toString();
                                                  });
                                                },
                                              ),
                                              title: const Row(
                                                children: [
                                                  Text(
                                                    'Fare Offered by airline',
                                                    style: TextStyle(
                                                      color: kTitleColor,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  Text(
                                                    '$currencySign${14450}',
                                                    style: TextStyle(
                                                        color: kSubTitleColor,
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough,
                                                        fontSize: 12.0),
                                                  ),
                                                ],
                                              ),
                                              subtitle: Row(
                                                children: [
                                                  Text(
                                                    titleList[i],
                                                    style: const TextStyle(
                                                      color: kSubTitleColor,
                                                    ),
                                                  ),
                                                  const Spacer(),
                                                  const Text(
                                                    '$currencySign${14450}',
                                                    style: TextStyle(
                                                        color: kTitleColor,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16.0),
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
                                                        visualDensity:
                                                            const VisualDensity(
                                                                vertical: -4),
                                                        horizontalTitleGap: 0,
                                                        contentPadding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 10.0),
                                                        leading: Container(
                                                          width: 24,
                                                          height: 24,
                                                          decoration:
                                                              const BoxDecoration(
                                                            shape: BoxShape
                                                                .rectangle,
                                                            image: DecorationImage(
                                                                image: AssetImage(
                                                                    'images/traveller.png'),
                                                                fit: BoxFit
                                                                    .cover),
                                                          ),
                                                        ),
                                                        title: const Text(
                                                          'Cabin baggage',
                                                          style: TextStyle(
                                                            color: kTitleColor,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        subtitle: const Text(
                                                          '7Kg',
                                                          style: TextStyle(
                                                            color:
                                                                kSubTitleColor,
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 10.0),
                                                      ListTile(
                                                        dense: true,
                                                        visualDensity:
                                                            const VisualDensity(
                                                                vertical: -4),
                                                        horizontalTitleGap: 0,
                                                        contentPadding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 10.0),
                                                        leading: Container(
                                                          width: 24,
                                                          height: 24,
                                                          decoration:
                                                              const BoxDecoration(
                                                            shape: BoxShape
                                                                .rectangle,
                                                            image: DecorationImage(
                                                                image: AssetImage(
                                                                    'images/seat.png'),
                                                                fit: BoxFit
                                                                    .cover),
                                                          ),
                                                        ),
                                                        title: const Text(
                                                          'Seat Selection',
                                                          style: TextStyle(
                                                            color: kTitleColor,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        subtitle: const Text(
                                                          'Available',
                                                          style: TextStyle(
                                                            color:
                                                                kSubTitleColor,
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 10.0),
                                                      ListTile(
                                                        dense: true,
                                                        visualDensity:
                                                            const VisualDensity(
                                                                vertical: -4),
                                                        horizontalTitleGap: 0,
                                                        contentPadding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 10.0),
                                                        leading: Container(
                                                          width: 24,
                                                          height: 24,
                                                          decoration:
                                                              const BoxDecoration(
                                                            shape: BoxShape
                                                                .rectangle,
                                                            image: DecorationImage(
                                                                image: AssetImage(
                                                                    'images/dollar.png'),
                                                                fit: BoxFit
                                                                    .cover),
                                                          ),
                                                        ),
                                                        title: const Text(
                                                          'Cancellation',
                                                          style: TextStyle(
                                                            color: kTitleColor,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        subtitle: const Text(
                                                          'Cancellation fee starting $currencySign${5000}',
                                                          style: TextStyle(
                                                            color:
                                                                kSubTitleColor,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  height: 140,
                                                  width: 2.0,
                                                  decoration:
                                                      const BoxDecoration(
                                                    color: kSecondaryColor,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    children: [
                                                      ListTile(
                                                        dense: true,
                                                        visualDensity:
                                                            const VisualDensity(
                                                                vertical: -4),
                                                        horizontalTitleGap: 0,
                                                        contentPadding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 10.0),
                                                        leading: Container(
                                                          width: 24,
                                                          height: 24,
                                                          decoration:
                                                              const BoxDecoration(
                                                            shape: BoxShape
                                                                .rectangle,
                                                            image: DecorationImage(
                                                                image: AssetImage(
                                                                    'images/bag.png'),
                                                                fit: BoxFit
                                                                    .cover),
                                                          ),
                                                        ),
                                                        title: const Text(
                                                          'Checked baggage',
                                                          style: TextStyle(
                                                            color: kTitleColor,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        subtitle: const Text(
                                                          '50Kg',
                                                          style: TextStyle(
                                                            color:
                                                                kSubTitleColor,
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 10.0),
                                                      ListTile(
                                                        dense: true,
                                                        visualDensity:
                                                            const VisualDensity(
                                                                vertical: -4),
                                                        horizontalTitleGap: 0,
                                                        contentPadding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 10.0),
                                                        leading: Container(
                                                          width: 24,
                                                          height: 24,
                                                          decoration:
                                                              const BoxDecoration(
                                                            shape: BoxShape
                                                                .rectangle,
                                                            image: DecorationImage(
                                                                image: AssetImage(
                                                                    'images/meal.png'),
                                                                fit: BoxFit
                                                                    .cover),
                                                          ),
                                                        ),
                                                        title: const Text(
                                                          'Meal',
                                                          style: TextStyle(
                                                            color: kTitleColor,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        subtitle: const Text(
                                                          'Available',
                                                          style: TextStyle(
                                                            color:
                                                                kSubTitleColor,
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                          height: 10.0),
                                                      ListTile(
                                                        dense: true,
                                                        visualDensity:
                                                            const VisualDensity(
                                                                vertical: -4),
                                                        horizontalTitleGap: 0,
                                                        contentPadding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 10.0),
                                                        leading: Container(
                                                          width: 24,
                                                          height: 24,
                                                          decoration:
                                                              const BoxDecoration(
                                                            shape: BoxShape
                                                                .rectangle,
                                                            image: DecorationImage(
                                                                image: AssetImage(
                                                                    'images/watch.png'),
                                                                fit: BoxFit
                                                                    .cover),
                                                          ),
                                                        ),
                                                        title: const Text(
                                                          'Date Change ',
                                                          style: TextStyle(
                                                            color: kTitleColor,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        subtitle: const Text(
                                                          'Date change fee starting $currencySign${7000}',
                                                          style: TextStyle(
                                                            color:
                                                                kSubTitleColor,
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
      ),
    );
  }
}
