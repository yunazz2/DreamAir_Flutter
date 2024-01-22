import 'package:country_code_picker/country_code_picker.dart';
import 'package:flight_booking/generated/l10n.dart' as lang;
import 'package:flight_booking/screen/booking/provider/booking_provider.dart';
import 'package:flight_booking/screen/seat/seat.dart';
import 'package:flight_booking/screen/widgets/button_global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

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

  TextEditingController _nameController = TextEditingController();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _birthController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String password = '';
  
  late List<bool> states;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    tabsController = TabController(length: 3, vsync: this);

    BookingProvider bookingProvider = Provider.of(context, listen: false);

    setState(() {
      states = List.generate(bookingProvider.getPasCount, (index) => false);
    });
    
  }

  

  List<String> discountList = [
    'WELCOME 쿠폰',
    '국내선 특가 쿠폰',
    '평일 노선 쿠폰',
  ];

  List<String> subDiscountList = [
    '첫 이용 고객에 한해서 20% 할인',
    '국내선 이용시 10% 할인',
    '평일 노선 이용시 10% 할인',
  ];

  List<String> selectedDiscountList = [];

  List<String> genderList = ['남자', '여자',];

  String selectedGender = '남자';

  bool isChecked = true;

  int selectedValue = 1;

  // List<String> chairType = [
  //   '주민등록증',
  //   '여권',
  //   '운전면허증',
  // ];

  // String selectedType = '주민등록증';

  // DropdownButton<String> getChairType() {
  //   List<DropdownMenuItem<String>> dropDownItems = [];
  //   for (String des in chairType) {
  //     var item = DropdownMenuItem(
  //       value: des,
  //       child: Text(des),
  //     );
  //     dropDownItems.add(item);
  //   }
  //   return DropdownButton(
  //     icon: const Icon(
  //       FeatherIcons.chevronDown,
  //       color: kSubTitleColor,
  //     ),
  //     items: dropDownItems,
  //     value: selectedType,
  //     onChanged: (value) {
  //       setState(() {
  //         selectedType = value!;
  //       });
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<BookingProvider>(
            builder: ((context, booking, child) => 
              DefaultTabController(
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
                        '예매내역 확인',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        '예매내역과 유의사항을 확인하세요.',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  bottomNavigationBar: Container(
                    decoration: const BoxDecoration(color: kWhite),
                    child: ListTile(
                      contentPadding: const EdgeInsets.only(left: 15.0, right: 15.0),
                      visualDensity: const VisualDensity(vertical: 2),
                      title: Text(
                        '${booking.getPasCount} 성인',
                        style: TextStyle(color: kSubTitleColor),
                      ),
                      subtitle: Text(
                        ' ${booking.getTotalPrice} 원',
                        style: TextStyle(color: kTitleColor, fontWeight: FontWeight.bold),
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
                            password = _passwordController.text;
                            setState(() {
                              const Seat().launch(context);         // 버튼
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
                      color: Colors.white,
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
                              color: Colors.white,
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
                                      image: DecorationImage(image: AssetImage('images/logo.png'), fit: BoxFit.cover),
                                    ),
                                  ),
                                  title: Text(
                                    '가는편 ${booking.getDeparture}${booking.getDepartureEng} - ${booking.getDestination}${booking.getDestinationEng}',
                                    style: TextStyle(color: kTitleColor, fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    '${booking.getDepartureDate.split('~')[0]} | ${booking.getDepartureTime} - ${booking.getDestinationTime} | ${booking.getDuration} 시간 | 직항',
                                    style: TextStyle(color: kSubTitleColor),
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
                                      image: DecorationImage(image: AssetImage('images/logo.png'), fit: BoxFit.cover),
                                    ),
                                  ),
                                  title: Text(
                                    '오는편 ${booking.getDestination}${booking.getDestinationEng} - ${booking.getDeparture}${booking.getDepartureEng}',
                                    style: TextStyle(color: kTitleColor, fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    '${booking.getRoundTrip == '편도' ? booking.getDepartureDate : booking.getDepartureDate.split('~')[1]} | ${booking.getDepartureTime} - ${booking.getDestinationTime} | ${booking.getDuration} 시간 | 직항',
                                    style: TextStyle(color: kSubTitleColor),
                                  ),
                                ).visible(booking.getRoundTrip != '편도'),
                                const Divider(
                                  thickness: 1.0,
                                  color: kBorderColorTextField,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),

                          //_________________________________________________________________________Baggage_policy
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
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
                                        '환불 위약금 및 수화물 안내사항',
                                        style: TextStyle(color: kTitleColor, fontWeight: FontWeight.bold),
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
                                                                    '환불 위약금 및 수화물 안내사항',
                                                                    style: TextStyle(color: kTitleColor, fontWeight: FontWeight.bold),
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
                                                                  text: '환불 위약금',
                                                                ),
                                                                Tab(
                                                                  text: '날짜 변경',
                                                                ),
                                                                Tab(
                                                                  text: '수화물',
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(height: 20.0),
                                                            SizedBox(
                                                              height: MediaQuery.of(context).size.height,
                                                              child: TabBarView(
                                                                controller: tabsController,
                                                                children: const [
                                                                  CancellationWidget(),     // 취소 수수료
                                                                  DateChangePolicy(),       // 날짜 변경
                                                                  BaggagePolicy(),          // 수화물
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
                                // TabBar(
                                //   labelStyle: kTextStyle.copyWith(color: Colors.white),
                                //   unselectedLabelColor: kSubTitleColor,
                                //   indicatorColor: kPrimaryColor,
                                //   labelColor: kPrimaryColor,
                                //   indicator: const UnderlineTabIndicator(borderSide: BorderSide(color: kPrimaryColor)),
                                //   indicatorSize: TabBarIndicatorSize.tab,
                                //   onTap: (index) {
                                //     setState(() {
                                //       selectedIndex = index;
                                //     });
                                //   },
                                //   tabs: const [
                                //     Tab(
                                //       text: 'DAC-CCU',
                                //     ),
                                //     Tab(
                                //       text: 'CCU-DAC',
                                //     ),
                                //   ],
                                // ),
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
                                          '  기내 수화물',
                                          maxLines: 1,
                                          style: TextStyle(
                                            color: kTitleColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        subtitle: Text(
                                          '  10Kg',
                                          maxLines: 1,
                                          style: TextStyle(
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
                                          '  위탁 수화물',
                                          maxLines: 1,
                                          style: TextStyle(
                                            color: kTitleColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        subtitle: Text(
                                          '  25Kg',
                                          maxLines: 1,
                                          style: TextStyle(
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


                          //_________________________________________________________________________offer & promo-code
                          Container(
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
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
                                      '할인 쿠폰',
                                      style: TextStyle(color: kTitleColor, fontWeight: FontWeight.bold),
                                    ),
                                    const Spacer(),
                                    
                                    // Container(
                                    //   padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
                                    //   decoration: BoxDecoration(
                                    //     color: kPrimaryColor,
                                    //     borderRadius: BorderRadius.circular(4.0),
                                    //   ),
                                    //   child: Text(
                                    //     '쿠폰 보기',
                                    //     style: TextStyle(color: Colors.white),
                                    //   ),
                                    // ),
                                  ],
                                ),
                                const Divider(
                                          thickness: 1.0,
                                          color: kBorderColorTextField,
                                        ),
                                const SizedBox(height: 20.0),
                                // TextFormField(
                                //   showCursor: false,
                                //   keyboardType: TextInputType.name,
                                //   cursorColor: kTitleColor,
                                //   decoration: kInputDecoration.copyWith(
                                //     contentPadding: const EdgeInsets.only(left: 10.0),
                                //     hintText: lang.S.of(context).promoCodeTitle,
                                //     hintStyle: kTextStyle.copyWith(color: kSubTitleColor),
                                //     focusColor: kTitleColor,
                                //     border: const OutlineInputBorder(),
                                //     suffixIcon: SizedBox(
                                //       width: 80,
                                //       child: Container(
                                //         decoration: BoxDecoration(
                                //           border: Border.all(color: kLightNeutralColor),
                                //           color: kLightNeutralColor.withOpacity(0.3),
                                //           borderRadius: const BorderRadius.only(
                                //             bottomRight: Radius.circular(30.0),
                                //             topRight: Radius.circular(30.0),
                                //           ),
                                //         ),
                                //         child: Center(
                                //           child: Text(
                                //             lang.S.of(context).applyButton,
                                //             style: TextStyle(color: kPrimaryColor),
                                //           ),
                                //         ),
                                //       ),
                                //     ),
                                //     enabledBorder: const OutlineInputBorder(
                                //       borderRadius: BorderRadius.all(
                                //         Radius.circular(30.0),
                                //       ),
                                //       borderSide: BorderSide(color: kLightNeutralColor, width: 1),
                                //     ),
                                //     focusedBorder: const OutlineInputBorder(
                                //       borderRadius: BorderRadius.all(
                                //         Radius.circular(30.0),
                                //       ),
                                //       borderSide: BorderSide(color: kLightNeutralColor, width: 1),
                                //     ),
                                //   ),
                                // ),
                                // const SizedBox(height: 20.0),
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
                                                  style: TextStyle(color: kTitleColor, fontWeight: FontWeight.bold),
                                                ),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                                Text(
                                                  subDiscountList[i],
                                                  style: TextStyle(color: kSubTitleColor),
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


                                                if (discountList[i] == 'WELCOME 쿠폰') {
                                                  booking.setTotalPrcie = booking.getDiscountPrice;
                                                  booking.setDiscount = 0.8;
                                                  booking.setTotalPrcie = (booking.getTotalPrice * booking.getDiscount).toInt();
                                                } else if (discountList[i] == '국내선 특가 쿠폰') {
                                                  booking.setTotalPrcie = booking.getDiscountPrice;
                                                  booking.setDiscount = 0.9;
                                                  booking.setTotalPrcie = (booking.getTotalPrice * booking.getDiscount).toInt();
                                                } else if (discountList[i] == '평일 노선 쿠폰') {
                                                  booking.setTotalPrcie = booking.getDiscountPrice;
                                                  booking.setDiscount = 0.9;
                                                  booking.setTotalPrcie = (booking.getTotalPrice * booking.getDiscount).toInt();
                                                }


                                                setState(
                                                  () {
                                                    if (selectedDiscountList.contains(discountList[i])) {
                                                      selectedDiscountList.remove(discountList[i]);
                                                    } else {
                                                      selectedDiscountList = [discountList[i]];
                                                    }
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
                              color: Colors.white,
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
                                  '탑승객 정보',
                                  style: TextStyle(color: kTitleColor, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 10.0),
                                ListView.builder(
                                  itemCount: booking.pasCount,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  padding: const EdgeInsets.only(bottom: 15.0),
                                  itemBuilder: (_, i) {
                                    return ButtonGlobalWithIcon(
                                              buttontext: states[i] ? '탑승객 정보 입력완료' : '탑승객 정보 입력',   
                                              buttonTextColor: kPrimaryColor,
                                              buttonIcon: states[i] ? null : FeatherIcons.plus,
                                              buttonDecoration: kButtonDecoration.copyWith(
                                                color: Colors.white,
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
                                                                          '탑승객 정보 입력',
                                                                          style: TextStyle(color: kTitleColor, fontWeight: FontWeight.bold),
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
                                                                      color: Colors.white,
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
                                                                          '성별',
                                                                          style: TextStyle(color: kSubTitleColor),
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
                                                                                      selectedGender = value.toString();      // 성별 입력
                                                                                    });
                                                                                  },
                                                                                ),
                                                                                Text(
                                                                                  genderList[i],
                                                                                  style: TextStyle(
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
                                                                          autovalidateMode: AutovalidateMode.disabled,
                                                                          controller: _nameController,
                                                                          keyboardType: TextInputType.emailAddress,
                                                                          cursorColor: kTitleColor,
                                                                          textInputAction: TextInputAction.next,
                                                                          decoration: kInputDecoration.copyWith(
                                                                            labelText: '이름',      // 이름
                                                                            labelStyle: TextStyle(color: kTitleColor),
                                                                            hintText: '이름을 입력하세요.',
                                                                            hintStyle: kTextStyle.copyWith(color: kSubTitleColor),
                                                                            focusColor: kTitleColor,
                                                                            border: const OutlineInputBorder(),
                                                                          ),
                                                                        ),
                                                                        const SizedBox(height: 20.0),
                                                                        TextFormField(
                                                                          autovalidateMode: AutovalidateMode.disabled,
                                                                          controller: _firstNameController,
                                                                          keyboardType: TextInputType.emailAddress,
                                                                          cursorColor: kTitleColor,
                                                                          textInputAction: TextInputAction.next,
                                                                          decoration: kInputDecoration.copyWith(
                                                                            labelText: '이름(영문)',
                                                                            labelStyle: TextStyle(color: kTitleColor),
                                                                            hintText: '영문 이름을 입력하세요.',
                                                                            hintStyle: kTextStyle.copyWith(color: kSubTitleColor),
                                                                            focusColor: kTitleColor,
                                                                            border: const OutlineInputBorder(),
                                                                          ),
                                                                        ),
                                                                        const SizedBox(height: 20.0),
                                                                        TextFormField(
                                                                          controller: _lastNameController,
                                                                          keyboardType: TextInputType.emailAddress,
                                                                          cursorColor: kTitleColor,
                                                                          textInputAction: TextInputAction.next,
                                                                          decoration: kInputDecoration.copyWith(
                                                                            labelText: '성(영문)',
                                                                            labelStyle: TextStyle(color: kTitleColor),
                                                                            hintText: '영문 성을 입력하세요.',
                                                                            hintStyle: kTextStyle.copyWith(color: kSubTitleColor),
                                                                            focusColor: kTitleColor,
                                                                            border: const OutlineInputBorder(),
                                                                          ),
                                                                        ),
                                                                        const SizedBox(height: 20.0),
                                                                        TextFormField(
                                                                          controller: _birthController,
                                                                          keyboardType: TextInputType.emailAddress,
                                                                          cursorColor: kTitleColor,
                                                                          textInputAction: TextInputAction.next,
                                                                          decoration: kInputDecoration.copyWith(
                                                                            labelText: '생년월일',
                                                                            labelStyle: TextStyle(color: kTitleColor),
                                                                            hintText: '생년월일을 입력하세요.',
                                                                            hintStyle: kTextStyle.copyWith(color: kSubTitleColor),
                                                                            focusColor: kTitleColor,
                                                                            border: const OutlineInputBorder(),
                                                                          ),
                                                                        ),
                                                                        const SizedBox(height: 20.0),
                                                                        TextFormField(
                                                                          controller: _phoneController,
                                                                          keyboardType: TextInputType.emailAddress,
                                                                          cursorColor: kTitleColor,
                                                                          textInputAction: TextInputAction.next,
                                                                          decoration: kInputDecoration.copyWith(
                                                                            labelText: '핸드폰 번호',
                                                                            labelStyle: TextStyle(color: kTitleColor),
                                                                            hintText: "'-'없이 핸드폰 번호를 입력하세요.",
                                                                            hintStyle: kTextStyle.copyWith(color: kSubTitleColor),
                                                                            focusColor: kTitleColor,
                                                                            border: const OutlineInputBorder(),
                                                                          ),
                                                                        ),
                                                                        const SizedBox(height: 20.0),
                                                                        TextFormField(
                                                                          controller: _emailController,
                                                                          keyboardType: TextInputType.emailAddress,
                                                                          cursorColor: kTitleColor,
                                                                          textInputAction: TextInputAction.next,
                                                                          decoration: kInputDecoration.copyWith(
                                                                            labelText: '이메일',
                                                                            labelStyle: TextStyle(color: kTitleColor),
                                                                            hintText: '이메일을 입력하세요.',
                                                                            hintStyle: kTextStyle.copyWith(color: kSubTitleColor),
                                                                            focusColor: kTitleColor,
                                                                            border: const OutlineInputBorder(),
                                                                          ),
                                                                        ),
                                                                        const SizedBox(height: 20.0),
                                                                        DropdownButton<int>(
                                                                          isExpanded: true,
                                                                          value: selectedValue,
                                                                          items: [
                                                                            DropdownMenuItem<int>(
                                                                              value: 1,
                                                                              child: Text('주민등록증'),
                                                                            ),
                                                                            DropdownMenuItem<int>(
                                                                              value: 2,
                                                                              child: Text('여권'),
                                                                            ),
                                                                            DropdownMenuItem<int>(
                                                                              value: 3,
                                                                              child: Text('운전면허증'),
                                                                            ),
                                                                          ],
                                                                          onChanged: (value) {
                                                                            setState(() {
                                                                              selectedValue = value!;
                                                                            });
                                                                          },
                                                                        ),

                                                                        // FormField(
                                                                        //   builder: (FormFieldState<dynamic> field) {
                                                                        //     return InputDecorator(
                                                                        //       decoration: const InputDecoration(
                                                                        //           enabledBorder: OutlineInputBorder(
                                                                        //             borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                                                        //             borderSide: BorderSide(color: kBorderColorTextField, width: 2),
                                                                        //           ),
                                                                        //           contentPadding: EdgeInsets.all(7.0),
                                                                        //           floatingLabelBehavior: FloatingLabelBehavior.always,
                                                                        //           labelText: '신분증 종류'),
                                                                        //       child: DropdownButtonHideUnderline(child: getChairType()),
                                                                        //     );
                                                                        //   },
                                                                        // ),
                                                                        const SizedBox(height: 20.0),
                                                                        ButtonGlobalWithoutIcon(
                                                                          buttontext: '입력 완료',
                                                                          buttonDecoration: kButtonDecoration.copyWith(
                                                                            color: kPrimaryColor,
                                                                            borderRadius: BorderRadius.circular(30.0),
                                                                          ),
                                                                          onPressed: () {
                                                                            booking.setPassengerNames = _nameController.text;
                                                                            booking.setFirstNames = _firstNameController.text;
                                                                            booking.setLastNames = _lastNameController.text;
                                                                            booking.setBirths = _birthController.text;
                                                                            booking.setPhones = _phoneController.text;
                                                                            booking.setEmails = _emailController.text;
                                                                            booking.setGenders = selectedGender;
                                                                            booking.setPinTypes = selectedValue;
                                                                            
                                                                            print(booking.getPinTypes[0]);

                                                                            setState(() {
                                                                              states[i] = !states[i];
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
                                            );
                                  } ,
                                ),
                                Text(
                                  '비회원 비밀번호',
                                  style: TextStyle(color: kTitleColor, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 10.0),
                                TextFormField(
                                  controller: _passwordController,
                                  obscureText: true,
                                  keyboardType: TextInputType.emailAddress,
                                  cursorColor: kTitleColor,
                                  textInputAction: TextInputAction.next,
                                  decoration: kInputDecoration.copyWith(
                                    labelText: '비밀번호',
                                    labelStyle: TextStyle(color: kTitleColor),
                                    hintText: '비회원 예매 비밀번호를 입력하세요.',
                                    hintStyle: kTextStyle.copyWith(color: kSubTitleColor),
                                    focusColor: kTitleColor,
                                    border: const OutlineInputBorder(),
                                  ),
                                ),
                                const SizedBox(height: 20.0),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10.0),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ) 
          );
  }
}
