import 'package:flight_booking/generated/l10n.dart' as lang;
import 'package:flight_booking/screen/board/board_screen.dart';
import 'package:flight_booking/screen/widgets/button_global.dart';
import 'package:flight_booking/screen/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';


class BoardUpdateScreen extends StatefulWidget {
  const BoardUpdateScreen({super.key});

  @override
  State<BoardUpdateScreen> createState() => _BoardUpdateScreenState();
}

class _BoardUpdateScreenState extends State<BoardUpdateScreen> {
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
          lang.S.of(context).BoardUpdateTitle,
          style: kTextStyle.copyWith(
            color: kWhite,
            fontWeight: FontWeight.bold,
          ),
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
            child: UpdateForm(),
          ),
        ),
      ),
    );
  }
}

// Update form
class UpdateForm extends StatelessWidget {
  const UpdateForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 13,
        ),
        child: 
        Column(
          children: [
           const TextField(
              decoration: InputDecoration(
                labelText: "제목",
                border: OutlineInputBorder(),
              ),
            ),
           const SizedBox(height: 15,),
           const TextField(
              decoration: InputDecoration(
                labelText: "작성자",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20,),
            const TextField(
              maxLength: 200,
              maxLines: 7,
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.clear),
                labelText: "내용을 입력해 주세요. (최대 200자)",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 18,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: const Alignment(1.8, -1.8),
                  children: [
                    OutlinedButton(
                      onPressed: () {},
                      style: const ButtonStyle(
                        padding: MaterialStatePropertyAll(
                          EdgeInsets.all(16),
                        ),
                      ),
                      child: const Column(
                        children: [
                          Icon(Icons.photo_outlined),
                          Text('첨부하기'),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.add_circle_rounded,
                      color: Colors.amber[900],
                      size: 38,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 17.0,),
            // 수정 버튼
            ButtonGlobalWithoutIcon(
              buttontext: lang.S.of(context).updatebutton,
              buttonDecoration: kButtonDecoration.copyWith(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(30.0),
              ),
              onPressed: () {
                // 수정 요청
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const BoardScreen(),
                  ),
                );
              },
              buttonTextColor: kWhite,
            ),

            // 삭제 버튼
            const SizedBox(height: 2.0),
            ButtonGlobalWithoutIcon(
              buttontext: lang.S.of(context).deletebutton,
              buttonDecoration: kButtonDecoration.copyWith(
                color: redColor,
                borderRadius: BorderRadius.circular(30.0),
              ),
              onPressed: () {
                // 삭제 요청
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const BoardScreen(),
                  ),
                );
              },
              buttonTextColor: kWhite,
            )
          ],
        ),
      ),
    );
  }
}
