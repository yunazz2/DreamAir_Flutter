import 'package:flight_booking/screen/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:flight_booking/generated/l10n.dart' as lang;

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
    );
  }
}
