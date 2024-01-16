import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import '../widgets/constant.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  List<String> name = [
    'DAC - DEL',
    'DAC - JFK',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: kWhite,
        ),
        title: Text(
          'History',
          style: kTextStyle.copyWith(
            color: kWhite,
          ),
        ),
        centerTitle: true,
        actions: [
          PopupMenuButton<int>(
            padding: EdgeInsets.zero,
            itemBuilder: (context) => [
              PopupMenuItem(
                child: const Text('All Clear').onTap(() {
                  setState(() {});
                  Navigator.pop(context);
                }),
              ),
              // popupmenu item 2
            ],
            offset: const Offset(0, 30),
            color: kWhite,
            elevation: 1.0,
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: name.length,
                itemBuilder: (_, i) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: kBorderColorTextField,
                        ),
                        color: kWhite,
                      ),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: 85,
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage('images/history.png'),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          name[i],
                                          style: kTextStyle.copyWith(fontWeight: FontWeight.bold, color: kWhite),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          'Economy',
                                          style: kTextStyle.copyWith(fontSize: 12, color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          decoration: const BoxDecoration(shape: BoxShape.circle, color: kWhite),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    showDialog(
                                                        context: context,
                                                        builder: (BuildContext context) {
                                                          return AlertDialog(
                                                            shape: RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.circular(8),
                                                            ),
                                                            title: const Text(
                                                              'Are yor sure you want ot clear the history?',
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                              ),
                                                              textAlign: TextAlign.center,
                                                            ),
                                                            content: Row(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                Container(
                                                                  height: 40,
                                                                  width: 101,
                                                                  decoration: BoxDecoration(
                                                                      borderRadius: BorderRadius.circular(40),
                                                                      border: Border.all(
                                                                        color: Colors.red,
                                                                        width: 1.0,
                                                                      )),
                                                                  child: ElevatedButton(
                                                                      onPressed: () {
                                                                        Navigator.pop(context);
                                                                      },
                                                                      style: ElevatedButton.styleFrom(
                                                                          elevation: 0.0,
                                                                          backgroundColor: kWhite,
                                                                          shape: RoundedRectangleBorder(
                                                                            borderRadius: BorderRadius.circular(40),
                                                                          )),
                                                                      child: const Text(
                                                                        'No',
                                                                        style: TextStyle(
                                                                          color: Colors.red,
                                                                        ),
                                                                      )),
                                                                ),
                                                                const SizedBox(
                                                                  width: 12,
                                                                ),
                                                                Container(
                                                                  width: 101,
                                                                  height: 40,
                                                                  decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(40),
                                                                  ),
                                                                  child: ElevatedButton(
                                                                      onPressed: () {
                                                                        setState(() {
                                                                          name.removeAt(i);
                                                                        });
                                                                        Navigator.pop(context);
                                                                      },
                                                                      style: ElevatedButton.styleFrom(
                                                                          elevation: 0.0,
                                                                          backgroundColor: kPrimaryColor,
                                                                          shape: RoundedRectangleBorder(
                                                                            borderRadius: BorderRadius.circular(40),
                                                                          )),
                                                                      child: const Text(
                                                                        'Yes',
                                                                        style: TextStyle(
                                                                          color: kWhite,
                                                                        ),
                                                                      )),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        });
                                                  });
                                                },
                                                child: const FaIcon(
                                                  FontAwesomeIcons.trashCan,
                                                  color: Colors.red,
                                                  size: 18,
                                                )),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        const Text(
                                          '\$3,000',
                                          style: TextStyle(fontWeight: FontWeight.bold, color: kWhite),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Dhaka - New Delhi',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text(
                                      '23 Jan - 30 Jan - Round Trip',
                                      style: TextStyle(fontSize: 10, color: kTitleColor),
                                    ),
                                    Text(
                                      '1 Adult, 0 Child, 0 Infant',
                                      style: TextStyle(fontSize: 10, color: kTitleColor),
                                    ),
                                  ],
                                )
                              ],
                            ),
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
