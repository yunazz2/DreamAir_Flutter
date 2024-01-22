import 'package:flutter/material.dart';

class OverflowText extends StatefulWidget {
  final String text;

  const OverflowText({Key? key, required this.text}) : super(key: key);

  @override
  _OverflowTextState createState() => _OverflowTextState();
}

class _OverflowTextState extends State<OverflowText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    String displayText = isExpanded
        ? widget.text
        : (widget.text.length > 30 ? "${widget.text.substring(0, 30)}..." : widget.text);

    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text(
                  displayText,
                ),
                const SizedBox(height: 5),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  child: Text(
                    isExpanded ? "접기" : "더보기",
                    style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
