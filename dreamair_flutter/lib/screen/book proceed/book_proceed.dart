import 'package:country_code_picker/country_code_picker.dart';
import 'package:flight_booking/generated/l10n.dart' as lang;
import 'package:flight_booking/screen/Seat/seat.dart';
import 'package:flight_booking/screen/widgets/button_global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:nb_utils/nb_utils.dart';

import '../widgets/constant.dart';
import '../widgets/data_widgets.dart';

class BookProceed extends StatefulWidget {
  const BookProceed({Key? key}) : super(key: key);

  @override
  State<BookProceed> createState() => _BookProceedState();
}

class _BookProceedState extends State<BookProceed> with TickerProviderStateMixin {
  TabController? tabController;
  TabController? tabsController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    tabsController = TabController(length: 3, vsync: this);
  }

  List<String> discountList = [
    'GOTRAVEL',
    'AIR-IN',
  ];

  List<String> selectedDiscountList = [];

  List<String> genderList = ['Mr.', 'Mrs.', 'Miss.'];

  String selectedGender = 'Mr.';

  bool isChecked = true;

  List<String> chairType = [
    'Select Wheelchair',
    'Type-1',
    'Type-2',
    'Type-3',
  ];

  String selectedType = 'Select Wheelchair';

  DropdownButton<String> getChairType() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String des in chairType) {
      var item = DropdownMenuItem(
        value: des,
        child: Text(des),
      );
      dropDownItems.add(item);
    }
    return DropdownButton(
      icon: const Icon(
        FeatherIcons.chevronDown,
        color: kSubTitleColor,
      ),
      items: dropDownItems,
      value: selectedType,
      onChanged: (value) {
        setState(() {
          selectedType = value!;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
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
              'Trip To',
              style: kTextStyle.copyWith(
                color: kWhite,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              'New Delhi',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: kTextStyle.copyWith(color: kWhite),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(color: kWhite),
          child: ListTile(
            contentPadding: const EdgeInsets.only(left: 15.0, right: 15.0),
            visualDensity: const VisualDensity(vertical: 2),
            title: Text(
              'For 1 Adult',
              style: kTextStyle.copyWith(color: kSubTitleColor),
            ),
            subtitle: Text(
              ' $currencySign${45000.00}',
              style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
            ),
            trailing: SizedBox(
              width: 200,
              child: ButtonGlobalWithoutIcon(
                buttontext: '다음으로',
                buttonDecoration: kButtonDecoration.copyWith(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                onPressed: () {
                  setState(() {
                    const Seat().launch(context);
                  });
                },
                buttonTextColor: kWhite,
              ),
            ),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10),
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
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: kSecondaryColor,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: kDarkWhite,
                        spreadRadius: 2.0,
                        blurRadius: 7.0,
                        offset: Offset(0, 2),
                      )
                    ],
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
                            image: DecorationImage(image: AssetImage('images/indigo.png'), fit: BoxFit.cover),
                          ),
                        ),
                        title: Text(
                          'Depart (DAC - CCU)',
                          style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          'Thu, 6 Jan |  11:40pm - 05:25pm | 5h 25m | 1 Stop',
                          style: kTextStyle.copyWith(color: kSubTitleColor),
                        ),
                      ),
                      const Divider(
                        thickness: 1.0,
                        color: kBorderColorTextField,
                      ),
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
                            image: DecorationImage(image: AssetImage('images/indigo.png'), fit: BoxFit.cover),
                          ),
                        ),
                        title: Text(
                          'Depart (DAC - CCU)',
                          style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          'Thu, 6 Jan |  11:40pm - 05:25pm | 5h 25m | 1 Stop',
                          style: kTextStyle.copyWith(color: kSubTitleColor),
                        ),
                      ),
                      const Divider(
                        thickness: 1.0,
                        color: kBorderColorTextField,
                      ),
                      ButtonGlobalWithoutIcon(
                          buttontext: 'View Flight & Fare Details',
                          buttonDecoration: kButtonDecoration.copyWith(
                            color: kWhite,
                            borderRadius: BorderRadius.circular(30.0),
                            border: Border.all(color: kPrimaryColor.withOpacity(0.2)),
                          ),
                          onPressed: () {},
                          buttonTextColor: kPrimaryColor)
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),

                //_________________________________________________________________________Baggage_policy
                Container(
                  decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: kSecondaryColor,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: kDarkWhite,
                        spreadRadius: 2.0,
                        blurRadius: 7.0,
                        offset: Offset(0, 2),
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Text(
                              lang.S.of(context).bagPolicyTitle,
                              style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(30.0),
                                      topLeft: Radius.circular(30.0),
                                    ),
                                  ),
                                  context: context,
                                  builder: (BuildContext context) {
                                    return StatefulBuilder(builder: (context, setState) {
                                      return DraggableScrollableSheet(
                                        initialChildSize: 0.75,
                                        expand: false,
                                        maxChildSize: 0.80,
                                        minChildSize: 0.20,
                                        builder: (BuildContext context, ScrollController controller) {
                                          return SingleChildScrollView(
                                            physics: const NeverScrollableScrollPhysics(),
                                            controller: controller,
                                            child: Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.all(10.0),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          'Refund & Baggage Policy',
                                                          style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                                        ),
                                                        const Spacer(),
                                                        GestureDetector(
                                                          onTap: () {
                                                            setState(() {
                                                              finish(context);
                                                            });
                                                          },
                                                          child: const Icon(
                                                            FeatherIcons.x,
                                                            color: kSubTitleColor,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  TabBar(
                                                    labelStyle: kTextStyle.copyWith(color: Colors.white),
                                                    unselectedLabelColor: kSubTitleColor,
                                                    indicatorColor: kPrimaryColor,
                                                    labelColor: kPrimaryColor,
                                                    controller: tabsController,
                                                    indicator: const UnderlineTabIndicator(
                                                      borderSide: BorderSide(color: kPrimaryColor),
                                                    ),
                                                    indicatorSize: TabBarIndicatorSize.tab,
                                                    onTap: (index) {
                                                      setState(() {
                                                        selectedIndex = index;
                                                      });
                                                    },
                                                    tabs: const [
                                                      Tab(
                                                        text: 'Cancellation',
                                                      ),
                                                      Tab(
                                                        text: 'Date change',
                                                      ),
                                                      Tab(
                                                        text: 'Baggage',
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 20.0),
                                                  SizedBox(
                                                    height: MediaQuery.of(context).size.height,
                                                    child: TabBarView(
                                                      controller: tabsController,
                                                      children: const [
                                                        CancellationWidget(),
                                                        DateChangePolicy(),
                                                        BaggagePolicy(),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    });
                                  },
                                );
                              },
                              child: const Icon(
                                FeatherIcons.chevronRight,
                                color: kPrimaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      TabBar(
                        labelStyle: kTextStyle.copyWith(color: Colors.white),
                        unselectedLabelColor: kSubTitleColor,
                        indicatorColor: kPrimaryColor,
                        labelColor: kPrimaryColor,
                        indicator: const UnderlineTabIndicator(borderSide: BorderSide(color: kPrimaryColor)),
                        indicatorSize: TabBarIndicatorSize.tab,
                        onTap: (index) {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        tabs: const [
                          Tab(
                            text: 'DAC-CCU',
                          ),
                          Tab(
                            text: 'CCU-DAC',
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        children: [
                          Expanded(
                            child: ListTile(
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
                                'Cabin baggage',
                                maxLines: 1,
                                style: kTextStyle.copyWith(
                                  color: kTitleColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                '50Kg',
                                maxLines: 1,
                                style: kTextStyle.copyWith(
                                  color: kSubTitleColor,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListTile(
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
                                'Checked baggage',
                                maxLines: 1,
                                style: kTextStyle.copyWith(
                                  color: kTitleColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                '50Kg',
                                maxLines: 1,
                                style: kTextStyle.copyWith(
                                  color: kSubTitleColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),

                //_________________________________________________________________________cancellation_refund_policy
                Container(
                  decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: kSecondaryColor,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: kDarkWhite,
                        spreadRadius: 2.0,
                        blurRadius: 7.0,
                        offset: Offset(0, 2),
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Text(
                              lang.S.of(context).refundPolicyTitle,
                              style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                            ),
                            const Spacer(),
                            const Icon(
                              FeatherIcons.chevronRight,
                              color: kPrimaryColor,
                            ),
                          ],
                        ),
                      ),
                      TabBar(
                        labelStyle: kTextStyle.copyWith(color: Colors.white),
                        unselectedLabelColor: kSubTitleColor,
                        indicatorColor: kPrimaryColor,
                        labelColor: kPrimaryColor,
                        indicator: const UnderlineTabIndicator(borderSide: BorderSide(color: kPrimaryColor)),
                        indicatorSize: TabBarIndicatorSize.tab,
                        onTap: (index) {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        tabs: const [
                          Tab(
                            text: 'DAC-CCU',
                          ),
                          Tab(
                            text: 'CCU-DAC',
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        children: [
                          Expanded(
                            child: ListTile(
                              dense: true,
                              visualDensity: const VisualDensity(vertical: -4),
                              horizontalTitleGap: 0,
                              contentPadding: const EdgeInsets.only(left: 10.0, right: 10.0),
                              title: Row(
                                children: [
                                  Text(
                                    'Cancel Between (IST)',
                                    maxLines: 1,
                                    style: kTextStyle.copyWith(color: kSubTitleColor),
                                  ),
                                  const Spacer(),
                                  Text(
                                    'Cancellation Penalty:',
                                    maxLines: 1,
                                    style: kTextStyle.copyWith(
                                      color: kSubTitleColor,
                                    ),
                                  ),
                                ],
                              ),
                              subtitle: Row(
                                children: [
                                  Text(
                                    'Now - 6 Jan | 11:40 pm',
                                    maxLines: 1,
                                    style: kTextStyle.copyWith(
                                      color: kTitleColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    '$currencySign${7200}',
                                    maxLines: 1,
                                    style: kTextStyle.copyWith(
                                      color: kTitleColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),

                //_________________________________________________________________________offer & promo-code
                Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: kSecondaryColor,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: kDarkWhite,
                        spreadRadius: 2.0,
                        blurRadius: 7.0,
                        offset: Offset(0, 2),
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            IconlyBold.discount,
                            color: kPrimaryColor,
                          ),
                          const SizedBox(width: 10.0),
                          Text(
                            'Offer & Promocode',
                            style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: Text(
                              lang.S.of(context).viewAllButton,
                              style: kTextStyle.copyWith(color: kWhite),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        showCursor: false,
                        keyboardType: TextInputType.name,
                        cursorColor: kTitleColor,
                        decoration: kInputDecoration.copyWith(
                          contentPadding: const EdgeInsets.only(left: 10.0),
                          hintText: lang.S.of(context).promoCodeTitle,
                          hintStyle: kTextStyle.copyWith(color: kSubTitleColor),
                          focusColor: kTitleColor,
                          border: const OutlineInputBorder(),
                          suffixIcon: SizedBox(
                            width: 80,
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: kLightNeutralColor),
                                color: kLightNeutralColor.withOpacity(0.3),
                                borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(30.0),
                                  topRight: Radius.circular(30.0),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  lang.S.of(context).applyButton,
                                  style: kTextStyle.copyWith(color: kPrimaryColor),
                                ),
                              ),
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30.0),
                            ),
                            borderSide: BorderSide(color: kLightNeutralColor, width: 1),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(30.0),
                            ),
                            borderSide: BorderSide(color: kLightNeutralColor, width: 1),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      ListView.builder(
                        itemCount: discountList.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemBuilder: (_, i) {
                          return Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(
                                    IconlyBold.discount,
                                    color: kPrimaryColor,
                                  ),
                                  const SizedBox(width: 8),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        discountList[i],
                                        style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        'Get NIR 278 Instant Discount',
                                        style: kTextStyle.copyWith(color: kSubTitleColor),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    child: Icon(
                                        selectedDiscountList.contains(
                                          discountList[i],
                                        )
                                            ? Icons.check_box_rounded
                                            : Icons.check_box_outline_blank_rounded,
                                        color: selectedDiscountList.contains(
                                          discountList[i],
                                        )
                                            ? kPrimaryColor
                                            : kSubTitleColor),
                                    onTap: () {
                                      setState(
                                        () {
                                          selectedDiscountList.contains(
                                            discountList[i],
                                          )
                                              ? selectedDiscountList.remove(
                                                  discountList[i],
                                                )
                                              : selectedDiscountList.add(
                                                  discountList[i],
                                                );
                                        },
                                      );
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              const Divider(
                                thickness: 1.0,
                                color: kBorderColorTextField,
                              )
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                //_________________________________________________________________________Travellers_details
                Container(
                  width: context.width(),
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: kSecondaryColor,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: kDarkWhite,
                        spreadRadius: 2.0,
                        blurRadius: 7.0,
                        offset: Offset(0, 2),
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Traveler Details',
                        style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        horizontalTitleGap: 0,
                        leading: Container(
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: kPrimaryColor.withOpacity(0.2),
                          ),
                          child: const Icon(
                            IconlyBold.profile,
                            color: kPrimaryColor,
                            size: 18,
                          ),
                        ),
                        title: Text(
                          'Adult (12 yrs+)',
                          style: kTextStyle.copyWith(color: kSubTitleColor),
                        ),
                        trailing: RichText(
                          text: TextSpan(
                            text: '1/1 ',
                            style: kTextStyle.copyWith(color: kTitleColor),
                            children: [
                              TextSpan(
                                text: 'Added',
                                style: kTextStyle.copyWith(color: kSubTitleColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: kWhite,
                            boxShadow: const [BoxShadow(color: kBorderColorTextField, blurRadius: 7.0, spreadRadius: 2.0, offset: Offset(0, 2))]),
                        child: ListTile(
                          contentPadding: const EdgeInsets.only(left: 10.0, right: 10.0),
                          horizontalTitleGap: 0,
                          leading: const Icon(
                            Icons.check_box,
                            color: kPrimaryColor,
                          ),
                          title: Text(
                            'Ibne Riead',
                            style: kTextStyle.copyWith(color: kTitleColor),
                          ),
                          trailing: const Icon(
                            IconlyBold.edit,
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      ButtonGlobalWithIcon(
                        buttontext: '인원 추가',
                        buttonTextColor: kPrimaryColor,
                        buttonIcon: FeatherIcons.plus,
                        buttonDecoration: kButtonDecoration.copyWith(
                          color: kWhite,
                          borderRadius: BorderRadius.circular(8.0),
                          border: Border.all(
                            color: kPrimaryColor.withOpacity(0.5),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(30.0),
                                  topLeft: Radius.circular(30.0),
                                ),
                              ),
                              context: context,
                              builder: (BuildContext context) {
                                return StatefulBuilder(builder: (context, setState) {
                                  return DraggableScrollableSheet(
                                    initialChildSize: 1.00,
                                    expand: true,
                                    maxChildSize: 1.00,
                                    minChildSize: 0.70,
                                    builder: (BuildContext context, ScrollController controller) {
                                      return SingleChildScrollView(
                                        physics: const BouncingScrollPhysics(),
                                        controller: controller,
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(20.0),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    'Add Adult 1',
                                                    style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                                  ),
                                                  const Spacer(),
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        finish(context);
                                                      });
                                                    },
                                                    child: const Icon(
                                                      FeatherIcons.x,
                                                      color: kSubTitleColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: context.width(),
                                              decoration: const BoxDecoration(
                                                color: kWhite,
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(30.0),
                                                  topRight: Radius.circular(30.0),
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: kDarkWhite,
                                                    blurRadius: 7.0,
                                                    spreadRadius: 2.0,
                                                    offset: Offset(0, -2),
                                                  ),
                                                ],
                                              ),
                                              padding: const EdgeInsets.all(20.0),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    lang.S.of(context).selectGenderTitle,
                                                    style: kTextStyle.copyWith(color: kSubTitleColor),
                                                  ),
                                                  HorizontalList(
                                                    padding: EdgeInsets.zero,
                                                    physics: const NeverScrollableScrollPhysics(),
                                                    itemCount: genderList.length,
                                                    itemBuilder: (_, i) {
                                                      return Row(
                                                        children: [
                                                          Radio(
                                                            value: genderList[i],
                                                            groupValue: selectedGender,
                                                            onChanged: (value) {
                                                              setState(() {
                                                                selectedGender = value.toString();
                                                              });
                                                            },
                                                          ),
                                                          Text(
                                                            genderList[i],
                                                            style: kTextStyle.copyWith(
                                                              color: kTitleColor,
                                                              fontWeight: FontWeight.bold,
                                                            ),
                                                          ),
                                                        ],
                                                      );
                                                    },
                                                  ),
                                                  const SizedBox(height: 10.0),
                                                  TextFormField(
                                                    keyboardType: TextInputType.emailAddress,
                                                    cursorColor: kTitleColor,
                                                    textInputAction: TextInputAction.next,
                                                    decoration: kInputDecoration.copyWith(
                                                      labelText: lang.S.of(context).nameTitle,
                                                      labelStyle: kTextStyle.copyWith(color: kTitleColor),
                                                      hintText: lang.S.of(context).nameHint,
                                                      hintStyle: kTextStyle.copyWith(color: kSubTitleColor),
                                                      focusColor: kTitleColor,
                                                      border: const OutlineInputBorder(),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 20.0),
                                                  TextFormField(
                                                    keyboardType: TextInputType.emailAddress,
                                                    cursorColor: kTitleColor,
                                                    textInputAction: TextInputAction.next,
                                                    decoration: kInputDecoration.copyWith(
                                                      labelText: lang.S.of(context).lastNameTitle,
                                                      labelStyle: kTextStyle.copyWith(color: kTitleColor),
                                                      hintText: lang.S.of(context).lastNameHint,
                                                      hintStyle: kTextStyle.copyWith(color: kSubTitleColor),
                                                      focusColor: kTitleColor,
                                                      border: const OutlineInputBorder(),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 20.0),
                                                  FormField(
                                                    builder: (FormFieldState<dynamic> field) {
                                                      return InputDecorator(
                                                        decoration: const InputDecoration(
                                                            enabledBorder: OutlineInputBorder(
                                                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                                              borderSide: BorderSide(color: kBorderColorTextField, width: 2),
                                                            ),
                                                            contentPadding: EdgeInsets.all(7.0),
                                                            floatingLabelBehavior: FloatingLabelBehavior.always,
                                                            labelText: 'Category'),
                                                        child: DropdownButtonHideUnderline(child: getChairType()),
                                                      );
                                                    },
                                                  ),
                                                  const SizedBox(height: 20.0),
                                                  Theme(
                                                    data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                                                    child: ExpansionTile(
                                                      initiallyExpanded: true,
                                                      childrenPadding: EdgeInsets.zero,
                                                      tilePadding: EdgeInsets.zero,
                                                      title: Text(
                                                        'Frequent Traveler No',
                                                        style: kTextStyle.copyWith(color: kPrimaryColor),
                                                      ),
                                                      subtitle: Text(
                                                        '(Frequent flyer number is subject to airline acceptance)',
                                                        style: kTextStyle.copyWith(color: kSubTitleColor, fontSize: 12.0),
                                                      ),
                                                      children: [
                                                        const SizedBox(height: 10.0),
                                                        TextFormField(
                                                          keyboardType: TextInputType.emailAddress,
                                                          cursorColor: kTitleColor,
                                                          textInputAction: TextInputAction.next,
                                                          decoration: kInputDecoration.copyWith(
                                                            labelText: 'Frequent Flyer Airline',
                                                            labelStyle: kTextStyle.copyWith(color: kTitleColor),
                                                            hintText: 'Enter frequent flyer airline',
                                                            hintStyle: kTextStyle.copyWith(color: kSubTitleColor),
                                                            focusColor: kTitleColor,
                                                            border: const OutlineInputBorder(),
                                                          ),
                                                        ),
                                                        const SizedBox(height: 20.0),
                                                        TextFormField(
                                                          keyboardType: TextInputType.emailAddress,
                                                          cursorColor: kTitleColor,
                                                          textInputAction: TextInputAction.next,
                                                          decoration: kInputDecoration.copyWith(
                                                            labelText: 'Frequent Flyer No',
                                                            labelStyle: kTextStyle.copyWith(color: kTitleColor),
                                                            hintText: 'Enter frequent flyer no',
                                                            hintStyle: kTextStyle.copyWith(color: kSubTitleColor),
                                                            focusColor: kTitleColor,
                                                            border: const OutlineInputBorder(),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(height: 20.0),
                                                  ButtonGlobalWithoutIcon(
                                                    buttontext: 'Okay, Got It',
                                                    buttonDecoration: kButtonDecoration.copyWith(
                                                      color: kPrimaryColor,
                                                      borderRadius: BorderRadius.circular(30.0),
                                                    ),
                                                    onPressed: () {
                                                      setState(() {
                                                        finish(context);
                                                      });
                                                    },
                                                    buttonTextColor: kWhite,
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                });
                              },
                            );
                          });
                        },
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                //_________________________________________________________________________Booking details send part
                Container(
                  width: context.width(),
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: kSecondaryColor,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: kDarkWhite,
                        spreadRadius: 2.0,
                        blurRadius: 7.0,
                        offset: Offset(0, 2),
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Booking details will be sent to',
                            style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(30.0),
                                      topLeft: Radius.circular(30.0),
                                    ),
                                  ),
                                  context: context,
                                  builder: (BuildContext context) {
                                    return StatefulBuilder(builder: (context, setState) {
                                      return DraggableScrollableSheet(
                                        initialChildSize: 0.55,
                                        expand: false,
                                        maxChildSize: 1.00,
                                        minChildSize: 0.55,
                                        builder: (BuildContext context, ScrollController controller) {
                                          return SingleChildScrollView(
                                            physics: const BouncingScrollPhysics(),
                                            controller: controller,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(20.0),
                                                  child: Row(
                                                    children: [
                                                      Text(
                                                        lang.S.of(context).contactInfoTitle,
                                                        style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                                      ),
                                                      const Spacer(),
                                                      GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            finish(context);
                                                          });
                                                        },
                                                        child: const Icon(
                                                          FeatherIcons.x,
                                                          color: kSubTitleColor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width: context.width(),
                                                  decoration: const BoxDecoration(
                                                    color: kWhite,
                                                    borderRadius: BorderRadius.only(
                                                      topLeft: Radius.circular(30.0),
                                                      topRight: Radius.circular(30.0),
                                                    ),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: kDarkWhite,
                                                        blurRadius: 7.0,
                                                        spreadRadius: 2.0,
                                                        offset: Offset(0, -2),
                                                      ),
                                                    ],
                                                  ),
                                                  padding: const EdgeInsets.all(20.0),
                                                  child: Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        'Your ticket and flights information will be sent here.',
                                                        style: kTextStyle.copyWith(color: kTitleColor),
                                                      ),
                                                      const SizedBox(height: 10.0),
                                                      TextFormField(
                                                        keyboardType: TextInputType.emailAddress,
                                                        cursorColor: kTitleColor,
                                                        textInputAction: TextInputAction.next,
                                                        decoration: kInputDecoration.copyWith(
                                                          labelText: lang.S.of(context).emailHint,
                                                          labelStyle: kTextStyle.copyWith(color: kTitleColor),
                                                          hintText: lang.S.of(context).emailHint,
                                                          hintStyle: kTextStyle.copyWith(color: kSubTitleColor),
                                                          focusColor: kTitleColor,
                                                          border: const OutlineInputBorder(),
                                                        ),
                                                      ),
                                                      const SizedBox(height: 20.0),
                                                      TextFormField(
                                                        keyboardType: TextInputType.phone,
                                                        cursorColor: kTitleColor,
                                                        textInputAction: TextInputAction.next,
                                                        decoration: kInputDecoration.copyWith(
                                                          hintText: lang.S.of(context).phoneHint,
                                                          hintStyle: kTextStyle.copyWith(color: kSubTitleColor),
                                                          focusColor: kTitleColor,
                                                          border: const OutlineInputBorder(),
                                                          prefixIcon: CountryCodePicker(
                                                            padding: EdgeInsets.zero,
                                                            onChanged: print,
                                                            initialSelection: 'BD',
                                                            showFlag: true,
                                                            showDropDownButton: true,
                                                            alignLeft: false,
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(height: 20.0),
                                                      ButtonGlobalWithoutIcon(
                                                        buttontext: lang.S.of(context).confirm,
                                                        buttonDecoration: kButtonDecoration.copyWith(
                                                          color: kPrimaryColor,
                                                          borderRadius: BorderRadius.circular(30.0),
                                                        ),
                                                        onPressed: () {
                                                          setState(() {
                                                            finish(context);
                                                          });
                                                        },
                                                        buttonTextColor: kWhite,
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    });
                                  },
                                );
                              });
                            },
                            child: const Icon(
                              FeatherIcons.chevronRight,
                              color: kPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                      ListTile(
                        visualDensity: const VisualDensity(vertical: -3),
                        contentPadding: EdgeInsets.zero,
                        horizontalTitleGap: 0,
                        leading: Container(
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: kPrimaryColor.withOpacity(0.2),
                          ),
                          child: const Icon(
                            Icons.email,
                            color: kPrimaryColor,
                            size: 18,
                          ),
                        ),
                        title: Text(
                          'shaidulilalm@gmail.com)',
                          style: kTextStyle.copyWith(color: kSubTitleColor),
                        ),
                      ),
                      ListTile(
                        visualDensity: const VisualDensity(vertical: -3),
                        contentPadding: EdgeInsets.zero,
                        horizontalTitleGap: 0,
                        leading: Container(
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: kPrimaryColor.withOpacity(0.2),
                          ),
                          child: const Icon(
                            Icons.phone,
                            color: kPrimaryColor,
                            size: 18,
                          ),
                        ),
                        title: Text(
                          'Add Mobile Number-',
                          style: kTextStyle.copyWith(color: kPrimaryColor),
                        ),
                      ),
                      const Divider(
                        thickness: 1.0,
                        color: kBorderColorTextField,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            activeColor: kPrimaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                            value: isChecked,
                            onChanged: (val) {
                              setState(
                                () {
                                  isChecked = val!;
                                },
                              );
                            },
                          ),
                          RichText(
                            text: TextSpan(
                              text: 'I have a GST number ',
                              style: kTextStyle.copyWith(color: kTitleColor),
                              children: [
                                TextSpan(
                                  text: '(Optional)',
                                  style: kTextStyle.copyWith(color: kSubTitleColor),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
