// 출도착 페이지
import 'package:flight_booking/generated/l10n.dart' as lang;
import 'package:flight_booking/screen/widgets/constant.dart';
import 'package:flutter/material.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
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
          lang.S.of(context).ScheduleTitle,
          style: kTextStyle.copyWith(
            color: kWhite,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        primary: false,
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
                itemCount: 4, // 상태 값 줘야함
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
                          const Text(
                            'dreamair001', // 항공편명
                            style: TextStyle(fontSize: 12),
                          ),
                          const Divider(
                            thickness: 1.0,
                            color: kBorderColorTextField,
                          ),
                          ListTile(
                              horizontalTitleGap: 5.0,
                              contentPadding: EdgeInsets.zero,
                              minLeadingWidth: 0,
                              leading: Container(
                                height: 40.0,
                                width: 40.0,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'images/logo3.png'), // 항공편 이미지
                                      fit: BoxFit.cover),
                                ),
                              ),
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '출발지',
                                    style:
                                        kTextStyle.copyWith(color: kTitleColor),
                                  ),
                                  const SizedBox(width: 30),
                                  const Icon(
                                    Icons.swap_horiz,
                                    color: kLightNeutralColor,
                                  ),
                                  const SizedBox(width: 30),
                                  Text(
                                    '도착지',
                                    style:
                                        kTextStyle.copyWith(color: kTitleColor),
                                  )
                                ],
                              ),
                              // 일자/시간
                              subtitle: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '출발일자/시간',
                                    style: kTextStyle.copyWith(
                                        color: kTitleColor, fontSize: 14),
                                  ),
                                  const SizedBox(width: 80),
                                  Text(
                                    '도착일자/시간',
                                    style: kTextStyle.copyWith(
                                        color: kTitleColor, fontSize: 14),
                                  )
                                ],
                              )),
                          const SizedBox(
                            height: 3.0,
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
