import 'package:flight_booking/screen/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/constant.dart';

class MileageScreen extends StatefulWidget {
  const MileageScreen({Key? key});

  @override
  State<MileageScreen> createState() => _MileageScreenState();
}

class _MileageScreenState extends State<MileageScreen> {
  
  @override
  void initState() {
    super.initState();
    Provider.of<UserProvider>(context, listen: false).getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text('마일리지 조회', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 50,),
            Consumer<UserProvider>(
              builder: (context, userProvider, child) {
                final mileage = userProvider.currentUser.mileage.ceil();
                return Text('보유 마일리지 : $mileage', style: TextStyle(fontSize: 20.0),);
              },
            )
          ],
        ),
      ),
    );
  }
}
