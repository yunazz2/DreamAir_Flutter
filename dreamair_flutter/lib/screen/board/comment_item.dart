import 'package:flight_booking/screen/board/comment_screen.dart';
import 'package:flight_booking/screen/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CommentItem extends StatefulWidget {
  final String name;
  final String time;
  final String img;

  const CommentItem({
    super.key,
    required this.name,
    required this.time,
    required this.img,
  });

@override
  _CommentItemState createState() => _CommentItemState();
}

class _CommentItemState extends State<CommentItem> {

  @override
  Widget build(BuildContext context) {
  return Card(
    child: Column(
      children: [
        ListTile(
          // 프로필 이미지
          leading : const Column(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: 
                  AssetImage('images/logo2.png'),
              ),
            ],
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text('ID 자리', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
            const SizedBox(height: 5,),
            Text('댓글이 여기에 있어요 댓글이 여기에 있어요 댓글이 여기에 있어요', style: TextStyle(fontSize: 12,),),
            const SizedBox(width: 0, height: 2,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              // Like button
              IconButton(
                onPressed: () {},
                iconSize: 13,
                visualDensity: VisualDensity.compact,
                icon: const Icon(
                  Icons.thumb_up_outlined,
                ),
                selectedIcon: const Icon(
                  Icons.thumb_up,
                ),
              ),
              // Unlike button
              IconButton(
                onPressed: () {},
                iconSize: 13,
                visualDensity: VisualDensity.compact,
                icon: const Icon(
                  Icons.thumb_down_outlined,
                ),
                selectedIcon: const Icon(
                  Icons.thumb_down,
                ),
              ),
              ],
            ),
          ]),
          // 더보기(수정/삭제) 기능
        trailing: Column(
          children: [
            PopupMenuButton<int>(
              padding: EdgeInsets.zero,
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Center(
                    child: const Text('삭제').onTap(() {
                      setState(() {});
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const CommentScreen(), // boardNo 보내야함
                        ),
                      );
                    }),
                  ),
                ),
              ],
              offset: const Offset(0, 30),
              color: kWhite,
              elevation: 1.0,
            ),
          ]),
      ),
      ],),
  );
  }
}