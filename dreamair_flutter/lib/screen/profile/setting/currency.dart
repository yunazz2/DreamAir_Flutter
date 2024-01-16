import 'package:flag/flag_widget.dart';
import 'package:flight_booking/screen/widgets/constant.dart';
import 'package:flutter/material.dart';

class Currency extends StatefulWidget {
  const Currency({Key? key}) : super(key: key);

  @override
  State<Currency> createState() => _CurrencyState();
}

class _CurrencyState extends State<Currency> {
  List<String> baseFlagsCode = [
    'us',
    'gb',
    'it',
    'de',
    'fr',
    'bd',
    'in',
    'ca',
    'au',
  ];
  List<String> countryList = [
    'United States (USD)- \$',
    'United Kingdom (GBP) - £',
    'Italy (EUR) - €',
    'Germany (EUR) - €',
    'France (EUR) - €',
    'Bangladesh (BDT) - ৳',
    'India (INR) - ₹',
    'Canada (CAD) - \$',
    'Australia (AUD)  - \$',
  ];

  String selectedCountry = 'United States (USD)- \$';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: kWhite),
        title: const Text(
          'Currency',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: ListView.builder(
                    itemCount: countryList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (_, index) {
                      return StatefulBuilder(builder: (_, i) {
                        return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white, border: Border.all(width: 1.0, color: kBorderColorTextField), borderRadius: BorderRadius.circular(10.0)),
                              child: ListTile(
                                onTap: () {
                                  setState(() {
                                    selectedCountry = countryList[index];
                                  });
                                },
                                contentPadding: const EdgeInsets.only(left: 10, right: 10.0),
                                horizontalTitleGap: 10,
                                leading: Flag.fromString(
                                  baseFlagsCode[index],
                                  height: 25,
                                  width: 30,
                                ),
                                title: Text(
                                  countryList[index],
                                  style: TextStyle(color: selectedCountry == countryList[index] ? kTitleColor : kSubTitleColor),
                                ),
                                trailing: Icon(
                                  selectedCountry == countryList[index] ? Icons.radio_button_checked_outlined : Icons.circle_outlined,
                                  color: selectedCountry == countryList[index] ? kPrimaryColor : kSubTitleColor,
                                ),
                              ),
                            ));
                      });
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
