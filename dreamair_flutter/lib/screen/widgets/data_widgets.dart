import 'package:flutter/material.dart';

import 'constant.dart';


class CancellationWidget extends StatelessWidget {
  const CancellationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: kBorderColorTextField,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            dense: true,
            visualDensity: const VisualDensity(vertical: -4),
            horizontalTitleGap: 0,
            contentPadding: const EdgeInsets.only(left: 10.0),
            leading: Container(
              width: 24,
              height: 24,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(image: AssetImage('images/indigo.png'), fit: BoxFit.cover),
              ),
            ),
            title: Text(
              'DAC - CCU',
              maxLines: 1,
              style: kTextStyle.copyWith(
                color: kTitleColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: kWhite,
                    border: Border.all(color: kBorderColorTextField),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Time frame',
                                style: kTextStyle.copyWith(
                                    color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                              Text(
                                'From scheduled flight departure',
                                textAlign: TextAlign.start,
                                style: kTextStyle.copyWith(color: kSubTitleColor, fontSize: 10),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Airline Fee + MMT Fee',
                                style: kTextStyle.copyWith(
                                    color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                              Text(
                                '(Per Passenger)',
                                textAlign: TextAlign.end,
                                style: kTextStyle.copyWith(color: kSubTitleColor, fontSize: 10),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: kWhite,
                          border: Border.all(color: kBorderColorTextField),
                        ),
                        child: Column(
                          children: [
                            Text(
                              '0 hours to 24 hours*',
                              style: kTextStyle.copyWith(
                                  color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            const SizedBox(height: 20.0),
                            Text(
                              '24 Hours to 365 day*',
                              textAlign: TextAlign.start,
                              style: kTextStyle.copyWith(
                                  color: kTitleColor, fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: kWhite,
                          border: Border.all(color: kBorderColorTextField),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'ADULT: Non Refundable',
                              style: kTextStyle.copyWith(
                                  color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            const SizedBox(height: 20.0),
                            Text(
                              'ADULT: Non Refundable',
                              textAlign: TextAlign.start,
                              style: kTextStyle.copyWith(
                                  color: kTitleColor, fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  'From the date of departure',
                  style: kTextStyle.copyWith(color: kSubTitleColor),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          ListTile(
            dense: true,
            visualDensity: const VisualDensity(vertical: -4),
            horizontalTitleGap: 0,
            contentPadding: const EdgeInsets.only(left: 10.0),
            leading: Container(
              width: 24,
              height: 24,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(image: AssetImage('images/indigo.png'), fit: BoxFit.cover),
              ),
            ),
            title: Text(
              'DAC - CCU',
              maxLines: 1,
              style: kTextStyle.copyWith(
                color: kTitleColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: kWhite,
                    border: Border.all(color: kBorderColorTextField),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Time frame',
                                style: kTextStyle.copyWith(
                                    color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                              Text(
                                'From scheduled flight departure',
                                textAlign: TextAlign.start,
                                style: kTextStyle.copyWith(color: kSubTitleColor, fontSize: 10),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Airline Fee + MMT Fee',
                                style: kTextStyle.copyWith(
                                    color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                              Text(
                                '(Per Passenger)',
                                textAlign: TextAlign.end,
                                style: kTextStyle.copyWith(color: kSubTitleColor, fontSize: 10),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: kWhite,
                          border: Border.all(color: kBorderColorTextField),
                        ),
                        child: Column(
                          children: [
                            Text(
                              '0 hours to 24 hours*',
                              style: kTextStyle.copyWith(
                                  color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            const SizedBox(height: 20.0),
                            Text(
                              '24 Hours to 365 day*',
                              textAlign: TextAlign.start,
                              style: kTextStyle.copyWith(
                                  color: kTitleColor, fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: kWhite,
                          border: Border.all(color: kBorderColorTextField),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'ADULT: Non Refundable',
                              style: kTextStyle.copyWith(
                                  color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            const SizedBox(height: 20.0),
                            Text(
                              'ADULT: Non Refundable',
                              textAlign: TextAlign.start,
                              style: kTextStyle.copyWith(
                                  color: kTitleColor, fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  'From the date of departure',
                  style: kTextStyle.copyWith(color: kSubTitleColor),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DateChangePolicy extends StatelessWidget {
  const DateChangePolicy({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: kBorderColorTextField,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            dense: true,
            visualDensity: const VisualDensity(vertical: -4),
            horizontalTitleGap: 0,
            contentPadding: const EdgeInsets.only(left: 10.0),
            leading: Container(
              width: 24,
              height: 24,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(image: AssetImage('images/indigo.png'), fit: BoxFit.cover),
              ),
            ),
            title: Text(
              'DAC - CCU',
              maxLines: 1,
              style: kTextStyle.copyWith(
                color: kTitleColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: kWhite,
                    border: Border.all(color: kBorderColorTextField),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Time frame',
                                style: kTextStyle.copyWith(
                                    color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                              Text(
                                'From scheduled flight departure',
                                textAlign: TextAlign.start,
                                style: kTextStyle.copyWith(color: kSubTitleColor, fontSize: 10),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Airline Fee + MMT Fee',
                                style: kTextStyle.copyWith(
                                    color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                              Text(
                                '(Per Passenger)',
                                textAlign: TextAlign.end,
                                style: kTextStyle.copyWith(color: kSubTitleColor, fontSize: 10),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: kWhite,
                          border: Border.all(color: kBorderColorTextField),
                        ),
                        child: Column(
                          children: [
                            Text(
                              '0 hours to 24 hours*',
                              style: kTextStyle.copyWith(
                                  color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            const SizedBox(height: 20.0),
                            Text(
                              '24 Hours to 365 day*',
                              textAlign: TextAlign.start,
                              style: kTextStyle.copyWith(
                                  color: kTitleColor, fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: kWhite,
                          border: Border.all(color: kBorderColorTextField),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'ADULT: Non Refundable',
                              style: kTextStyle.copyWith(
                                  color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            const SizedBox(height: 20.0),
                            Text(
                              'ADULT: Non Refundable',
                              textAlign: TextAlign.start,
                              style: kTextStyle.copyWith(
                                  color: kTitleColor, fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  'From the date of departure',
                  style: kTextStyle.copyWith(color: kSubTitleColor),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          ListTile(
            dense: true,
            visualDensity: const VisualDensity(vertical: -4),
            horizontalTitleGap: 0,
            contentPadding: const EdgeInsets.only(left: 10.0),
            leading: Container(
              width: 24,
              height: 24,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(image: AssetImage('images/indigo.png'), fit: BoxFit.cover),
              ),
            ),
            title: Text(
              'DAC - CCU',
              maxLines: 1,
              style: kTextStyle.copyWith(
                color: kTitleColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: kWhite,
                    border: Border.all(color: kBorderColorTextField),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Time frame',
                                style: kTextStyle.copyWith(
                                    color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                              Text(
                                'From scheduled flight departure',
                                textAlign: TextAlign.start,
                                style: kTextStyle.copyWith(color: kSubTitleColor, fontSize: 10),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Airline Fee + MMT Fee',
                                style: kTextStyle.copyWith(
                                    color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                              Text(
                                '(Per Passenger)',
                                textAlign: TextAlign.end,
                                style: kTextStyle.copyWith(color: kSubTitleColor, fontSize: 10),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: kWhite,
                          border: Border.all(color: kBorderColorTextField),
                        ),
                        child: Column(
                          children: [
                            Text(
                              '0 hours to 24 hours*',
                              style: kTextStyle.copyWith(
                                  color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            const SizedBox(height: 20.0),
                            Text(
                              '24 Hours to 365 day*',
                              textAlign: TextAlign.start,
                              style: kTextStyle.copyWith(
                                  color: kTitleColor, fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: kWhite,
                          border: Border.all(color: kBorderColorTextField),
                        ),
                        child: Column(
                          children: [
                            Text(
                              'ADULT: Non Refundable',
                              style: kTextStyle.copyWith(
                                  color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            const SizedBox(height: 20.0),
                            Text(
                              'ADULT: Non Refundable',
                              textAlign: TextAlign.start,
                              style: kTextStyle.copyWith(
                                  color: kTitleColor, fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  'From the date of departure',
                  style: kTextStyle.copyWith(color: kSubTitleColor),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BaggagePolicy extends StatelessWidget {
  const BaggagePolicy({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: kBorderColorTextField,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            dense: true,
            visualDensity: const VisualDensity(vertical: -4),
            horizontalTitleGap: 0,
            contentPadding: const EdgeInsets.only(left: 10.0, top: 10),
            leading: Container(
              width: 24,
              height: 24,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(image: AssetImage('images/indigo.png'), fit: BoxFit.cover),
              ),
            ),
            title: Text(
              'DAC - CCU',
              maxLines: 1,
              style: kTextStyle.copyWith(
                color: kTitleColor,
                fontWeight: FontWeight.bold,
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
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: 40,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: kWhite,
                          border: Border.all(color: kBorderColorTextField),
                        ),
                        child: Text(
                          'Cabin',
                          textAlign: TextAlign.center,
                          style: kTextStyle.copyWith(color: kTitleColor, fontSize: 12),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 40,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: kWhite,
                          border: Border.all(color: kBorderColorTextField),
                        ),
                        child: Text(
                          'Check -in',
                          textAlign: TextAlign.center,
                          style: kTextStyle.copyWith(color: kTitleColor, fontSize: 12),
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
                              height: 40,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: kWhite,
                                border: Border.all(color: kBorderColorTextField),
                              ),
                              child: Text(
                                'ADULT',
                                textAlign: TextAlign.center,
                                style: kTextStyle.copyWith(color: kTitleColor, fontSize: 12),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              height: 40,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: kWhite,
                                border: Border.all(color: kBorderColorTextField),
                              ),
                              child: Text(
                                '8 kgs (1 piece only)',
                                textAlign: TextAlign.center,
                                style: kTextStyle.copyWith(color: kSubTitleColor, fontSize: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 40,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: kWhite,
                          border: Border.all(color: kBorderColorTextField),
                        ),
                        child: Text(
                          '30 Kgs',
                          textAlign: TextAlign.center,
                          style: kTextStyle.copyWith(color: kSubTitleColor, fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ListTile(
            dense: true,
            visualDensity: const VisualDensity(vertical: -4),
            horizontalTitleGap: 0,
            contentPadding: const EdgeInsets.only(left: 10.0, top: 10),
            leading: Container(
              width: 24,
              height: 24,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(image: AssetImage('images/indigo.png'), fit: BoxFit.cover),
              ),
            ),
            title: Text(
              'DAC - CCU',
              maxLines: 1,
              style: kTextStyle.copyWith(
                color: kTitleColor,
                fontWeight: FontWeight.bold,
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
                    Expanded(
                      flex: 3,
                      child: Container(
                        height: 40,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: kWhite,
                          border: Border.all(color: kBorderColorTextField),
                        ),
                        child: Text(
                          'Cabin',
                          textAlign: TextAlign.center,
                          style: kTextStyle.copyWith(color: kTitleColor, fontSize: 12),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 40,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: kWhite,
                          border: Border.all(color: kBorderColorTextField),
                        ),
                        child: Text(
                          'Check -in',
                          textAlign: TextAlign.center,
                          style: kTextStyle.copyWith(color: kTitleColor, fontSize: 12),
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
                              height: 40,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: kWhite,
                                border: Border.all(color: kBorderColorTextField),
                              ),
                              child: Text(
                                'ADULT',
                                textAlign: TextAlign.center,
                                style: kTextStyle.copyWith(color: kTitleColor, fontSize: 12),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              height: 40,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: kWhite,
                                border: Border.all(color: kBorderColorTextField),
                              ),
                              child: Text(
                                '8 kgs (1 piece only)',
                                textAlign: TextAlign.center,
                                style: kTextStyle.copyWith(color: kSubTitleColor, fontSize: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 40,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: kWhite,
                          border: Border.all(color: kBorderColorTextField),
                        ),
                        child: Text(
                          '30 Kgs',
                          textAlign: TextAlign.center,
                          style: kTextStyle.copyWith(color: kSubTitleColor, fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}