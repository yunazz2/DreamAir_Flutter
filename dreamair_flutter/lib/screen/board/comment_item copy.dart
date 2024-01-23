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
    return Column(
      children: [
        ListTile(
          leading: const CircleAvatar(
            backgroundImage: AssetImage('images/logo2.png'),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'ID 자리입니다.',
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
              const Text('댓글이 여기에 있습니다.'),
            ],
          ),
          trailing: Row(
            children: [
              // Like button
              IconButton(
                onPressed: () {},
                iconSize: 17,
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
                iconSize: 17,
                visualDensity: VisualDensity.compact,
                icon: const Icon(
                  Icons.thumb_down_outlined,
                ),
                selectedIcon: const Icon(
                  Icons.thumb_down,
                ),
              ),
              const SizedBox(width: 10),
              // PopupMenuButton for additional actions
              PopupMenuButton<int>(
                padding: EdgeInsets.zero,
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Center(
                      child: const Text('댓글 수정').onTap(() {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (BuildContext context) => const CommentUpdateScreen(),
                        //   ),
                        // );
                      }),
                    ),
                  ),
                  const PopupMenuDivider(),
                  PopupMenuItem(
                    child: Center(
                      child: const Text('댓글 삭제').onTap(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => const CommentScreen(),
                          ),
                        );
                      }),
                    ),
                  ),
                  // Add more popup menu items as needed
                ],
                offset: const Offset(0, 30),
                color: kWhite,
                elevation: 1.0,
              ),
            ],
          ),
        ),
        Row(
          children: [
            // Reply button
            const SizedBox(width: 40),
            TextButton(
              onPressed: () {},
              style: const ButtonStyle(visualDensity: VisualDensity.compact),
              child: Row(
                children: [
                  Text(
                    '답글',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(width: 7),
                  Text(
                    '254개',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
