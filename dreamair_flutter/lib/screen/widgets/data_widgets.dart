import 'package:flight_booking/screen/booking/provider/booking_provider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import 'constant.dart';


class CancellationWidget extends StatelessWidget {
  const CancellationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BookingProvider>(
              builder: ((context, booking, child) => 
                Container(
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
                            image: DecorationImage(image: AssetImage('images/logo.png'), fit: BoxFit.cover),
                          ),
                        ),
                        title: Text(
                          '  환불 위약금 정책',
                          maxLines: 1,
                          style: TextStyle(
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
                                color: Colors.white,
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
                                            '기간',
                                            style: TextStyle(
                                                color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 12),
                                          ),
                                          Text(
                                            '예정된 출발 항공편 날짜로부터',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(color: kSubTitleColor, fontSize: 10),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            '항공사 수수료 + MMT 수수료',
                                            style: TextStyle(
                                                color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 12),
                                          ),
                                          Text(
                                            '(인원 당)',
                                            textAlign: TextAlign.end,
                                            style: TextStyle(color: kSubTitleColor, fontSize: 10),
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
                                      color: Colors.white,
                                      border: Border.all(color: kBorderColorTextField),
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          '~ 90일 이전*',
                                          style: TextStyle(
                                              color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 15),
                                        ),
                                        const SizedBox(height: 30.0),
                                        Text(
                                          '90 ~ 61일 이전*',
                                          style: TextStyle(
                                              color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 15),
                                        ),
                                        const SizedBox(height: 30.0),
                                        Text(
                                          '60 ~ 41일 이전*',
                                          style: TextStyle(
                                              color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 15),
                                        ),
                                        const SizedBox(height: 30.0),
                                        Text(
                                          '40 ~ 21일 이전*',
                                          style: TextStyle(
                                              color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 15),
                                        ),
                                        const SizedBox(height: 30.0),
                                        Text(
                                          '20 ~ 11일 이전*',
                                          style: TextStyle(
                                              color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 15),
                                        ),
                                        const SizedBox(height: 30.0),
                                        Text(
                                          '10일 이내~*',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: kTitleColor, fontSize: 15, fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: kBorderColorTextField),
                                    ),
                                    child: const Column(
                                      children: [
                                        Text(
                                          '환불 위약금 없음',
                                          style: TextStyle(
                                              color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 15),
                                        ),
                                        SizedBox(height: 30.0),
                                        Text(
                                          '90% 환불',
                                          style: TextStyle(
                                              color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 15),
                                        ),
                                        SizedBox(height: 30.0),
                                        Text(
                                          '80% 환불',
                                          style: TextStyle(
                                              color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 15),
                                        ),
                                        SizedBox(height: 30.0),
                                        Text(
                                          '70% 환불',
                                          style: TextStyle(
                                              color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 15),
                                        ),
                                        SizedBox(height: 30.0),
                                        Text(
                                          '60% 환불',
                                          style: TextStyle(
                                              color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 15),
                                        ),
                                        SizedBox(height: 30.0),
                                        Text(
                                          '50% 환불',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              color: kTitleColor, fontSize: 15, fontWeight: FontWeight.bold),
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
                          ],
                        ),
                      ),
                      const SizedBox(height: 10.0),
                    ],
                  ),
                )
              ) 
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
                image: DecorationImage(image: AssetImage('images/logo.png'), fit: BoxFit.cover),
              ),
            ),
            title: Text(
              '  날짜 변경 가능 정책',
              maxLines: 1,
              style: TextStyle(
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
                    color: Colors.white,
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
                                '기간',
                                style: TextStyle(
                                    color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                              Text(
                                '예정된 출발 항공편 날짜로부터',
                                textAlign: TextAlign.start,
                                style: TextStyle(color: kSubTitleColor, fontSize: 10),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '항공사 수수료 + MMT 수수료',
                                style: TextStyle(
                                    color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                              Text(
                                '(인원 당)',
                                textAlign: TextAlign.end,
                                style: TextStyle(color: kSubTitleColor, fontSize: 10),
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
                          color: Colors.white,
                          border: Border.all(color: kBorderColorTextField),
                        ),
                        child: Column(
                          children: [
                            Text(
                              '~ 90일 이전*',
                              style: TextStyle(
                                  color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            const SizedBox(height: 30.0),
                            Text(
                              '90 ~ 61일 이전*',
                              style: TextStyle(
                                  color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            const SizedBox(height: 30.0),
                            Text(
                              '60 ~ 41일 이전*',
                              style: TextStyle(
                                  color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            const SizedBox(height: 30.0),
                            Text(
                              '40 ~ 21일 이전*',
                              style: TextStyle(
                                  color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            const SizedBox(height: 30.0),
                            Text(
                              '20 ~ 11일 이전*',
                              style: TextStyle(
                                  color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            const SizedBox(height: 30.0),
                            Text(
                              '10일 이내~*',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: kTitleColor, fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: kBorderColorTextField),
                        ),
                        child: Column(
                          children: [
                            Text(
                              '추가 요금 없음',
                              style: TextStyle(
                                  color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            SizedBox(height: 30.0),
                            Text(
                              '10% 추가 요금',
                              style: TextStyle(
                                  color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            SizedBox(height: 30.0),
                            Text(
                              '20% 추가 요금',
                              style: TextStyle(
                                  color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            SizedBox(height: 30.0),
                            Text(
                              '30% 추가 요금',
                              style: TextStyle(
                                  color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            SizedBox(height: 30.0),
                            Text(
                              '40% 추가 요금',
                              style: TextStyle(
                                  color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            SizedBox(height: 30.0),
                            Text(
                              '날짜 변경 불가',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: kTitleColor, fontSize: 15, fontWeight: FontWeight.bold),
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
              ],
            ),
          ),
          const SizedBox(height: 10.0),
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
                image: DecorationImage(image: AssetImage('images/logo.png'), fit: BoxFit.cover),
              ),
            ),
            title: Text(
              '  수화물 추가 요금 정책',
              maxLines: 1,
              style: TextStyle(
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
                          color: Colors.white,
                          border: Border.all(color: kBorderColorTextField),
                        ),
                        child: Text(
                          '위탁 수화물',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: kTitleColor, fontSize: 12),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 40,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: kBorderColorTextField),
                        ),
                        child: Text(
                          '기내 수화물',
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
                              height: 40,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: kBorderColorTextField),
                              ),
                              child: Text(
                                '무료',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: kTitleColor, fontSize: 12),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              height: 40,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: kBorderColorTextField),
                              ),
                              child: Text(
                                '25kg 이하',
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
                        height: 40,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: kBorderColorTextField),
                        ),
                        child: Text(
                          '10kg 이하',
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
                              height: 40,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: kBorderColorTextField),
                              ),
                              child: Text(
                                '+3만원',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: kTitleColor, fontSize: 12),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              height: 40,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: kBorderColorTextField),
                              ),
                              child: Text(
                                '25kg 초과 30kg 이하',
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
                        height: 40,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: kBorderColorTextField),
                        ),
                        child: Text(
                          '10kg 초과 15kg 이하',
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
                              height: 40,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: kBorderColorTextField),
                              ),
                              child: Text(
                                '+5만원',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: kTitleColor, fontSize: 12),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              height: 40,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: kBorderColorTextField),
                              ),
                              child: Text(
                                '30kg 초과 35kg 이하',
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
                        height: 40,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: kBorderColorTextField),
                        ),
                        child: Text(
                          '15kg 초과 20kg 이하',
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
                              height: 40,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: kBorderColorTextField),
                              ),
                              child: Text(
                                '+10만원',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: kTitleColor, fontSize: 12),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              height: 40,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: kBorderColorTextField),
                              ),
                              child: Text(
                                '35kg 초과 40kg 이하',
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
                        height: 40,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: kBorderColorTextField),
                        ),
                        child: Text(
                          '반입 불가',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: kSubTitleColor, fontSize: 12),
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