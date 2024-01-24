import 'package:flight_booking/generated/l10n.dart' as lang;
import 'package:flight_booking/screen/board/InputForm.dart';
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
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: AppBar(
          titleSpacing: 0,
          elevation: 0,
          backgroundColor: kPrimaryColor,
          iconTheme: const IconThemeData(color: kWhite),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.close),
            ),
          ],
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
              child: const InputForm(),
            ),
          ),
        ),
      ),
    );
  }
}