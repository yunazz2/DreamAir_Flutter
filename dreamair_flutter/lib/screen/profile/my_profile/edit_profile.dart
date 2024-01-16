import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';
import 'dart:io';
import '../../widgets/constant.dart';
import 'my_profile.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final ImagePicker _picker = ImagePicker();
  XFile? image;

  Future<void> getImage() async {
    image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        height: 90,
        decoration: const BoxDecoration(
          color: kWhite,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  elevation: 0.0,
                  backgroundColor: kPrimaryColor,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyProfile(),
                    ),
                  );
                },
                child: Text(
                  'Update',
                  style: kTextStyle.copyWith(color: kWhite),
                ),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: kWhite),
        title: Text(
          'Edit Profile',
          style: kTextStyle.copyWith(
            color: kWhite,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          height: context.height(),
          width: double.infinity,
          decoration: const BoxDecoration(
            color: kWhite,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 25,
              ),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        image: image == null
                            ? const DecorationImage(image: AssetImage('images/man.png'), fit: BoxFit.cover)
                            : DecorationImage(image: FileImage(File(image!.path)), fit: BoxFit.cover)),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: kWhite,
                        width: 1.0,
                      ),
                    ),
                    child: const Icon(
                      Icons.camera_alt_outlined,
                      size: 17,
                      color: kWhite,
                    ).onTap(() => getImage()),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
               Text(
                'Sahidul Islam',
                style: kTextStyle.copyWith(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'shaidulislamma@gmail.com',
                style: kTextStyle.copyWith(fontSize: 14, color: kSubTitleColor),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: kDarkWhite,
                      offset: Offset(0, -2),
                      blurRadius: 7.0,
                      spreadRadius: 2.0,
                    ), //BoxShadow//BoxShadow
                  ],
                  color: kWhite,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      AppTextField(
                        cursorColor: kTitleColor,
                        textFieldType: TextFieldType.NAME,
                        decoration: kInputDecoration.copyWith(
                          hintText: 'Sahidul Islam',
                          labelText: 'Full Name',
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      AppTextField(
                        cursorColor: kTitleColor,
                        textFieldType: TextFieldType.NAME,
                        decoration: kInputDecoration.copyWith(
                          hintText: 'shaidulislam@gmail.com',
                          labelText: 'Email',
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      AppTextField(
                        cursorColor: kTitleColor,
                        textFieldType: TextFieldType.NUMBER,
                        decoration: kInputDecoration.copyWith(
                          hintText: '017XXXXXXXX',
                          prefixIcon: CountryCodePicker(
                            showFlag: true,
                            initialSelection: 'Bangladesh',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
