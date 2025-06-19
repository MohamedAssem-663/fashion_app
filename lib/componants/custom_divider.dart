import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, this.indent = 0, this.endIndent = 0});
  final double indent;
  final double endIndent;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.black,
      thickness: 0.7,
      indent: indent,
      endIndent: endIndent,
      height: 1,
    );
  }
}
