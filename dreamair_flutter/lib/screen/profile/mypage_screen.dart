import 'package:community_material_icon/community_material_icon.dart';
import 'package:flight_booking/screen/profile/Privacy_Policy/privicy_policy.dart';
import 'package:flight_booking/screen/profile/my_profile/my_profile.dart';
import 'package:flight_booking/screen/profile/payments/paymetns.dart';
import 'package:flight_booking/screen/profile/setting/setting.dart';
import 'package:flight_booking/screen/profile/update_profile/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:flight_booking/generated/l10n.dart' as lang;
import 'package:nb_utils/nb_utils.dart';

import '../Authentication/welcome_screen.dart';
import '../widgets/constant.dart';

// 마이 페이지
class Mypage extends StatefulWidget {
  const Mypage({Key? key}) : super(key: key);

  @override
  State<Mypage> createState() => _MypageState();
}

class _MypageState extends State<Mypage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          '마이 페이지',
          style: TextStyle(color: Colors.white),
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
              // 메뉴 목록
              // 회원 정보 수정
              Card(
                elevation: 1.3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(color: kBorderColorTextField, width: 0.5),
                ),
                child: ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const EditProfile()));
                  },
                  contentPadding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  leading: Container(
                    height: 34,
                    width: 34,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey.withOpacity(0.2)),
                    child: const Icon(Icons.person, color: Colors.grey,),
                  ),
                  title: const Text('회원 정보 수정'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 18, color: kSubTitleColor,),
                ),
              ),

              // 체크인
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
                      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey.withOpacity(0.2)),
                      child: const Icon(Icons.airplane_ticket, color: Colors.grey,),
                    ),
                    title: const Text('체크인'),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                      color: kSubTitleColor,
                    ),
                  ),
                ),
              ),

              // 마일리지 조회
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
                      color: Colors.grey.withOpacity(0.2),
                    ),
                    child: const Icon(Icons.credit_card, color: Colors.grey,),
                  ),
                  title: Text('마일리지 조회', style: kTextStyle.copyWith(color: kTitleColor),),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 18, color: kSubTitleColor,),
                ),
              ),

              // 나의 탑승권 관리
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
                    child: const Icon(CommunityMaterialIcons.alert_circle, color: Colors.grey,),
                  ),
                  title: const Text('나의 탑승권 관리'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 18, color: kSubTitleColor,),
                ),
              ),

              // 회원 탈퇴
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
                      color: Colors.grey.withOpacity(0.1),
                    ),
                    child: const Icon(Icons.person_off, color: Colors.grey,),
                  ),
                  title: Text('회원 탈퇴', style: kTextStyle.copyWith(color: kTitleColor),),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 18,
                    color: kSubTitleColor,
                  ),
                ),
              ),

              // 로그아웃
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
                      color: Colors.grey.withOpacity(0.2),
                    ),
                    child: const Icon(Icons.logout, color: Colors.grey,),
                  ),
                  title: const Text('로그아웃'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 18, color: kSubTitleColor,),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
