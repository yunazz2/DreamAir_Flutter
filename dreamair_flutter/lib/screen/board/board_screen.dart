import 'dart:convert';

import 'package:flight_booking/screen/board/board_stroy.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BoardScreen extends StatefulWidget {
  const BoardScreen({super.key});

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {

  List<String> boardList = [];

  final ScrollController _controller = ScrollController();

  int _page = 1;
  Map<String,dynamic> _pageObj = {'last':0};

  @override
  void initState() {
    super.initState();

    // 처음 데이터
    fetch();
    
    // 다음 페이지 (스크롤)
    _controller.addListener(() { 
      // 스크롤 맨 밑
      // _controller.position.maxScrollExtent : 스크롤 위치의 최댓값
      // _controller.position.offset          : 현재 스크롤 위치
      print('현재 스크롤 : ${_controller.offset}');
      
      if(_controller.position.maxScrollExtent < _controller.offset + 50) {
        // 데이터 요청 (다음 페이지)
        fetch();
      }
    });
  }

  Future fetch() async {
    print('fetch...');
    // http 
    // 1. URL 인코딩
    // 2. GET 방식 요청
    // final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');

    // final url = Uri.parse('http://10.0.2.2:9090/board?page=${_page}');
    final url = Uri.parse('http://10.0.2.2:9090/board?page=${_page}');
    final response = await http.get(url);

    if( response.statusCode == 200 ) {
      setState(() {
        // boardList.addAll(['New']);

        // JSON 문자열 ➡ List<>
        var utf8Decoded = utf8.decode( response.bodyBytes );
        var result = json.decode(utf8Decoded);
        final page = result['page'];
        final List list = result['list'];
        // final List newData = json.decode(utf8Decoded);
        print('page : ');
        // print(page);
        // _pageObj = page;

        boardList.addAll( list.map<String>((item) {
          // Map<String, ?>  : 요소 접근 - item.['key']
          // Item (id, title, body)
          // final id = item['id'];

          final boardNo = item['boardNo'];
          final writer = item['writer'];
          final title = item['title'];
          final content = item['content'];
          final regDate = item['regDate'];
          final updDate = item['updDate'];
          final date = item['date'];
          final views = item['views'];
          final like = item['like'];

          return '$boardNo  - $writer - $title -  $content';
        }));

        // 다음 페이지
        // _page++;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        title: const Text('여행 커뮤니티', 
          style: TextStyle(
            // fontSize: 20,
            // fontWeight: FontWeight.w500,
            // letterSpacing: 5,
            ),
        ),
      ),
      body: const SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            child: BoardStory(),
          ),
        ),

      // ListView.builder(
      //   controller: _controller,
      //   padding: const EdgeInsets.fromLTRB(8, 60, 8, 8),
      //   itemBuilder: (context, index) {
      //     // index: 0~19
      //     if( index < boardList.length ){
      //       final item = boardList[index];
      //       return ListTile(title: Text(item),);
      //     } 
      //     // index: 20
      //     else if( (_page-1) > 1 && _page < _pageObj['last']! ) {
      //       return const Padding(
      //         padding: EdgeInsets.symmetric(vertical: 40.0),
      //         child: Center(
      //           child: CircularProgressIndicator(),
      //         ),
      //       );
      //     }
      //   },
      //   itemCount: boardList.length + 1,  // ProgressIndicator(+1)
      // )
      
    );
  }
}