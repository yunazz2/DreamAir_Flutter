import 'package:flight_booking/screen/board/comment_item.dart';
import 'package:flight_booking/screen/board/social/util/data.dart';
import 'package:flutter/material.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({Key? key}) : super(key: key);

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
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
                itemCount: comments.length,
                itemBuilder: (BuildContext context, int index) {
                  Map<String, dynamic> comment = comments[index];
                  return CommentItem(
                    img: comment['img'],
                    name: comment['name'],
                    time: comment['time'],
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            // CommentInput(), // 댓글 입력 창
          ],
        ),
      ),
    );
  }
}
