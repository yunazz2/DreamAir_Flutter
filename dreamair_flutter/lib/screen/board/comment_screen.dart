import 'dart:convert';

import 'package:flight_booking/screen/board/comment.dart';
import 'package:flight_booking/screen/board/comment_input.dart';
import 'package:flight_booking/screen/board/comment_item.dart';
import 'package:flight_booking/screen/board/social/util/data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CommentScreen extends StatefulWidget {
  final int boardNo;
  const CommentScreen({Key? key, required this.boardNo, required Null Function() onCommentPosted}) : super(key: key);

  @override
  State<CommentScreen> createState() => _CommentScreenState();

  deleteItem(String string) {}
}

class _CommentScreenState extends State<CommentScreen> {
  final List<Comment> _commentList = [];

  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();

    // 처음 데이터 로드
    getCommentList(widget.boardNo);

    // 스크롤 이벤트 감지
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        getCommentList(widget.boardNo);
      }
    });
  }

  Future<void> getCommentList(int boardNo) async {
    try{
      var url = 'http://10.0.2.2:9090/comment/$boardNo';
      var response = await http.get(Uri.parse(url));

      if (response.statusCode == 200 || response.statusCode == 201) {
        var utf8Decoded = utf8.decode(response.bodyBytes);
        var commentList = jsonDecode(utf8Decoded);

        List<Comment> result = [];

        for (var i = 0; i < commentList.length; i++) {
          result.add(Comment(
            commentNo: commentList[i]['commentNo'],
            boardNo: commentList[i]['boardNo'],
            parentTable: commentList[i]['parentTable'],
            parentNo: commentList[i]['parentNo'],
            writer: commentList[i]['writer'],
            content: commentList[i]['content'],
            regDate: commentList[i]['regDate'],
            updDate: commentList[i]['updDate'],
          ));
        }

        setState(() {
          _commentList.addAll(result);
        });

      } else {
        print('Error loading data: Status code ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    }catch(e){
      print('Error loading data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Container(
        width: double.infinity,
        height: 350,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 244, 248, 250), // 댓글창 색상
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            topLeft: Radius.circular(30),
          ),
        ),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Icon(Icons.star_border_purple500),
              SizedBox(width: 10,),
              Text('댓글', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,),),
              SizedBox(width: 10,),
              Icon(Icons.star_border_purple500),
            ],),
            const SizedBox(height: 10,),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _commentList.length,
                itemBuilder: (BuildContext context, int index) {
                  Map<String, dynamic> comment = comments[index];
                  return CommentItem(
                    comment: _commentList[index],
                    img: comment['img'],
                    // name: comment['name'],
                    time: comment['time'],
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            CommentInput(boardNo: widget.boardNo, content: '',), // 댓글 입력 창
          ],
        ),
      ),
    );
  }
}
