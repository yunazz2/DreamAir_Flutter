import 'package:flight_booking/screen/booking/provider/booking_provider.dart';
import 'package:flight_booking/screen/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flight_booking/generated/l10n.dart' as lang;
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class goSearch extends StatefulWidget {
  const goSearch({Key? key}) : super(key: key);

  @override
  State<goSearch> createState() => _goSearchState();
}

class _goSearchState extends State<goSearch> {

  List<String> airportItems = [
    '김포',
    '제주',
    '부산',
    '울산',
    '여수',
  ];

  List<String> subTitleItems = [
    '(GMP)',
    '(CJU)',
    '(PUS)',
    '(USN)',
    '(RSU)',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: Text('목적지'),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            FeatherIcons.x,
            color: kWhite,
          ),
        ),
      ),
      body: Consumer<BookingProvider> (
            builder: (context, booking, child) => 
              Container(
                height: context.height(),
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                  color: kWhite,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '목적지를 선택하세요.',
                        style: kTextStyle.copyWith(color: kSubTitleColor, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10.0),
                      // 출발지 목록
                      ListView.builder(
                          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: airportItems.length,
                          shrinkWrap: true,
                          itemBuilder: (_, i) {
                            if (booking.getDeparture == airportItems[i]) {
                              return SizedBox.shrink();
                            }
                            return Column(
                              children: [
                                ListTile(
                                  dense: true,
                                  visualDensity: const VisualDensity(vertical: -2),
                                  horizontalTitleGap: 10.0,
                                  contentPadding: EdgeInsets.zero,
                                  leading: Container(
                                    padding: const EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(shape: BoxShape.circle, color: kPrimaryColor.withOpacity(0.1)),
                                    child: const Icon(
                                      Icons.flight,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                  title: Text(
                                    '${airportItems[i]}',
                                    style: kTextStyle.copyWith(
                                      color: kTitleColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: Text(
                                    '${subTitleItems[i]}',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: kTextStyle.copyWith(color: kSubTitleColor),
                                  ),
                                  onTap: () {
                                    booking.setDeparture = airportItems[i];
                                    booking.setDepartureEng = subTitleItems[i];
                                    Navigator.pop(context);
                                  },
                                ),
                                const Divider(
                                  thickness: 1.0,
                                  color: kBorderColorTextField,
                                ),
                              ],
                            );
                          }
                        )
                    ],
                  ),
                ),
              ),
        ) 
    );
  }
}
