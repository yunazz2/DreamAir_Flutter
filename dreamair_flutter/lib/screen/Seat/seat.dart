// 이 페이지에서 payment로 연결해주기
import 'package:flight_booking/screen/payment/payment.dart';
import 'package:flight_booking/screen/seat/seat_sample_info.dart';
import 'package:flight_booking/screen/widgets/button_global.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../widgets/constant.dart';

class Seat extends StatefulWidget {
  const Seat({Key? key}) : super(key: key);

  @override
  State<Seat> createState() => _SeatState();
}

class _SeatState extends State<Seat> {
  TabController? tabController;
  TabController? tabsController;

  SeatInfo seatInfoInstance = SeatInfo(); // 임시로 만든 좌석 정보 클래스
  List<List<bool>> isSelectedList = List.generate(4, (rowIndex) => List.generate(10, (colIndex) => false));

  @override
  void initState() {
    super.initState();
  }

  List<String>selectedSeat=[];



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: AppBar(
          titleSpacing: 0,
          elevation: 0,
          backgroundColor: kPrimaryColor,
          iconTheme: const IconThemeData(color: Colors.white),
          title: ListTile(
            dense: true,
            visualDensity: const VisualDensity(vertical: -2),
            horizontalTitleGap: 00.0,
            contentPadding: const EdgeInsets.only(right: 15.0),
            title: Text('좌석 선택', style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold,),),
          ),
        ),
        
        // 다음으로 버튼
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: ListTile(
            contentPadding: const EdgeInsets.only(left: 15.0, right: 15.0),
            visualDensity: const VisualDensity(vertical: 2),
            trailing: SizedBox(
              width: 200,
              child: ButtonGlobalWithoutIcon(
                buttontext: '다음으로',
                buttonDecoration: kButtonDecoration.copyWith(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                onPressed: () {
                  setState(() {
                    const Payment().launch(context);
                  });
                },
                buttonTextColor: kWhite,
              ),
            ),
          ),
        ),

        // 좌석 선택
        body: Container(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.0),
              topLeft: Radius.circular(30.0),
            ),
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SizedBox(height: 20.0,),
                Text('좌석 선택을 진행합니다.', style: TextStyle(color: kTitleColor, fontSize: 18.0,),),
                const SizedBox(height: 20.0,),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: kSecondaryColor,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: kDarkWhite,
                        spreadRadius: 2.0,
                        blurRadius: 7.0,
                        offset: Offset(0, 2),
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // children: List.generate(4, (rowIndex){
                    children: List.generate((seatInfoInstance.seatNo.length / 10).ceil(), (rowIndex){
                      return
                        Column(
                          // children: List.generate(10, (colIndex) {
                          children: List.generate((seatInfoInstance.seatNo.length / 4).ceil(), (colIndex) {

                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  isSelectedList[rowIndex][colIndex] = !isSelectedList[rowIndex][colIndex];
                                  print('isSelectedList 출력');
                                  print(isSelectedList[rowIndex][colIndex]);
                                  print('-----------------------------------------');
                                  print('좌석명 출력');
                                  print(seatInfoInstance.seatNo[colIndex + rowIndex * 10]);
                                  print('-----------------------------------------');
                                });
                              },
                              child: 
                              Container(
                                width: 30.0,
                                height: 30.0,
                                color: isSelectedList[rowIndex][colIndex] ? kSubSubTitleColor : kSubTitleColor,
                                margin: EdgeInsets.symmetric(vertical: 5.0),
                                child: Center(
                                  child: Text(
                                    seatInfoInstance.seatNo[colIndex + rowIndex * 10],
                                    style: TextStyle(color: Colors.white, fontSize: 12.0,),
                                  ),
                                ),
                              ),
                            );
                          }),
                        );
                    }),
                  ),
                  // child: Row(                                           // 가로로 나열하는 Row 위젯
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,   // 가로로 나열되는 애들을 균등하게 간격 조절
                  //   children: List.generate(4, (rowIndex){              // Row 위젯 안에 포함될 자식 위젯들을 4개 생성하겠다. => 위젯을 가로로 4개 나열하겠다. => rowIndex는 0~3이 된다.
                  //     return
                  //       Column(                                         // 세로로 나열하는 Column 위젯
                  //         children: List.generate(10, (colIndex) {      // Column 위젯 안에 포함될 자식 위젯들을 10개 생성하겠다 => 위젯을 세로로 10개 나열하겠다. => index는 0~9가 된다.
                  //           return Container(                           // 가로X세로가 30X30인 검정색 사각형을 생성하겠다.
                  //             width: 30.0,
                  //             height: 30.0,                       
                  //             color: Colors.black,
                  //             margin: EdgeInsets.symmetric(vertical: 5.0),            // 정사각형 간의 세로 간격을 5.0으로 하겠다.
                  //             child: Center(                                          // 정사각형 안에 가운데에
                  //               child: Text(                                          // 텍스트 위젯을 생성하겠다.
                  //                 seatInfoInstance.seatNo[colIndex + rowIndex * 10],  // seatInfoInstance 객체에서 텍스트를 가지고 오겠다. 
                  //                 style: TextStyle(color: Colors.white, fontSize: 12.0,),
                  //               ),
                  //             ),
                  //           );
                  //         }),
                  //       );
                  //   }),
                  // ),
                  
                ),
                SizedBox(height: 200.0,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}