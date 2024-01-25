import 'package:flight_booking/screen/board/comment.dart';
import 'package:flight_booking/screen/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nb_utils/nb_utils.dart';

class CommentItem extends StatefulWidget {
  final Comment comment;
  // final String name;
  final String time;
  final String img;

  const CommentItem({
    super.key,
    // required this.name,
    required this.time,
    required this.img, 
    required this.comment,
  });

@override
  _CommentItemState createState() => _CommentItemState();
}

class _CommentItemState extends State<CommentItem> {

  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();


  }

  // 댓글 삭제
  Future<void> deleteItem(String commentNo) async {
  final url = 'http://10.0.2.2:9090/comment/$commentNo';
  final response = await http.delete(Uri.parse(url));

    if (response.statusCode == 200 || response.statusCode == 201 ) {
      // 삭제 성공
      ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('댓글이 삭제되었습니다.'),
        ),
      );
      print('Item deleted successfully');
    } else {
      // 삭제 실패
      ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('댓글 삭제에 실패했습니다.'),
        ),
      );
      print('Failed to delete item. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
}

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
            Text(widget.comment.writer, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
            const SizedBox(height: 5,),
            Text(widget.comment.content, style: TextStyle(fontSize: 12,),),
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
                      child: const Text('삭제').onTap(() async {
                        await deleteItem(widget.comment.commentNo.toString());
                        setState(() { });
                        Navigator.pop(context);
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