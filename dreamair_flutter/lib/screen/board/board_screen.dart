import 'dart:convert';

import 'package:flight_booking/generated/l10n.dart' as lang;
import 'package:flight_booking/screen/board/board.dart'; // 추가: Board 모델 추가
import 'package:flight_booking/screen/board/board_upload_screen.dart';
import 'package:flight_booking/screen/board/file.dart';
import 'package:flight_booking/screen/board/social/util/data.dart';
import 'package:flight_booking/screen/board/social/views/widgets/post_item.dart';
import 'package:flight_booking/screen/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BoardScreen extends StatefulWidget {
  const BoardScreen({Key? key}) : super(key: key);

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  int _page = 1;
  final List<Board> _boardList = [];
  final List<Files> _fileList = [];
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

        for (var i = 0; i < boardList.length; i++) {
          result.add(Board(
            boardNo: boardList[i]['boardNo'],
            title: boardList[i]['title'],
            writer: boardList[i]['writer'],
            content: boardList[i]['content'],
            regDate: boardList[i]['regDate'],
            updDate: boardList[i]['updDate'],
            views: boardList[i]['views'],
            like: boardList[i]['like'],
          ));
          //boardNo를 매개변수로 넣어줘야함
          getImage(result[i].boardNo);
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

//이미지 가져오기
Future<void> getImage(int boardNo) async {
  try {
    // 데이터를 가져오는 비동기 작업
    var url = 'http://10.0.2.2:9090/board/$boardNo';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200 || response.statusCode == 201) {
        var utf8Decoded = utf8.decode(response.bodyBytes);
        var fileList = jsonDecode(utf8Decoded);

      List<Files> result = [];

        for (var i = 0; i < fileList.length; i++) {
          result.add(Files(
            boardNo: fileList[i]['boardNo'],
            fileNo: fileList[i]['fileNo'],
            parentTable: 'board',
            parentNo: fileList[i]['parentNo'],
            fileName: fileList[i]['fileName'],
            originName: fileList[i]['originName'],
            filePath: fileList[i]['filePath'],
            fileSize: fileList[i]['fileSize'],
            regDate: fileList[i]['regDate'],
            updDate: fileList[i]['updDate'],
            fileCode: fileList[i]['fileCode'],
            fileType: fileList[i]['fileType'],
          ));
        }

          setState(() {
            _fileList.addAll(result);
          });

    } else {
      print('Error loading image: Status code ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  } catch (e) {
    print('Error loading image: $e');
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
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
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
                  ListView.builder(
                    controller: _controller,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
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
                            fileList: _fileList,
                            img: posts[index]['img'],
                            time: posts[index]['time'],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
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