import 'package:flight_booking/screen/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flight_booking/generated/l10n.dart' as lang;
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:nb_utils/nb_utils.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: Text(lang.S.of(context).searchScreenTitle),
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            FeatherIcons.x,
            color: kWhite,
          ),
        ),
      ),
      body: Container(
        height: context.height(),
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFormField(
                onFieldSubmitted: (val) {
                  Navigator.pop(context);
                },
                showCursor: false,
                keyboardType: TextInputType.name,
                cursorColor: kTitleColor,
                textInputAction: TextInputAction.next,
                decoration: kInputDecoration.copyWith(
                  contentPadding: const EdgeInsets.only(left: 10, right: 10),
                  hintText: 'Country, city or airport',
                  hintStyle: kTextStyle.copyWith(color: kSubTitleColor),
                  focusColor: kTitleColor,
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(
                    FeatherIcons.search,
                    color: kSubTitleColor,
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.0),
                    ),
                    borderSide: BorderSide(color: kBorderColorTextField, width: 1),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.0),
                    ),
                    borderSide: BorderSide(color: kPrimaryColor, width: 1),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              ListTile(
                dense: true,
                visualDensity: const VisualDensity(vertical: -4),
                horizontalTitleGap: 0.0,
                contentPadding: EdgeInsets.zero,
                leading: const Icon(
                  IconlyBold.send,
                  color: kSubTitleColor,
                ),
                title: Text(
                  lang.S.of(context).currentLocation,
                  style: kTextStyle.copyWith(color: kSubTitleColor),
                ),
                subtitle: Text(
                  lang.S.of(context).useCurrentLocation,
                  style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                ),
              ),
              const Divider(
                thickness: 1.0,
                color: kBorderColorTextField,
              ),
              const SizedBox(height: 10.0),
              Text(
                lang.S.of(context).recentPlaceTitle,
                style: kTextStyle.copyWith(color: kSubTitleColor, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0),
              ListView.builder(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  shrinkWrap: true,
                  itemBuilder: (_, i) {
                    return Column(
                      children: [
                        ListTile(
                          dense: true,
                          visualDensity: const VisualDensity(vertical: -2),
                          horizontalTitleGap: 10.0,
                          contentPadding: EdgeInsets.zero,
                          leading: Container(
                            padding: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(shape: BoxShape.circle, color: kPrimaryColor.withOpacity(0.1)),
                            child: const Icon(
                              Icons.flight,
                              color: kPrimaryColor,
                            ),
                          ),
                          title: Text(
                            'Dhaka',
                            style: kTextStyle.copyWith(
                              color: kTitleColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            'Hazrat Shahjala International Airport',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: kTextStyle.copyWith(color: kSubTitleColor),
                          ),
                        ),
                        const Divider(
                          thickness: 1.0,
                          color: kBorderColorTextField,
                        ),

                      ],
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
