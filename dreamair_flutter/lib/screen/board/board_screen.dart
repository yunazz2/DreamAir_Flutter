// 게시판(여행 커뮤니티) 페이지
import 'dart:convert';

import 'package:flight_booking/generated/l10n.dart' as lang;
import 'package:flight_booking/screen/board/board.dart';
import 'package:flight_booking/screen/board/board_upload_screen.dart';
import 'package:flight_booking/screen/board/social/util/data.dart';
import 'package:flight_booking/screen/board/social/views/widgets/post_item.dart';
import 'package:flight_booking/screen/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BoardScreen extends StatefulWidget {
  const BoardScreen({super.key});

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {

  List<Board> _boardList = [];

  @override
  void initState() {
    super.initState();
    getBoardList().then((result) {
      setState(() {
        _boardList = result;
      });
    });
  }

  Future<List<Board>> getBoardList() async {
    // 서버로 요청
    var url = 'http://10.0.2.2:9090/board';

    // http.get( url, header )
    var response = await http.get(Uri.parse(url));
    // response : [ {"title" : '제목', "wrtier" : '작성자', "content" : '내용'}, ...]
    print('response.body :');
    print(response.body);

     
    print('boardList :');
    // UTF-8 디코딩
    var utf8Decoded = utf8.decode( response.bodyBytes );
    // JSON 디코딩
    var boardList = jsonDecode( utf8Decoded );
    List<Board> result = [];

    // print(boardList[0]['title']);

    for (var i = 0; i < boardList.length; i++) {
      result.add( Board(
                        // boardNo: boardList[i]['boardNo'],
                        // title: boardList[i]['title'],
                        // writer: boardList[i]['writer'],
                        // content: boardList[i]['content'],
                        // regDate: boardList[i]['regDate'],
                        // updDate: boardList[i]['updDate'],
                        // views: boardList[i]['views'],
                        // like: boardList[i]['like'],

      ));
    }

    print( result );
    return result;
  }

  
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
          lang.S.of(context).boardTitle, //커뮤니티
          style: kTextStyle.copyWith(
            color: kWhite,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
       body: SingleChildScrollView(
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
          child: Column(
            children: [
              for (int index = 0; index < 4; index++)
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: kBorderColorTextField,
                    ),
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _boardList.length,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemBuilder: (BuildContext context, int index) {
                      Map post = posts[index];
                      return PostItem(
                        // boardNo: _boardList[index].boardNo,
                        // writer: _boardList[index].writer,
                        // title: _boardList[index].title,
                        // content: _boardList[index].content,
                        // regDate: _boardList[index].regDate,
                        // updDate: _boardList[index].updDate,
                        // views: _boardList[index].views,
                        // like: _boardList[index].like,

                        img: post['img'],
                        time: post['time'],
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'upload',
        backgroundColor: Colors.amber[300],
        foregroundColor: Theme.of(context).primaryColor,
        splashColor: Colors.blue,
        hoverColor: Colors.green,
        elevation: 10,
        highlightElevation: 20,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const BoardUploadScreen(),
            ),
          );
        },
        child: const Icon(
          Icons.upgrade,
          size: 30,
        ),
      ),
    );
  }
}
