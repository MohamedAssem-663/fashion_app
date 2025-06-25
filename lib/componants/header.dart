import 'package:fashion/componants/custom_text.dart';
import 'package:fashion/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Customtext(
          text: title.toUpperCase(),
          fontSize: 30,
          color: AppColors.primary,
          spacing: 3,
        ),
        Gap(5),
        Image.asset(
          "assets/svgs/line.png",
          width: 230,
          color: AppColors.primary,
        ),
        Gap(20),
      ],
    );
  }
}
