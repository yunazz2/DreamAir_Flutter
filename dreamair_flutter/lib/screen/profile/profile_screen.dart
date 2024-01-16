import 'package:community_material_icon/community_material_icon.dart';
import 'package:flight_booking/screen/profile/Privacy_Policy/privicy_policy.dart';
import 'package:flight_booking/screen/profile/my_profile/my_profile.dart';
import 'package:flight_booking/screen/profile/payments/paymetns.dart';
import 'package:flight_booking/screen/profile/setting/setting.dart';
import 'package:flutter/material.dart';
import 'package:flight_booking/generated/l10n.dart' as lang;
import 'package:nb_utils/nb_utils.dart';

import '../Authentication/welcome_screen.dart';
import '../widgets/constant.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: kWhite),
        title: Text(
          lang.S.of(context).profileTitle,
          style: kTextStyle.copyWith(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.all(10.0),
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
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
              Center(
                child: Container(
                  height: 80.0,
                  width: 80.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                        'images/man.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const Center(
                child: Text(
                  'Sahidul Islam',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Center(
                child: Text(
                  'shaidulislamma@gmail.com',
                  style: kTextStyle.copyWith(fontSize: 14, color: kSubTitleColor),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Card(
                elevation: 1.3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(color: kBorderColorTextField, width: 0.5),
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const MyProfile()));
                  },
                  contentPadding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  leading: Container(
                    height: 34,
                    width: 34,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: kPrimaryColor.withOpacity(0.2)),
                    child: const Icon(
                      Icons.person,
                      color: kPrimaryColor,
                    ),
                  ),
                  title: const Text('My Profile'),
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
                  side: const BorderSide(color: kBorderColorTextField, width: 0.5),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Setting()));
                    },
                    contentPadding: EdgeInsets.zero,
                    leading: Container(
                      height: 34,
                      width: 34,
                      decoration: BoxDecoration(shape: BoxShape.circle, color: const Color(0xff009F5E).withOpacity(0.2)),
                      child: const Icon(
                        Icons.settings,
                        color: Color(0xff00CD46),
                      ),
                    ),
                    title: const Text('Setting'),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                      color: kSubTitleColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Card(
                elevation: 1.3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(color: kBorderColorTextField, width: 0.5),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePayments()));
                  },
                  leading: Container(
                    height: 34,
                    width: 34,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: kPrimaryColor.withOpacity(0.2),
                    ),
                    child: const Icon(
                      Icons.payment_rounded,
                      color: kPrimaryColor,
                    ),
                  ),
                  title: Text(
                    'Payments',
                    style: kTextStyle.copyWith(color: kTitleColor),
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
                  side: const BorderSide(color: kBorderColorTextField, width: 0.5),
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const PrivacyPolicy()));
                  },
                  contentPadding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  leading: Container(
                    height: 34,
                    width: 34,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: const Color(0xff009F5E).withOpacity(0.1)),
                    child: const Icon(
                      CommunityMaterialIcons.alert_circle,
                      color: Color(0xff00CD46),
                    ),
                  ),
                  title: const Text('Privacy policy'),
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
                  side: const BorderSide(color: kBorderColorTextField, width: 0.5),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  leading: Container(
                    height: 34,
                    width: 34,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xffFF3B30).withOpacity(0.1),
                    ),
                    child: const Icon(
                      Icons.share,
                      color: Color(0xffFF3B30),
                    ),
                  ),
                  title: Text(
                    'Share App',
                    style: kTextStyle.copyWith(color: kTitleColor),
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
                  side: const BorderSide(color: kBorderColorTextField, width: 0.5),
                ),
                child: ListTile(
                  onTap: (){
                    const WelcomeScreen().launch(context,isNewTask: true);
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
                      Icons.logout,
                      color: kPrimaryColor,
                    ),
                  ),
                  title: const Text('Log Out'),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                    color: kSubTitleColor,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
