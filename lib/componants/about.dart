import 'package:fashion/componants/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class About extends StatelessWidget {
  const About({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Customtext(text: "About", fontSize: 30),
        Gap(30),
        Customtext(text: "Contact", fontSize: 30),
        Gap(30),
        Customtext(text: "Blog", fontSize: 30),
      ],
    );
  }
}
