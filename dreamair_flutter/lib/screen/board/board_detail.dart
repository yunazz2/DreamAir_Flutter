import 'package:flight_booking/generated/l10n.dart' as lang;
import 'package:flight_booking/screen/widgets/constant.dart';
import 'package:flutter/material.dart';

class BoardDetail extends StatefulWidget {

  const BoardDetail({super.key,});

   @override
  _BoardDetailState createState() => _BoardDetailState();
}

class _BoardDetailState extends State<BoardDetail> {
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
          lang.S.of(context).BoardDetailTitle,
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
          child:GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 40,
            ),
            child: Text('상세 화면 페이지'),
            // postItem 추가
            // commentScreen 추가
            ),
          ),
        ),
        ),
      ),
      );
  }
}