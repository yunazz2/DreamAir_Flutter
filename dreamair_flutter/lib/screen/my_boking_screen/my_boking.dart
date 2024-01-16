// 예약 조회 페이지
import 'package:flight_booking/generated/l10n.dart' as lang;
import 'package:flight_booking/screen/widgets/constant.dart';
import 'package:flutter/material.dart';

import '../ticket status/ticket_status.dart';

class MyBooking extends StatefulWidget {
  const MyBooking({Key? key}) : super(key: key);

  @override
  State<MyBooking> createState() => _MyBookingState();
}

class _MyBookingState extends State<MyBooking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        titleSpacing: 0,
        elevation: 0,
        backgroundColor: kPrimaryColor,
        iconTheme: const IconThemeData(color: kWhite),
        centerTitle: true,
        title: Text(
          lang.S.of(context).myBookingTitle,
          style: kTextStyle.copyWith(
            color: kWhite,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10.0),
          decoration: const BoxDecoration(
            color: kWhite,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (_, i) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: kBorderColorTextField,
                          )),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Paid: \$14500.',
                                    style: kTextStyle.copyWith(
                                      fontSize: 14,
                                      color: kTitleColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Convenience Fee Added',
                                    style: kTextStyle.copyWith(fontSize: 12, color: kSubTitleColor),
                                  )
                                ],
                              ),
                              Text(
                                'Completed',
                                style: kTextStyle.copyWith(
                                  fontSize: 12,
                                  color: const Color(0xff00CD46),
                                ),
                              )
                            ],
                          ),
                          const Divider(
                            thickness: 1.0,
                            color: kBorderColorTextField,
                          ),
                          ListTile(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const TicketStatus(),
                                ),
                              );
                            },
                            horizontalTitleGap: 5.0,
                            contentPadding: EdgeInsets.zero,
                            minLeadingWidth: 0,
                            leading: Container(
                              height: 34.0,
                              width: 34.0,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(image: AssetImage('images/indigo.png'), fit: BoxFit.cover),
                              ),
                            ),
                            title: Row(
                              children: [
                                Text(
                                  'Dhaka',
                                  style: kTextStyle.copyWith(color: kTitleColor),
                                ),
                                const SizedBox(width: 2.0),
                                const Icon(
                                  Icons.swap_horiz,
                                  color: kLightNeutralColor,
                                ),
                                const SizedBox(width: 2.0),
                                Text(
                                  'New Delhi',
                                  style: kTextStyle.copyWith(fontSize: 14, color: kTitleColor),
                                )
                              ],
                            ),
                            subtitle: Text(
                              'Thu, 6 Jan |  11:40pm - 05:25pm | 5h 25m | 1 Stop',
                              style: kTextStyle.copyWith(fontSize: 12, color: kSubTitleColor),
                            ),
                          ),
                          const SizedBox(
                            height: 3.0,
                          ),
                          const Divider(
                            thickness: 1.0,
                            color: kBorderColorTextField,
                          ),
                          const Text(
                            'Shaidul Islam (Male)',
                            style: TextStyle(fontSize: 12, color: kTitleColor),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
