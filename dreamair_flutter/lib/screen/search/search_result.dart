import 'package:flight_booking/screen/search/flight_details.dart';
import 'package:flight_booking/screen/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'filter.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({Key? key}) : super(key: key);

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  List<String> filterTitleList = [
    'Filter',
    'Non Stop',
    '1 Stop',
    'Duration',
  ];

  List<String> selectedFilter = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        titleSpacing: 0,
        elevation: 0,
        backgroundColor: kPrimaryColor,
        iconTheme: const IconThemeData(color: kWhite),
        title: ListTile(
          dense: true,
          visualDensity: const VisualDensity(vertical: -2),
          horizontalTitleGap: 00.0,
          contentPadding: const EdgeInsets.only(right: 15.0),
          title: Text(
            'Dhaka - New Delhi',
            style: kTextStyle.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            'Thu 6 Jan | 1 Adult, 0 Child, 0 Infant',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: kTextStyle.copyWith(color: kWhite),
          ),
          trailing: Column(
            children: [
              const Icon(
                IconlyBold.edit,
                color: Colors.white,
                size: 18.0,
              ),
              const SizedBox(height: 2.0),
              Text(
                'Edit',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: kTextStyle.copyWith(color: kWhite),
              ),
            ],
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
                  'Flight to New Delhi',
                  style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                ),
              ),
              HorizontalList(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  itemCount: filterTitleList.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (_, i) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilter.contains(filterTitleList[i])
                              ? selectedFilter.remove(filterTitleList[i])
                              : selectedFilter.add(
                                  filterTitleList[i],
                                );
                          i == 0 ? Navigator.push(context, MaterialPageRoute(builder: (context) => const Filter())) : null;
                        });
                      },
                      child: Container(
                        height: 35,
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0, bottom: 5.0),
                        decoration: BoxDecoration(
                          color: selectedFilter.contains(filterTitleList[i]) ? kPrimaryColor.withOpacity(0.1) : kWhite,
                          borderRadius: BorderRadius.circular(30.0),
                          border: Border.all(
                            color: kBorderColorTextField,
                          ),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.sort,
                              color: kSubTitleColor,
                            ).visible(i == 0),
                            const SizedBox(width: 5.0).visible(i == 0),
                            Text(
                              filterTitleList[i],
                              style: kTextStyle.copyWith(color: kSubTitleColor),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
              const SizedBox(height: 10.0),
              ListView.builder(
                  itemCount: 10,
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
                                    image: DecorationImage(image: AssetImage('images/indigo.png'), fit: BoxFit.cover),
                                  ),
                                ),
                                title: Text(
                                  'IndiGo',
                                  style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                ),
                                trailing: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          '$currencySign${15000}',
                                          style: kTextStyle.copyWith(color: kSubTitleColor, decoration: TextDecoration.lineThrough, fontSize: 12.0),
                                        ),
                                        const SizedBox(width: 5.0),
                                        Text(
                                          '$currencySign${12000}',
                                          style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '$currencySign${322} Deal',
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
                                onTap: () => const FlightDetails().launch(context),
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
                                          'IndiGo',
                                          style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                        ),
                                        subtitle: Row(
                                          children: [
                                            const Icon(
                                              Icons.swap_horiz,
                                              color: kPrimaryColor,
                                            ),
                                            const SizedBox(width: 5.0),
                                            Text(
                                              '2h 35m Layover at new york',
                                              style: kTextStyle.copyWith(color: kSubTitleColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                '5.50',
                                                style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 12),
                                              ),
                                              Text(
                                                'Dhaka',
                                                style: kTextStyle.copyWith(color: kSubTitleColor, fontSize: 12),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(width: 5.0),
                                          Column(
                                            children: [
                                              Text(
                                                '3h 40m',
                                                style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 12),
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
                                                          Icons.flight_land_outlined,
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
                                                '1 Stop',
                                                style: kTextStyle.copyWith(color: kSubTitleColor, fontSize: 12),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(width: 5.0),
                                          Column(
                                            children: [
                                              Text(
                                                '7.30',
                                                style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 12),
                                              ),
                                              Text(
                                                'New Delhi',
                                                style: kTextStyle.copyWith(color: kSubTitleColor, fontSize: 12),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(width: 5.0),
                                          Text(
                                            '+ 2 Option',
                                            style: kTextStyle.copyWith(color: kPrimaryColor, fontSize: 12.0),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            Material(
                              elevation: 1.0,
                              shadowColor: kDarkWhite,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0), side: const BorderSide(color: kBorderColorTextField)),
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
                                        'IndiGo',
                                        style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Row(
                                        children: [
                                          const Icon(
                                            Icons.swap_horiz,
                                            color: kPrimaryColor,
                                          ),
                                          const SizedBox(width: 5.0),
                                          Text(
                                            '2h 35m Layover at new york',
                                            style: kTextStyle.copyWith(color: kSubTitleColor),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              '5.50',
                                              style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 12),
                                            ),
                                            Text(
                                              'Dhaka',
                                              style: kTextStyle.copyWith(color: kSubTitleColor, fontSize: 12),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(width: 5.0),
                                        Column(
                                          children: [
                                            Text(
                                              '3h 40m',
                                              style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 12),
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
                                                      child: Transform.scale(
                                                        scaleX: -1,
                                                        child: const Icon(
                                                          Icons.flight_land_outlined,
                                                          size: 16,
                                                          color: Colors.white,
                                                        ),
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
                                              '1 Stop',
                                              style: kTextStyle.copyWith(color: kSubTitleColor, fontSize: 12),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(width: 5.0),
                                        Column(
                                          children: [
                                            Text(
                                              '7.30',
                                              style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 12),
                                            ),
                                            Text(
                                              'New Delhi',
                                              style: kTextStyle.copyWith(color: kSubTitleColor, fontSize: 12),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(width: 5.0),
                                        Text(
                                          '2 Seats left\nat this price',
                                          style: kTextStyle.copyWith(color: Colors.red, fontSize: 12.0),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
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
                                      'Use Code MMTFEST to get RS, 644 instant Discount',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: kTextStyle.copyWith(color: kTitleColor, fontSize: 12.0),
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
    );
  }
}
