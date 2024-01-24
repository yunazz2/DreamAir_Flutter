import 'package:flight_booking/screen/Authentication/login_screen.dart';
import 'package:flight_booking/screen/my_boking_screen/my_boking.dart';
import 'package:flight_booking/screen/mypage/checkin/checkin_screen.dart';
import 'package:flight_booking/screen/mypage/delete_account/delete_account_screen.dart';
import 'package:flight_booking/screen/mypage/mileage/mileage_screen.dart';
import 'package:flight_booking/screen/mypage/update_profile/update_profile.dart';
import 'package:flight_booking/screen/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

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
  void initState() {
    super.initState();
    UserProvider userProvider = Provider.of<UserProvider>(context, listen: false);
    print('마이 페이지 로그인 여부 확인 : ${userProvider.isLogin} & ${userProvider.userId}');
    UserProvider().getUserInfo();
  } 

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text('마이 페이지', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.all(10.0),
          width: double.infinity,
          height: 800.0,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 20,),
              
              // 메뉴 목록
              // 회원 정보 수정
              if(userProvider.isLogin)
                Card(
                  elevation: 1.3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(color: kBorderColorTextField, width: 0.5),
                  ),
                  color: Colors.white,
                  child: ListTile(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const UpdateProfile()));
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
              if(userProvider.isLogin)
                Card(
                  elevation: 1.3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(color: kBorderColorTextField, width: 0.5),
                  ),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ListTile(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const CheckInScreen()));
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
              if(userProvider.isLogin)
                Card(
                  elevation: 1.3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(color: kBorderColorTextField, width: 0.5),
                  ),
                  color: Colors.white,
                  child: ListTile(
                    contentPadding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const MileageScreen()));
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
                    title: Text('마일리지 조회', style: TextStyle(color: kTitleColor),),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 18, color: kSubTitleColor,),
                  ),
                ),

              // 나의 탑승권 조회
              Card(
                elevation: 1.3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(color: kBorderColorTextField, width: 0.5),
                ),
                color: Colors.white,
                child: ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const MyBooking()));
                  },
                  contentPadding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  leading: Container(
                    height: 34,
                    width: 34,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey.withOpacity(0.1)),
                    child: const Icon(Icons.airplane_ticket, color: Colors.grey,),
                  ),
                  title: const Text('나의 탑승권 조회'),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 18, color: kSubTitleColor,),
                ),
              ),
              
              // 회원 탈퇴
              if(userProvider.isLogin)
                Card(
                  elevation: 1.3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(color: kBorderColorTextField, width: 0.5),
                  ),
                  color: Colors.white,
                  child: ListTile(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const DeleteAccountScreen()));
                    },
                    contentPadding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    leading: Container(
                      height: 34,
                      width: 34,
                      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey.withOpacity(0.1)),
                      child: const Icon(Icons.person_off, color: Colors.grey,),
                    ),
                    title: const Text('회원 탈퇴'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 18, color: kSubTitleColor,),
                  ),
                ),

              // 로그아웃
              if(userProvider.isLogin)
                Card(
                  elevation: 1.3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(color: kBorderColorTextField, width: 0.5),
                  ),
                  color: Colors.white,
                  child: ListTile(
                    onTap: (){
                      UserProvider().logout();
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
                ),
              
              // 로그인 바로가기
              if(!userProvider.isLogin)
                Card(
                  elevation: 1.3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(color: kBorderColorTextField, width: 0.5),
                  ),
                  color: Colors.white,
                  child: ListTile(
                    onTap: (){
                      const LogIn().launch(context);
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
                    title: const Text('로그인'),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 18, color: kSubTitleColor,),
                  ),
                ),
                const SizedBox(height: 200.0,),
            ],
          ),
        ),
      ),
    );
  }
}