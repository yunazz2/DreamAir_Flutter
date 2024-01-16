import 'package:community_material_icon/community_material_icon.dart';
import 'package:flight_booking/screen/profile/setting/currency.dart';
import 'package:flight_booking/screen/profile/setting/languase.dart';
import 'package:flight_booking/screen/profile/setting/notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flight_booking/generated/l10n.dart' as lang;

import '../../widgets/constant.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool check = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: kWhite),
        title: Text(
          lang.S.of(context).settingTitle,
          style: kTextStyle.copyWith(
            color: kWhite,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
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
            const SizedBox(height: 10),
            Column(
              children: [
                Card(
                  elevation: 1.3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(color: kBorderColorTextField, width: 0.5),
                  ),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Language(),
                        ),
                      );
                    },
                    contentPadding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    leading: Container(
                      height: 34,
                      width: 34,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kPrimaryColor.withOpacity(0.2),
                      ),
                      child: const Icon(
                        CommunityMaterialIcons.translate,
                        color: kPrimaryColor,
                      ),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          lang.S.of(context).language,
                          style: kTextStyle.copyWith(color: kTitleColor),
                        ),
                        Text(
                          lang.S.of(context).englishTitle,
                          style: kTextStyle.copyWith(color: kSubTitleColor, fontSize: 12),
                        )
                      ],
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                      color: kSubTitleColor,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Card(
                  elevation: 1.3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(
                      color: kBorderColorTextField,
                      width: 0.5,
                    ),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Currency(),
                        ),
                      );
                    },
                    leading: Container(
                      height: 34,
                      width: 34,
                      decoration: BoxDecoration(shape: BoxShape.circle, color: const Color(0xff009F5E).withOpacity(0.1)),
                      child: const Icon(
                        CommunityMaterialIcons.currency_usd,
                        color: Color(0xff00CD46),
                      ),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Currency'),
                        Text(
                          '(USD) - \$',
                          style: kTextStyle.copyWith(color: kSubTitleColor, fontSize: 12),
                        )
                      ],
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                      color: kSubTitleColor,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Card(
                  elevation: 1.3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(
                      color: kBorderColorTextField,
                      width: 0.5,
                    ),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.only(left: 10),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NotificationSc(),
                        ),
                      );
                    },
                    leading: Container(
                      height: 34,
                      width: 34,
                      decoration: BoxDecoration(shape: BoxShape.circle, color: const Color(0xffFF3B30).withOpacity(0.1)),
                      child: const Icon(
                        IconlyBold.notification,
                        color: Color(0xffFF3B30),
                      ),
                    ),
                    title: Text(
                      lang.S.of(context).notificationTitle,
                    ),
                    trailing: Switch(
                        activeColor: kPrimaryColor,
                        value: check,
                        onChanged: (bool value) {
                          setState(() {
                            check = value;
                          });
                        }),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
