import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CommentInput extends StatefulWidget {
  final int boardNo;
  final String content;

  const CommentInput({Key? key, required this.boardNo, required this.content}) : super(key: key);

  @override
  State<CommentInput> createState() => _CommentInputState();
}

class _CommentInputState extends State<CommentInput> {
  final TextEditingController _writerController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // _writerController.text = '작성자'; // 원래는 initState에서 작성자를 설정하는 부분
  }

  // postComment 메소드 정의
  Future<void> _postComment(int boardNo, String content) async {
    var uri = Uri.parse('http://10.0.2.2:9090/comment/$boardNo');

    _writerController.text = '작성자'; // 여기 내용 나중에 userId로 받아야함
    try {
    var response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'content': _commentController.text,
        'writer': _writerController.text,
        'parent_table': 'board',
        'parent_no': boardNo,
      }),
    );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // 업로드 성공
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('댓글이 등록되었습니다.'),
          ),
        );

        // 댓글 등록 성공 후 CommentScreen으로 이동
        // _navigateToCommentScreen(context);
      } else {
        print('Error loading data: Status code ${response.statusCode}');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('댓글 등록에 실패했습니다.'),
          ),
        );
      }
    } catch (e) {
      print('Error loading data: $e');
    }
  }

  // Future<void> _navigateToCommentScreen(BuildContext context) async {
  //   await Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (BuildContext context) => CommentScreen(
  //         boardNo: widget.boardNo,
  //         onCommentPosted: () {
  //           // 댓글이 성공적으로 등록되면 이 메소드가 호출됨
  //           // 원하는 작업을 수행할 수 있음
  //         },
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage('images/logo2.png'), // 프로필 이미지
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10), // 조절 가능한 여백
              width: double.infinity,
              height: 50,
              child: TextField(
                controller: _commentController,
                decoration: InputDecoration(
                  hintText: '댓글 입력',
                  filled: true,
                  suffixIcon: TextButton(
                    onPressed: () {
                      _postComment(widget.boardNo, widget.content);
                    },
                    child: Text('게시'),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
