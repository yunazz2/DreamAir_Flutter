import 'package:country_code_picker/country_code_picker.dart';
import 'package:flight_booking/main.dart';
import 'package:flight_booking/screen/home/home_screen.dart';
import 'package:flight_booking/screen/mypage/update_profile/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';
import 'dart:io';
import '../../widgets/constant.dart';

// 회원 탈퇴 페이지
class DeleteAccountScreen extends StatefulWidget {
  const DeleteAccountScreen({Key? key}) : super(key: key);

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
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

      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text('회원 탈퇴', style: TextStyle(color: Colors.white,),),
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
              const SizedBox(height: 50,),
              Text('회원 탈퇴를 진행하시겠습니까?', style: TextStyle(fontSize: 15.0),),
              Text('탈퇴 시 회원 정보 및 마일리지 복구가 불가능합니다.', style: TextStyle(fontSize: 15.0),),

              const SizedBox(height: 20.0,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  elevation: 0.0,
                  backgroundColor: Colors.red,
                ),
                // 회원 탈퇴 버튼 누르면
                onPressed: () {
                  // 팝업 창
                  setState(() {
                    showDialog(context: context, 
                        builder: (BuildContext context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            title: const Text(
                              '회원 탈퇴를 진행하시겠습니까?',
                              style: TextStyle(fontSize: 16,),
                              textAlign: TextAlign.center,
                            ),
                            content: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  // No 버튼
                                  width: 100,
                                  height: 40,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0.0,
                                      backgroundColor: Colors.red,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(40),
                                      )),
                                      child: const Text(
                                        'No',
                                        style: TextStyle(color: Colors.white,),
                                      )),
                                ),
                                const SizedBox(width: 12,),
                                // Yes 버튼
                                Container(
                                  width: 100,
                                  height: 40,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        // 회원 탈퇴 로직 연결
                                      });
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => const MyApp()));
                                    },
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0.0,
                                      backgroundColor: kPrimaryColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(40),
                                      )),
                                    child: const Text('Yes', style: TextStyle(color: Colors.white,),)),
                                ),
                              ],
                            ),
                          );
                        });
                  });

                },
                child: Text('회원 탈퇴', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
