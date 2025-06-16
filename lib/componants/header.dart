import 'package:fashion/componants/custom_text.dart';
import 'package:fashion/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Customtext(
          text: "CHECKOUT",
          fontSize: 30,
          color: AppColors.primary,
          spacing: 10,
        ),
        Gap(5),
        Image.asset(
          "assets/svgs/line.png",
          width: 230,
          color: AppColors.primary,
        ),
      ],
    );
  }
}
