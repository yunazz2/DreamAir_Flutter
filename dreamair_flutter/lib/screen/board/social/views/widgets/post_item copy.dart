import 'package:flight_booking/screen/board/board.dart';
import 'package:flight_booking/screen/board/board_screen.dart';
import 'package:flight_booking/screen/board/board_update_screen.dart';
import 'package:flight_booking/screen/board/comment_screen.dart';
import 'package:flight_booking/screen/widgets/constant.dart';
import 'package:flight_booking/screen/widgets/overflow_text.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:nb_utils/nb_utils.dart';

class PostItem extends StatefulWidget {
  final Board board;
  final String time;
  final String img;

  const PostItem({
    super.key,
    required this.time,
    required this.img,
    required this.board,
  });

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  // 댓글 창을 띄우는 함수
  void _showCommentSheet(BuildContext context) {
    double bottomPadding = MediaQuery.of(context).viewInsets.bottom ?? 0.0;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          padding: EdgeInsets.only(bottom: bottomPadding),
          // child: const CommentScreen(boardNo: widget.board.boardNo),
          child: const CommentScreen(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    String _text = '';

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: InkWell(
        child: Column(children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(
                widget.img, // 이미지
              ),
            ),
            contentPadding: const EdgeInsets.all(0),
            title: Text(
              widget.board.writer, // 작성자
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            // 더보기(수정/삭제) 기능
            trailing: Column(
              children: [
                PopupMenuButton<int>(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Center(
                        child: const Text('수정').onTap(() {
                          setState(() {});
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const BoardUpdateScreen(),
                            ),
                          );
                        }),
                      ),
                    ),
                    const PopupMenuDivider(), // Divider 추가
                    PopupMenuItem(
                      child: Center(
                        child: const Text('삭제').onTap(() {
                          setState(() {});
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const BoardScreen(),
                            ),
                          );
                        }),
                      ),
                    ),
                    // popupmenu item 2
                  ],
                  offset: const Offset(0, 30),
                  color: kWhite,
                  elevation: 1.0,
                )
              ],
            ),
          ),
          Image.asset(
            widget.img, // 이미지
            height: 230,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10),

          // 좋아요/댓글
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              child: Row(
                children: [
                  LikeButton(
                    likeBuilder: (bool isLiked) {
                      return isLiked
                          ? const Icon(Icons.favorite, color: Colors.pink)
                          : const Icon(Icons.favorite_outline,
                              color: Colors.pink);
                    },
                  ),
                  const SizedBox(width: 5),
                  const Text('좋아요'),
                ],
              ),
            ),
            const SizedBox(width: 10),
            //// 댓글 기능 부분
            GestureDetector(
              onTap: () {
                _showCommentSheet(context);
              },
              child: Icon(
                Icons.comment_outlined,
                color: Colors.amber[700],
              ),
            ),
            const SizedBox(width: 5),
            const Text('댓글'),
          ]),
          const SizedBox(height: 5),
          Row(
            children: [
              // 업로드 시간 표시
              const SizedBox(width: 10),
              Text(
                widget.time,
                style: const TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 11,
                ),
              ),
            ],
          ),
          // 내용
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: const Column(
                    children: [
                      Row(
                        children: [
                          Text('boardNo'),
                          OverflowText(text: 'widget.board.content 자리....ㅜㅜ'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(thickness: 0.5),
        ]),
        onTap: () {},
      ),
    );
  }
}
