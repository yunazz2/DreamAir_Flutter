import 'package:flight_booking/screen/board/board_detail.dart';
import 'package:flutter/material.dart';

class OverflowText extends StatelessWidget {
  const OverflowText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: () {
                // "더 보기" 클릭 시 실행할 코드
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => BoardDetail(),
                  ),
                );
              },
              child: const Column(
                children: [
                  SizedBox(height: 10),
                  Text(
                    "content content content content content content content content content content content content content",
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5),
                  Text(
                    "더보기",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 10
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}