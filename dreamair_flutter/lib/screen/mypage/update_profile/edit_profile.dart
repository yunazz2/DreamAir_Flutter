import 'package:country_code_picker/country_code_picker.dart';
import 'package:flight_booking/screen/mypage/mypage_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';
import 'dart:io';
import '../../widgets/constant.dart';
import '../delete_account/delete_account_screen.dart';

// 회원 정보 수정 페이지
class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final ImagePicker _picker = ImagePicker();
  XFile? image;

  Future<void> getImage() async {
    image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        height: 90,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  elevation: 0.0,
                  backgroundColor: kPrimaryColor,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Mypage(),
                    ),
                  );
                },
                child: Text(
                  '수정 완료',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          '회원 정보 수정',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          height: context.height(),
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 25,
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: kDarkWhite,
                      offset: Offset(0, -2),
                      blurRadius: 7.0,
                      spreadRadius: 2.0,
                    ), //BoxShadow//BoxShadow
                  ],
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      // 이름
                      const SizedBox(height: 20,),
                      AppTextField(
                        cursorColor: kTitleColor,
                        textFieldType: TextFieldType.USERNAME,
                        decoration: kInputDecoration.copyWith(
                          labelText: '이름',
                        ),
                      ),

                      // 비밀번호
                      const SizedBox(height: 20.0),
                      AppTextField(
                        cursorColor: kTitleColor,
                        textFieldType: TextFieldType.PASSWORD,
                        decoration: kInputDecoration.copyWith(
                          labelText: '비밀번호',
                        ),
                      ),

                      // 비밀번호 확인
                      const SizedBox(height: 20.0),
                      AppTextField(
                        cursorColor: kTitleColor,
                        textFieldType: TextFieldType.PASSWORD,
                        decoration: kInputDecoration.copyWith(
                          labelText: '비밀번호 확인',
                        ),
                      ),
                      
                      // 핸드폰 번호
                      const SizedBox(height: 20.0),
                      AppTextField(
                        cursorColor: kTitleColor,
                        textFieldType: TextFieldType.PHONE,
                        decoration: kInputDecoration.copyWith(
                          labelText: '핸드폰 번호',
                        ),
                      ),

                      // 이메일
                      const SizedBox(height: 20.0),
                      AppTextField(
                        cursorColor: kTitleColor,
                        textFieldType: TextFieldType.EMAIL,
                        decoration: kInputDecoration.copyWith(
                          labelText: '이메일',
                        ),
                      ),

                      // 주소
                      const SizedBox(height: 20.0),
                      AppTextField(
                        cursorColor: kTitleColor,
                        textFieldType: TextFieldType.ADDRESS,
                        decoration: kInputDecoration.copyWith(
                          labelText: '주소',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
