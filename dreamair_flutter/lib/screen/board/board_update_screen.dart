import 'package:flight_booking/generated/l10n.dart' as lang;
import 'package:flight_booking/screen/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../widgets/button_global.dart';

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
          child: const Column(
            children: [
             InputForm(),
            ]
          ),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Column(
            children: [
              Row(
                children: [
                  Text('제목'),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: TextField(
                      autofocus: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '제목을 입력해주세요.',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text('작성자'),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '작성자를 입력해주세요.',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text('내용'),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: TextField(
                      // 사이즈를 min 고정 시키고 싶어
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(20.0),
                        border: OutlineInputBorder(),
                        hintText: '내용을 입력해주세요.',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text('이미지 업로드'),
                ],
              ),
            ]
          ),
        ),

        // 수정 버튼
        const SizedBox(height: 10.0),
            ButtonGlobalWithoutIcon(
              buttontext: lang.S.of(context).updatebutton,
              buttonDecoration: kButtonDecoration.copyWith(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(30.0),
              ),
              onPressed: () {
                // setState(() {
                // const SearchResult().launch(context);
                // });
              },
              buttonTextColor: kWhite,
            ),

        // 삭제 버튼
        const SizedBox(height: 10.0),
            ButtonGlobalWithoutIcon(
              buttontext: lang.S.of(context).deletebutton,
              buttonDecoration: kButtonDecoration.copyWith(
                color: redColor,
                borderRadius: BorderRadius.circular(30.0),
              ),
              onPressed: () {
                // setState(() {
                // const SearchResult().launch(context);
                // });
              },
              buttonTextColor: kWhite,
        )
      ],
      
    );
  }
}