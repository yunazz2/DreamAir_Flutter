import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../widgets/constant.dart';
import '../welcome_screen.dart';
import 'package:flight_booking/generated/l10n.dart' as lang;

class OnBoard extends StatefulWidget {
  const OnBoard({
    Key? key,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  PageController pageController = PageController(initialPage: 0);
  int currentIndexPage = 0;
  double percent = 0.33;

  List<Map<String, dynamic>> sliderList = [
    {
      "icon": 'images/onboard1.png',
    },
    {
      "icon": 'images/onboard2.png',
    },
    {
      "icon": 'images/onboard3.png',
    },
  ];

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFF9F9F9),
        body: PageView.builder(
          itemCount: sliderList.length,
          // physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          onPageChanged: (int index){
            setState(() {
              switch(index){
                case 0 :
                {
                  percent=0.33;
                  currentIndexPage=0;
                }
                break;
                case 1:
                  {
                    percent=0.66;
                    currentIndexPage=1;
                  }
                  break;
                case 2:
                  {
                    percent=1;
                    currentIndexPage=2;
                  }
              }
            });
          },
          itemBuilder: (_, i) {
            return SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: GestureDetector(
                      onTap: () => const WelcomeScreen().launch(context),
                      child: Text(
                        lang.S.of(context).skipButton,
                        style: kTextStyle.copyWith(color: kSubTitleColor),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 260,
                      width: context.width(),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              sliderList[i]['icon'],
                            ),
                            fit: BoxFit.contain),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    width: context.width(),
                    height: context.height(),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(36.0),
                          topRight: Radius.circular(36.0),
                        ),
                        color: kWhite,
                        boxShadow: [BoxShadow(color: kDarkWhite, spreadRadius: 2, blurRadius: 7, offset: Offset(0, -2))]),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 25.0),
                          SmoothPageIndicator(
                            controller: pageController,
                            count: 3,
                            axisDirection: Axis.horizontal,
                            effect: ExpandingDotsEffect(
                                spacing: 8.0,
                                radius: 30.0,
                                dotWidth: 10.0,
                                dotHeight: 5.0,
                                paintStyle: PaintingStyle.fill,
                                strokeWidth: 1.5,
                                dotColor: kPrimaryColor.withOpacity(0.1),
                                activeDotColor: kPrimaryColor),
                          ),
                          const SizedBox(height: 25.0),
                          Text(
                            currentIndexPage == 0
                                ? lang.S.of(context).onBoardTitle1
                                : currentIndexPage == 1
                                    ? lang.S.of(context).onBoardTitle2
                                    : lang.S.of(context).onBoardTitle3,
                            textAlign: TextAlign.center,
                            style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 18.0),
                          ),
                          const SizedBox(height: 20.0),
                          Text(
                            currentIndexPage == 0
                                ? lang.S.of(context).onBoardSubTitle1
                                : currentIndexPage == 1
                                    ? lang.S.of(context).onBoardSubTitle2
                                    : lang.S.of(context).onBoardSubTitle3,
                            style: kTextStyle.copyWith(
                              color: kSubTitleColor,
                            ),
                            maxLines: 3,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 40.0),
                          CircularPercentIndicator(
                            radius: 40.0,
                            lineWidth: 2.0,
                            percent: percent,
                            animation: true,
                            progressColor: kPrimaryColor,
                            circularStrokeCap: CircularStrokeCap.round,
                            backgroundColor: kPrimaryColor.withOpacity(0.1),
                            center: GestureDetector(
                              onTap: () {
                                setState(
                                  () {
                                    currentIndexPage < 2
                                        ? pageController.nextPage(duration: const Duration(microseconds: 3000), curve: Curves.bounceInOut)
                                        : Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => const WelcomeScreen(),
                                            ),
                                          );
                                  },
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                decoration: const BoxDecoration(shape: BoxShape.circle, color: kPrimaryColor),
                                child: const Icon(
                                  FeatherIcons.chevronsRight,
                                  color: kWhite,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
