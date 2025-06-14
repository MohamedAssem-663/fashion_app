import 'package:flutter/material.dart';

class Customtext extends StatelessWidget {
  const Customtext({
    super.key,
    required this.text,
    this.fontSize = 16,
    this.weight = FontWeight.normal,
    this.color = Colors.white,
    this.max = 1,
  });
  final String text;
  final double fontSize;
  final FontWeight weight;
  final Color color;
  final int max;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: max,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: weight,
        fontFamily: "TenorSans",
      ),
    );
  }
}
