import 'package:flutter/material.dart';


class SocialIcon extends StatelessWidget {
  const SocialIcon({
    Key? key,
    required this.bgColor,
    required this.iconColor,
    required this.icon,
    required this.borderColor,
  }) : super(key: key);
  final IconData icon;
  final Color bgColor;
  final Color iconColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: borderColor),
        color: bgColor,
      ),
      child: Icon(
        icon,
        color: iconColor,
      ),
    );
  }
}