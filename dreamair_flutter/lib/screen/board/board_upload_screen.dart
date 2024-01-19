import 'package:flight_booking/generated/l10n.dart' as lang;
import 'package:flight_booking/screen/board/board_screen.dart';
import 'package:flight_booking/screen/widgets/button_global.dart';
import 'package:flight_booking/screen/widgets/constant.dart';
import 'package:flutter/material.dart';


class BoardUploadScreen extends StatefulWidget {
  const BoardUploadScreen({super.key});

  @override
  State<BoardUploadScreen> createState() => _BoardUploadScreenState();
}

class _BoardUploadScreenState extends State<BoardUploadScreen> {
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
          lang.S.of(context).BoardUploadTitle,
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
            child: InputForm(),
          ),
        ),
      ),
    );
  }
}

// input form
class InputForm extends StatelessWidget {
  const InputForm({super.key});

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
              maxLines: 9,
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.clear),
                labelText: "내용을 입력해 주세요. (최대 200자)",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20,),
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
            const SizedBox(height: 20,),
            // 등록 버튼
            const SizedBox(height: 10.0),
            ButtonGlobalWithoutIcon(
              buttontext: lang.S.of(context).uploadbutton,
              buttonDecoration: kButtonDecoration.copyWith(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(30.0),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const BoardScreen(),
                  ),
                );
              },
              buttonTextColor: kWhite,
            ),
          ],
        ),
      ),
    );
  }
}
