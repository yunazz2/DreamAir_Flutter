import 'package:flight_booking/generated/l10n.dart' as lang;
import 'package:flight_booking/screen/board/comment_input.dart';
import 'package:flight_booking/screen/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class CommentScreen extends StatelessWidget {
  const CommentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        titleSpacing: 0,
        elevation: 0,
        backgroundColor: kPrimaryColor,
        iconTheme: const IconThemeData(color: kWhite),
        centerTitle: true,
        title: Text(
          lang.S.of(context).CommentTitle,
          style: kTextStyle.copyWith(
            color: kWhite,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        primary: false,
        physics: const BouncingScrollPhysics(),
        child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 700),
            child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10.0),
          decoration: const BoxDecoration(
            color: kWhite,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ),
            
          ),
          child:GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 40,
            ),
 
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommentList(),
                  // TextField(
                  //   autofocus: true,
                  //   decoration: InputDecoration(
                  //     hintText: '댓글 입력',
                  //     suffixIcon: Icon(
                  //       Icons.send,
                  //       color: Colors.blueAccent,
                  //     ),
                  //   ),
                  // ),
                  CommentInput(),   // 댓글 입력 창
                ],
              ),
            ),               
          ),
        ),
        ),
      ),
      );
  }
}

class CommentList extends StatelessWidget {
  const CommentList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextButton(
                onPressed: () {},
                style: const ButtonStyle(
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  visualDensity: VisualDensity.comfortable,
                  padding: MaterialStatePropertyAll(EdgeInsets.zero),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // replier profile
                        // Container(
                        //   width: 35,
                        //   height: 35,
                        //   decoration: BoxDecoration(
                        //     shape: BoxShape.circle,
                        //     border: Border.all(width: 1),
                        //   ),
                        // ),
                        const CircleAvatar(
                            backgroundImage: AssetImage('images/logo2.png'),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'ID 자리입니다.',
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            ),
                            const Text('댓글이 여기에 있습니다.'),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Like
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

                                // Unlike
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
                                const SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),

                    Column(
                      children: [
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
                            // popupmenu item 2
                          ],
                          offset: const Offset(0, 30),
                          color: kWhite,
                          elevation: 1.0,
                        )
                      ],
              ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            const SizedBox(
              width: 40,
            ),
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
                  const SizedBox(
                    width: 7,
                  ),
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