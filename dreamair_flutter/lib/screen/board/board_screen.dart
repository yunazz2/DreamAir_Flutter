// 게시판(여행 커뮤니티) 페이지
import 'package:flight_booking/generated/l10n.dart' as lang;
import 'package:flight_booking/screen/board/board_stroy.dart';
import 'package:flight_booking/screen/board/board_upload_screen.dart';
import 'package:flight_booking/screen/widgets/constant.dart';
import 'package:flutter/material.dart';

class BoardScreen extends StatefulWidget {
  const BoardScreen({super.key});

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        titleSpacing: 0,
        elevation: 0,
        backgroundColor: kPrimaryColor,
        iconTheme: const IconThemeData(color: kWhite),
        centerTitle: true,
        title: Text(
          lang.S.of(context).boardTitle,
          style: kTextStyle.copyWith(
            color: kWhite,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          heroTag: 'upload',
          backgroundColor: Colors.amber[300],
          foregroundColor: Theme.of(context).primaryColor,
          splashColor: Colors.blue,
          hoverColor: Colors.green,
          elevation: 10,
          highlightElevation: 20,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const BoardUploadScreen(),
              ),
            );
          },
          child: const Icon(
            Icons.upgrade,
            size: 30,
          ),
          
          ),
      body: SingleChildScrollView(
        primary: false,
        physics: const BouncingScrollPhysics(),
        child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 700),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                color: kWhite,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Column(children: [
                ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4, // 상태 값 줘야함
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: kBorderColorTextField,
                            )),
                        child: const BoardStory(),
                      ),
                    );
                  },
                )
              ]),
            ),
          ),
      ),
    );
  }
}
