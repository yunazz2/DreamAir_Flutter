import 'package:flight_booking/screen/board/board.dart';
import 'package:flight_booking/screen/board/board_update_screen.dart';
import 'package:flight_booking/screen/board/comment_screen.dart';
import 'package:flight_booking/screen/board/file.dart';
import 'package:flight_booking/screen/widgets/constant.dart';
import 'package:flight_booking/screen/widgets/overflow_text.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:like_button/like_button.dart';
import 'package:nb_utils/nb_utils.dart';

class PostItem extends StatefulWidget {
  final Board board;
  final String time;
  final String img;
  final String dp;
  final Files file;
  // final List<Files> fileList;

  const PostItem({
    super.key,
    required this.time,
    required this.img,
    required this.board,
    required this.file, required this.dp,
  });

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  
  // 댓글 가져오기
  Future<void> fetchComments(String boardNo) async {
    try {
      final url = 'http://13.209.3.162/comment/$boardNo'; // 적절한 엔드포인트로 수정
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.body);
        // widget.fetchData(); // 댓글을 가져온 후 데이터 갱신
      } else {
        // 에러 처리
        print('Failed to fetch comments. Status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }
    } catch (e) {
      // 예외 처리
      print('Error fetching comments: $e');
    }
  }

  // 댓글 창을 띄우는 함수
  void _showCommentSheet(BuildContext context) {
    double bottomPadding = MediaQuery.of(context).viewInsets.bottom ?? 0.0;
  
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(bottom: bottomPadding),
          child: Container(
            height: bottomPadding+500,
            width: double.infinity,
            child: CommentScreen(
              boardNo: widget.board.boardNo,
              onCommentPosted: () {
                // 댓글이 작성되었을 때의 콜백
                // 여기에서 댓글을 가져와 데이터를 갱신
                fetchComments(widget.board.boardNo.toString());
              },
            ),
          ),
        );
      },
    );
  }

  // 게시판 삭제
  Future<void> deleteItem(String boardNo) async {
    final url = 'http://13.209.3.162/board/$boardNo';
    final response = await http.delete(Uri.parse(url));

    if (response.statusCode == 200 || response.statusCode == 201) {
      // 삭제 성공
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('게시글이 삭제되었습니다.'),
        ),
      );
      print('Item deleted successfully');
    } else {
      // 삭제 실패
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('게시글 삭제에 실패했습니다.'),
        ),
      );
      print('Failed to delete item. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  }

  @override
  Widget build(BuildContext context) {

    print('#### fileNo : ${widget.file.fileNo}');
    Board board = widget.board;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(
                  widget.dp, // 프로필 이미지
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
                          child: const Text('삭제').onTap(() async {
                            await deleteItem(widget.board.boardNo.toString());
                            setState(() {});
                            Navigator.pop( context); // 현재 화면을 닫고 이전 화면으로 돌아가기
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
            // 이미지 불러오는 자리
              // if (widget.file.fileNo != null)
                // Image.network(
                //   'http://13.209.3.162/file/img/${widget.file.fileNo}', // Image URL
                //   width: 100,
                //   height: 100,
                //   fit: BoxFit.cover,
                // ),
            Image.asset(
              // widget.file.filePath.toString(), // 이미지
              widget.img,
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
                  fetchComments(widget.board.boardNo.toString());

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
            const SizedBox(height: 10,),
            // 내용
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            // Text('내용 부분boardNo'),
                            OverflowText(text: '${board.content}',),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
          ],
        ),
      ],
    );
  }
}