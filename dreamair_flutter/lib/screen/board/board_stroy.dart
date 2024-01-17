// 게시판 component
import 'package:flight_booking/screen/board/comment_screen.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';


class BoardStory extends StatefulWidget {
  const BoardStory({Key? key}) : super(key: key);

  @override
  State<BoardStory> createState() => _BoardStoryState();
}

class _BoardStoryState extends State<BoardStory> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              // 작성자 정보
              children: [
                // ProfileImage(imageurl: 'assets/images/profile2.png'),
                Icon(Icons.face),
                SizedBox(
                  width: 5,
                ),
                Text('작성자'),
              ],
            ),
          ],
        ),
        // 이미지
        const SizedBox(
          height: 10,
        ),
        // 이미지 불러오는 자리
        const Placeholder(),
        const SizedBox(
          height: 10,
        ),

        // 좋아요 버튼
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              child: Row(
                children: [
                  LikeButton(
                    likeBuilder: (bool isLiked) {
                      return isLiked ? const Icon(Icons.favorite, color: Colors.pink) : const Icon(Icons.favorite_outline, color: Colors.pink);
                    },
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text('좋아요'),
                ],
              ),
            ),
            
         
            const SizedBox(
              width: 20,
            ),

            // 댓글 달기
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const CommentScreen(),
                      ),
                    );
                  },
                  child: Icon(
                    Icons.comment_outlined,
                    color: Colors.amber[700],
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  '댓글 달기',
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
          //  IconButton(
          //   iconSize: 72,
          //   icon: const Icon(Icons.favorite),
          //         ),
        // 내용
        const SizedBox(
          height: 5,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: const Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Text(
                "content content content content content content content content content content content content content",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
