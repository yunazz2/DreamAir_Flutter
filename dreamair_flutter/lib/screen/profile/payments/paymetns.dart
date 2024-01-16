import 'package:community_material_icon/community_material_icon.dart';
import 'package:flight_booking/screen/profile/payments/edit_payments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../widgets/constant.dart';

class ProfilePayments extends StatefulWidget {
  const ProfilePayments({Key? key}) : super(key: key);

  @override
  State<ProfilePayments> createState() => _ProfilePaymentsState();
}

class _ProfilePaymentsState extends State<ProfilePayments> {
  List<String> image = [
    'images/visa.png',
    'images/payment.png',
    'images/stripe.png',
  ];
  List<String> name = [
    'Visa Card',
    'Paypal',
    'Stripe',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: kWhite),
        title: Text(
          'Payment Method',
          style: kTextStyle.copyWith(
            color: kWhite,
          ),
        ),
        centerTitle: true,
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
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: name.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: const BorderSide(
                            color: kBorderColorTextField,
                            width: 0.5,
                          )),
                      elevation: 1.3,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: ListTile(
                          onTap: () {},
                          contentPadding: EdgeInsets.zero,
                          leading: Container(
                            height: 36,
                            width: 52,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(fit: BoxFit.fill, image: AssetImage(image[index])),
                            ),
                          ),
                          title: Text(
                            name[index],
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: kTitleColor),
                          ),
                          trailing: PopupMenuButton<int>(
                            itemBuilder: (context) => [
                              // popupmenu item 1
                              PopupMenuItem(
                                child: Row(
                                  children: const [
                                    Icon(
                                      IconlyBold.edit,
                                      color: kPrimaryColor,
                                    ),
                                    SizedBox(
                                      // sized box with width 10
                                      width: 10,
                                    ),
                                    Text('Edit')
                                  ],
                                ).onTap(
                                  () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const EditPaymentsProfile(),
                                    ),
                                  ),
                                ),
                              ),
                              // popupmenu item 2
                              PopupMenuItem(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              title: const Padding(
                                                padding: EdgeInsets.symmetric(horizontal: 20),
                                                child: Text(
                                                  'Are yor sure you want ot Delete card!',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
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
                                                          style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500),
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
                                                            name.removeAt(index);
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
                                                          style: TextStyle(color: kWhite, fontWeight: FontWeight.w500),
                                                        )),
                                                  ),
                                                ],
                                              ),
                                            );
                                          });
                                    });
                                  },
                                  child: Row(
                                    children: const [
                                      Icon(
                                        CommunityMaterialIcons.trash_can,
                                        color: Colors.red,
                                      ),
                                      SizedBox(
                                        // sized box with width 10
                                        width: 10,
                                      ),
                                      Text('Delete')
                                    ],
                                  ),
                                ),
                              ),
                            ],
                            offset: const Offset(0, 40),
                            color: kWhite,
                            elevation: 1.0,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(
                      color: kBorderColorTextField,
                      width: 0.5,
                    )),
                elevation: 1.3,
                child: ListTile(
                  onTap: () {},
                  contentPadding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  leading: Container(
                    height: 36,
                    width: 52,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                          'images/payment.png',
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    'Paytm',
                    style: kTextStyle.copyWith(fontSize: 16, color: kTitleColor, fontWeight: FontWeight.bold),
                  ),
                  trailing: Text(
                    'Add New',
                    style: kTextStyle.copyWith(fontSize: 16, color: kTitleColor),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
