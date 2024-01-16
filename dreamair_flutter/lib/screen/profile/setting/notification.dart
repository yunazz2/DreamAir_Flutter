import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../widgets/constant.dart';

class NotificationSc extends StatefulWidget {
  const NotificationSc({Key? key}) : super(key: key);

  @override
  State<NotificationSc> createState() => _NotificationScState();
}

class _NotificationScState extends State<NotificationSc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: kWhite),
        title: Text(
          'Notification',
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
                child: const Text('All Clear').onTap(() => Navigator.pop(context)),
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
        padding: const EdgeInsets.only(top: 25, bottom: 15, left: 15, right: 10),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Today  -  10 June 2023',
              style: TextStyle(color: kSubTitleColor),
            ),
            const SizedBox(
              height: 15,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 2,
              itemBuilder: (_, i) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: kPrimaryColor.withOpacity(0.1),
                          ),
                          child: const Icon(
                            IconlyBold.notification,
                            color: kPrimaryColor,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Payment Successful!',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Lorem ipsum dolor sit amet consectetur. Dictum\nsagittis amet purus sed maecenas mauris.',
                              style: TextStyle(fontSize: 12, color: kSubTitleColor),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '15 Jun 2023, 2 min ago.',
                              style: TextStyle(fontSize: 10, color: kSubTitleColor),
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Divider(
                      thickness: 1.0,
                      color: kBorderColorTextField,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                );
              },
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Yesterday  -  10 June 2023',
              style: TextStyle(color: kSubTitleColor),
            ),
            const SizedBox(
              height: 15,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 2,
              itemBuilder: (_, i) {
                return Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 32,
                          width: 32,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: kPrimaryColor.withOpacity(0.1),
                          ),
                          child: const Icon(
                            IconlyBold.notification,
                            color: kPrimaryColor,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Payment Successful!',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Lorem ipsum dolor sit amet consectetur. Dictum\nsagittis amet purus sed maecenas mauris.',
                              style: TextStyle(fontSize: 12, color: kSubTitleColor),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '15 Jun 2023, 2 min ago.',
                              style: TextStyle(fontSize: 10, color: kSubTitleColor),
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Divider(
                      thickness: 1.0,
                      color: kBorderColorTextField,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
