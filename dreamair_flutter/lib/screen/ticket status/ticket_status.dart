import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nb_utils/nb_utils.dart';

import '../widgets/constant.dart';
import 'package:flight_booking/generated/l10n.dart' as lang;

class TicketStatus extends StatefulWidget {
  const TicketStatus({Key? key}) : super(key: key);

  @override
  State<TicketStatus> createState() => _TicketStatusState();
}

class _TicketStatusState extends State<TicketStatus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        title: Text(lang.S.of(context).ticketStatusTitle),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(color: kDarkWhite),
        child: Container(
          padding: const EdgeInsets.all(10.0),
          height: 90,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: kDarkWhite,
                offset: Offset(
                  0,
                  -2,
                ),
                blurRadius: 7.0,
                spreadRadius: 2.0,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    elevation: 0.0,
                    backgroundColor: kPrimaryColor,
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Download',
                        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: Colors.white),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      FaIcon(
                        FeatherIcons.downloadCloud,
                        size: 25,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFFF9F9F9),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16.0)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 47,
                        width: 53,
                        decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: DecorationImage(image: AssetImage('images/logo3.png'), fit: BoxFit.cover),
                        ),
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'E-Ticket',
                            style: TextStyle(color: kTitleColor, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Booking ID- EMT9456544',
                            style: TextStyle(color: kSubTitleColor, fontSize: 12.0),
                          ),
                          Text(
                            'Booking on - Wed, 09 Feb 2023 - 14:27',
                            style: TextStyle(color: kSubTitleColor, fontSize: 12.0),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    children: List.generate(
                        800 ~/ 10,
                            (index) => Expanded(
                          child: Container(
                            color: index % 2 == 0 ? Colors.transparent : kPrimaryColor.withOpacity(0.5),
                            height: 1,
                          ),
                        )),
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: kBorderColorTextField),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTileTheme(
                            contentPadding: const EdgeInsets.all(0),
                            dense: true,
                            horizontalTitleGap: 0.0,
                            minLeadingWidth: 0,
                            child: ListTile(
                              visualDensity: const VisualDensity(vertical: -4),
                              dense: true,
                              horizontalTitleGap: 10.0,
                              contentPadding: EdgeInsets.zero,
                              leading: Container(
                                height: 24.0,
                                width: 24.0,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(image: AssetImage('images/indigo.png'), fit: BoxFit.cover),
                                ),
                              ),
                              title: Text(
                                'IndiGo',
                                style: TextStyle(color: kTitleColor, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                '6E-376',
                                style: TextStyle(color: kSubTitleColor),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'DAC',
                                        style: TextStyle(color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 12),
                                      ),
                                      const SizedBox(width: 5.0),
                                      Text(
                                        '15:45',
                                        style: TextStyle(color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 12),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5.0),
                                  Text(
                                    'Sun 6 Jan 2023',
                                    style: TextStyle(color: kSubTitleColor, fontSize: 12),
                                  ),
                                  const SizedBox(height: 5.0),
                                  Text(
                                    'Terminal 3',
                                    style: TextStyle(color: kSubTitleColor, fontSize: 12),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 5.0),
                              Column(
                                children: [
                                  Text(
                                    '3h 40m',
                                    style: TextStyle(color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 12),
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
                                            width: 80,
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
                                              Icons.arrow_right_alt_outlined,
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
                                    'Economy',
                                    style: TextStyle(color: kSubTitleColor, fontSize: 12),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 5.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'DAC',
                                        style: TextStyle(color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 12),
                                      ),
                                      const SizedBox(width: 5.0),
                                      Text(
                                        '15:45',
                                        style: TextStyle(color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 12),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5.0),
                                  Text(
                                    'Sun 6 Jan 2023',
                                    style: TextStyle(color: kSubTitleColor, fontSize: 12),
                                  ),
                                  const SizedBox(height: 5.0),
                                  Text(
                                    'Terminal 3',
                                    style: TextStyle(color: kSubTitleColor, fontSize: 12),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5.0),
                          decoration: const BoxDecoration(
                            color: kSecondaryColor,
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.luggage,
                                color: kTitleColor,
                              ),
                              Text(
                                'Baggage:',
                                style: TextStyle(color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 12.0),
                              ),
                              const Spacer(),
                              Text(
                                'Cabin - Contact to\nAirlines:',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: kTitleColor, fontSize: 10.0),
                              ),
                              const Spacer(),
                              Column(
                                children: [
                                  Text(
                                    'Check -in 30 kgs',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(color: kTitleColor, fontSize: 10.0),
                                  ),
                                  Text(
                                    'Checked 50 kgs',
                                    textAlign: TextAlign.end,
                                    style: TextStyle(color: kTitleColor, fontSize: 10.0),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    children: List.generate(
                        800 ~/ 10,
                            (index) => Expanded(
                          child: Container(
                            color: index % 2 == 0 ? Colors.transparent : kPrimaryColor.withOpacity(0.5),
                            height: 1,
                          ),
                        )),
                  ),
                  const SizedBox(height: 15.0),
                  Text(
                    'Traveler Details',
                    style: TextStyle(color: kTitleColor, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0), border: Border.all(color: kBorderColorTextField)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Passenger Name',
                                    style: TextStyle(color: kSubTitleColor, fontSize: 10.0),
                                  ),
                                  const SizedBox(height: 5.0),
                                  Text(
                                    'Mr.Shiadul Islam',
                                    style: TextStyle(color: kTitleColor, fontSize: 10.0, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Airline PNR',
                                    style: TextStyle(color: kSubTitleColor, fontSize: 10.0),
                                  ),
                                  const SizedBox(height: 5.0),
                                  Text(
                                    'A70G26',
                                    style: TextStyle(color: kTitleColor, fontSize: 10.0, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Ticket Number',
                                    style: TextStyle(color: kSubTitleColor, fontSize: 10.0),
                                  ),
                                  const SizedBox(height: 5.0),
                                  Text(
                                    '999458154454',
                                    style: TextStyle(color: kTitleColor, fontSize: 10.0, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5.0),
                        const Divider(
                          thickness: 1.0,
                          color: kBorderColorTextField,
                        ),
                        const SizedBox(height: 5.0),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Travel Insurance',
                                    style: TextStyle(color: kSubTitleColor, fontSize: 10.0),
                                  ),
                                  const SizedBox(height: 5.0),
                                  Text(
                                    'Not Confirmed',
                                    style: TextStyle(color: kTitleColor, fontSize: 10.0, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Class | Cabin',
                                    style: TextStyle(color: kSubTitleColor, fontSize: 10.0),
                                  ),
                                  const SizedBox(height: 5.0),
                                  Text(
                                    'V | Economy',
                                    style: TextStyle(color: kTitleColor, fontSize: 10.0, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Status',
                                    style: TextStyle(color: kSubTitleColor, fontSize: 10.0),
                                  ),
                                  const SizedBox(height: 5.0),
                                  Text(
                                    'Confirm',
                                    style: TextStyle(color: Colors.green, fontSize: 10.0, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    children: List.generate(
                        800 ~/ 10,
                            (index) => Expanded(
                          child: Container(
                            color: index % 2 == 0 ? Colors.transparent : kPrimaryColor.withOpacity(0.5),
                            height: 1,
                          ),
                        )),
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    width: context.width(),
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0), border: Border.all(color: kBorderColorTextField)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Fare Summary',
                          style: TextStyle(
                            color: kTitleColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Text(
                                'Basic Fare',
                                style: TextStyle(
                                  color: kSubTitleColor,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Row(
                                children: [
                                  Text(
                                    ':',
                                    style: TextStyle(
                                      color: kSubTitleColor,
                                    ),
                                  ),
                                  const SizedBox(width: 20.0),
                                  Text(
                                    '$currencySign${13000}',
                                    style: TextStyle(
                                      color: kSubTitleColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Text(
                                'Taxes',
                                style: TextStyle(
                                  color: kSubTitleColor,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Row(
                                children: [
                                  Text(
                                    ':',
                                    style: TextStyle(
                                      color: kSubTitleColor,
                                    ),
                                  ),
                                  const SizedBox(width: 20.0),
                                  Text(
                                    '$currencySign${2000}',
                                    style: TextStyle(
                                      color: kSubTitleColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Text(
                                'Reschedule Charges',
                                style: TextStyle(
                                  color: kSubTitleColor,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Row(
                                children: [
                                  Text(
                                    ':',
                                    style: TextStyle(
                                      color: kSubTitleColor,
                                    ),
                                  ),
                                  const SizedBox(width: 20.0),
                                  Text(
                                    '$currencySign${0}',
                                    style: TextStyle(
                                      color: kSubTitleColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Text(
                                'K3',
                                style: TextStyle(
                                  color: kSubTitleColor,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Row(
                                children: [
                                  Text(
                                    ':',
                                    style: TextStyle(
                                      color: kSubTitleColor,
                                    ),
                                  ),
                                  const SizedBox(width: 20.0),
                                  Text(
                                    '$currencySign${0}',
                                    style: TextStyle(
                                      color: kSubTitleColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Text(
                                'Coupon offer',
                                style: TextStyle(
                                  color: kPrimaryColor,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Row(
                                children: [
                                  Text(
                                    ':',
                                    style: TextStyle(
                                      color: kSubTitleColor,
                                    ),
                                  ),
                                  const SizedBox(width: 20.0),
                                  Text(
                                    '$currencySign${500}',
                                    style: TextStyle(
                                      color: kSubTitleColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Text(
                                'Total',
                                style: TextStyle(color: kTitleColor, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Row(
                                children: [
                                  Text(
                                    ':',
                                    style: TextStyle(
                                      color: kSubTitleColor,
                                    ),
                                  ),
                                  const SizedBox(width: 20.0),
                                  Text(
                                    '$currencySign${14500}',
                                    style: TextStyle(color: kTitleColor, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              height: 52,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(8.0),
                                ),
                                color: kSecondaryColor,
                                border: Border.all(color: kBorderColorTextField),
                              ),
                              child: Text(
                                'Dhaka - Delhi',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: kTitleColor, fontSize: 12),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              height: 52,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(8.0),
                                ),
                                color: kSecondaryColor,
                                border: Border.all(color: kBorderColorTextField),
                              ),
                              child: Text(
                                'Cancellation\nCharges',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: kTitleColor, fontSize: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 52,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: kSecondaryColor,
                                      border: Border.all(color: kBorderColorTextField),
                                    ),
                                    child: Text(
                                      'Type',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: kTitleColor, fontSize: 12),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    height: 52,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: kSecondaryColor,
                                      border: Border.all(color: kBorderColorTextField),
                                    ),
                                    child: Text(
                                      'Cancellation Time',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: kSubTitleColor, fontSize: 12),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              height: 52,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: kSecondaryColor,
                                border: Border.all(color: kBorderColorTextField),
                              ),
                              child: Text(
                                'Airline',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: kSubTitleColor, fontSize: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 52,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: kBorderColorTextField),
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(8.0),
                                      ),
                                    ),
                                    child: Text(
                                      'ADT',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: kTitleColor, fontSize: 12),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                    height: 52,
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: kBorderColorTextField),
                                    ),
                                    child: Text(
                                      'Before 4 hours of Flight departure',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: kSubTitleColor, fontSize: 12),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              height: 52,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(8.0),
                                ),
                                border: Border.all(color: kBorderColorTextField),
                              ),
                              child: Text(
                                'As per airlines T&C',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: kSubTitleColor, fontSize: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    width: context.width(),
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0), border: Border.all(color: kBorderColorTextField)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Terms & Conditions',
                          style: TextStyle(
                            color: kTitleColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Row(
                          children: [
                             Icon(
                              MdiIcons.circleMedium,
                              color: kSubTitleColor,
                            ),
                            Text(
                              'Lorem ipsum dolor sit amet consectetur. Quisque',
                              style: TextStyle(color: kSubTitleColor, fontSize: 12),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Icon(
                              MdiIcons.circleMedium,
                              color: kSubTitleColor,
                            ),
                            Text(
                              ' nulla bibendum nibh augue porta consequat.',
                              style: TextStyle(color: kSubTitleColor, fontSize: 12),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                             Icon(
                              MdiIcons.circleMedium,
                              color: kSubTitleColor,
                            ),
                            Text(
                              'Aliquet nam arcu potenti congue risus quam.',
                              style: TextStyle(color: kSubTitleColor, fontSize: 12),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                             Icon(
                              MdiIcons.circleMedium,
                              color: kSubTitleColor,
                            ),
                            Text(
                              'enim blandit in eget quam magna donec magna\n scelerisque. Interdum sed in convallis',
                              style: TextStyle(color: kSubTitleColor, fontSize: 12),
                              textAlign: TextAlign.start,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                             Icon(
                              MdiIcons.circleMedium,
                              color: kSubTitleColor,
                            ),
                            Text(
                              'varius sapien ullamcorper posuere. Sem tortor\n eros volutpat pulvinar. Platea suspendisse ut\n condimen tum felis. Duis amet lobortis\n lacus nibh ',
                              style: TextStyle(color: kSubTitleColor, fontSize: 12),
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
