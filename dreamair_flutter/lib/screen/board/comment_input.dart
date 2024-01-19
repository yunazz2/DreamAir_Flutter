import 'package:flutter/material.dart';
class CommentInput extends StatefulWidget {

  const CommentInput({super.key});

  @override
  State<CommentInput> createState() => _CommentInputState();
}

class _CommentInputState extends State<CommentInput> {
  @override
  Widget build(BuildContext context) {
    return Row(
  children: [
    const CircleAvatar(
      backgroundImage: AssetImage('images/logo2.png'),
    ),
    const SizedBox(width: 10),
    Expanded(
      child: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10), // 조절 가능한 여백
          width: double.infinity,
          height: 50,
          child: TextField(
            decoration: InputDecoration(
              hintText: '댓글 입력',
              filled: true,
              suffixIcon: TextButton(
                onPressed: postComment, // 게시 버튼 누르면 DB 등록
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

// postComment 메소드 정의
void postComment() {
  // 게시 버튼이 눌렸을 때 실행되는 코드를 작성합니다.
  // 예시: print('댓글이 게시되었습니다.');
}