// 게시판(여행 커뮤니티) 페이지
import 'package:flight_booking/generated/l10n.dart' as lang;
import 'package:flight_booking/screen/board/board_upload_screen.dart';
import 'package:flight_booking/screen/board/social/util/data.dart';
import 'package:flight_booking/screen/board/social/views/widgets/post_item.dart';
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
          lang.S.of(context).boardTitle, //커뮤니티
          style: kTextStyle.copyWith(
            color: kWhite,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
       body: SingleChildScrollView(
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
          child: Column(
            children: [
              for (int index = 0; index < 4; index++)
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: kBorderColorTextField,
                    ),
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: posts.length,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemBuilder: (BuildContext context, int index) {
                      Map post = posts[index];
                      return PostItem(
                        img: post['img'],
                        name: post['name'],
                        dp: post['dp'],
                        time: post['time'],
                      );
                    },
                  ),
                ),
            ],
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
    );
  }
}
