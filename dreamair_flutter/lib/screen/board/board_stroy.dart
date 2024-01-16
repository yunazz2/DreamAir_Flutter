// 게시판 component
import 'package:flutter/material.dart';

class BoardStory extends StatefulWidget {
  const BoardStory({super.key});

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
            SizedBox(
              child: Row(
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
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        // Container(
        //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
        //   child: const Column(
        //     children: [
        //       SizedBox(
        //         height: 5,
        //       ),
        //       Text("test"),
        //     ],
        //   ),
        // ),

        // 이미지
        const SizedBox(
          height: 10,
        ),
        const Placeholder(),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              child: Row(
                children: [
                  Icon(
                    Icons.favorite_outline,
                    color: Colors.pink,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text('좋아요'),
                ],
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            SizedBox(
              child: Row(
                children: [
                  Icon(
                    Icons.comment_outlined,
                    color: Colors.amber[700],
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    '댓글 달기',
                  ),
                ],
              ),
            ),
            // const SizedBox(
            //   child: Row(
            //     children: [
            //       Icon(
            //         Icons.share,
            //         color: Colors.green,
            //       ),
            //       SizedBox(
            //         width: 5,
            //       ),
            //       Text('공유하기'),
            //     ],
            //   ),
            // ),
          ],
        )
      ],
    );
  }
}