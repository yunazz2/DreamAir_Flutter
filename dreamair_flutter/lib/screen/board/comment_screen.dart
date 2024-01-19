import 'package:flight_booking/generated/l10n.dart' as lang;
import 'package:flight_booking/screen/widgets/constant.dart';
import 'package:flutter/material.dart';

class CommentScreen extends StatelessWidget {
  final String sheetTitle;

  const CommentScreen({
    super.key,
    required this.sheetTitle,
  });

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
            child: GestureDetector(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                  bottom: 12,
                ),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              sheetTitle,
                              style: const TextStyle(
                                fontFamily: 'AppBarKorean',
                                fontSize: 17,
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  iconSize: 20,
                                  icon: const Icon(Icons.tune),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  iconSize: 20,
                                  icon: const Icon(Icons.close),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Divider(
                          thickness: 1.0,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, index) => const CommentList(),
                            itemCount: 50,
                          ),
                        ),
                        const Divider(
                          thickness: 1.0,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.black),
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                           const Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: '댓글 입력',
                                  filled: true,
                                  suffixIcon: Icon(Icons.upload),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
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
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  visualDensity: VisualDensity.comfortable,
                  padding: EdgeInsets.zero,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 1),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '',
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            ),
                            const Text('댓들이 여기에 있습니다.'),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  iconSize: 17,
                                  visualDensity: VisualDensity.compact,
                                  icon: const Icon(
                                    Icons.thumb_up_outlined,
                                  ),
                                  // 아래의 selectedIcon은 없는 것처럼 처리
                                ),
                                IconButton(
                                  onPressed: () {},
                                  iconSize: 17,
                                  visualDensity: VisualDensity.compact,
                                  icon: const Icon(
                                    Icons.thumb_down_outlined,
                                  ),
                                  // 아래의 selectedIcon은 없는 것처럼 처리
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                IconButton(
                                  onPressed: () {},
                                  iconSize: 17,
                                  visualDensity: VisualDensity.compact,
                                  icon: const Icon(
                                    Icons.comment_outlined,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.campaign_outlined,
                      ),
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
              style: TextButton.styleFrom(
                visualDensity: VisualDensity.compact,
              ),
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
