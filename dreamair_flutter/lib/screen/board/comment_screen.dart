import 'package:flight_booking/screen/board/comment_item.dart';
import 'package:flight_booking/screen/board/social/util/data.dart';
import 'package:flight_booking/screen/widgets/constant.dart';
import 'package:flutter/material.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen({super.key, Key? comment});
  
    @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SingleChildScrollView(
        primary: false,
        physics: const BouncingScrollPhysics(),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
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
                // shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                itemCount: comments.length,
                itemBuilder: (BuildContext context, int index) {
                  Map comment = comments[index];
                  return CommentItem(
                    img: comment['img'],
                    name: comment['name'],
                    time: comment['time'],
                  );
                },
              ),
              const SizedBox(height: 20),
              // CommentInput(), // 댓글 입력 창
            ],
          ),
        ),
      ),
    );
  }

}