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
  int _page = 1;
  final List<Board> _boardList = [];
  bool _loading = false;

  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();

    // 처음 데이터 로드
    _loadData();

    // 스크롤 이벤트 감지
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        // 스크롤이 끝에 도달하면 다음 페이지 로드
        _loadData();
      }
    });
  }

  Future<void> _loadData() async {
    if (_loading) {
      return;
    }

    setState(() {
      _loading = true;
    });

    try {
      // 데이터를 가져오는 비동기 작업
      var url = 'http://10.0.2.2:9090/board/list?page=$_page';
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200 || response.statusCode == 201) {
        var utf8Decoded = utf8.decode(response.bodyBytes);
        var boardList = jsonDecode(utf8Decoded);

        List<Board> result = [];

        for (var i = 0; i < boardList['list'].length; i++) {
          result.add(Board(
            boardNo: boardList['list'][i]['boardNo'],
            title: boardList['list'][i]['title'],
            writer: boardList['list'][i]['writer'],
            content: boardList['list'][i]['content'],
            regDate: boardList['list'][i]['regDate'],
            updDate: boardList['list'][i]['updDate'],
            views: boardList['list'][i]['views'],
            like: boardList['list'][i]['like'],
          ));
        }

        setState(() {
          _boardList.addAll(result);
          _page++;

          _loading = false;
        });
      } else {
        print('Error loading data: Status code ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      print('Error loading data: $e');
      setState(() {
        _loading = false;
      });
    }
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
          lang.S.of(context).boardTitle,
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
            child: ListView.builder(
              itemCount: _boardList.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: kBorderColorTextField,
                    ),
                  ),
                  child: PostItem(
                    board: _boardList[index],
                    img: posts[index]['img'],
                    time: posts[index]['time'],
                  ),
                );
              },
            )),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'upload',
        backgroundColor: Colors.amber[300],
        foregroundColor: Theme.of(context).primaryColor,
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
