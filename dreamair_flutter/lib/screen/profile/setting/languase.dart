import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../widgets/constant.dart';
import 'package:flight_booking/generated/l10n.dart' as lang;

class Language extends StatefulWidget {
  const Language({Key? key}) : super(key: key);

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  List<String> language = [
    'English',
    'Bangla',
    'Hindi',
  ];
  String selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: kWhite),
        title: Text(
          lang.S.of(context).language,
          style: const TextStyle(
            fontSize: 18,
            color: kWhite,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        height: context.height(),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.only(top: 10.0),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: language.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Card(
                elevation: 1.3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: const BorderSide(color: kBorderColorTextField, width: 0.5),
                ),
                child: ListTile(
                  onTap: () {
                    setState(() {
                      selectedLanguage = language[index];
                    });
                  },
                  contentPadding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  title: Text(
                    language[index],
                    style: kTextStyle.copyWith(
                      color: selectedLanguage == language[index] ? kTitleColor : kSubTitleColor,
                    ),
                  ),
                  trailing: Icon(
                    selectedLanguage == language[index] ? Icons.radio_button_checked : Icons.circle_outlined,
                    color: selectedLanguage == language[index] ? kPrimaryColor : kSubTitleColor,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
