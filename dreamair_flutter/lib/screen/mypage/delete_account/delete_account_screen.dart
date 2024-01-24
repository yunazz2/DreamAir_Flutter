import 'package:flight_booking/main.dart';
import 'package:flight_booking/screen/Authentication/welcome_screen.dart';
import 'package:flight_booking/screen/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../widgets/constant.dart';

// 회원 탈퇴 페이지
class DeleteAccountScreen extends StatefulWidget {
  const DeleteAccountScreen({Key? key}) : super(key: key);

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {

  Future deleteAccout(UserProvider userProvider) async {
    print('회원 탈퇴 요청 시작');

    String userId = userProvider.userId;

    final url = 'http://10.0.2.2:9090/user/$userId';

    try {
      final response = await http.delete(Uri.parse(url));
      if(response.statusCode == 200) {
        print('회원 탈퇴 요청 응답 성공');

        UserProvider().logout();
        
        WelcomeScreen().launch(context, isNewTask: true);
      }
    } catch (e) {
      print('오류 발생:$e');
    }

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
                                        deleteAccout(userProvider);
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
