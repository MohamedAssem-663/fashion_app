import 'package:fashion/componants/custom_divider.dart';
import 'package:fashion/componants/custom_text.dart';
import 'package:fashion/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class Bromo extends StatelessWidget {
  const Bromo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset("assets/svgs/promo.svg", width: 30),
            Gap(10),
            Customtext(
              text: "Add Promo Code",
              fontSize: 20,
              weight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ],
        ),
        Gap(20),
        CustomDivider(),
        Gap(20),
        Row(
          children: [
            SvgPicture.asset("assets/svgs/delivery.svg", width: 30),
            Gap(20),
            Customtext(
              text: "Delivery",
              fontSize: 20,
              weight: FontWeight.bold,
              color: AppColors.primary,
            ),
            Spacer(),
            Customtext(
              text: "FREE",
              fontSize: 18,
              color: AppColors.primary,
              spacing: 2,
            ),
          ],
        ),
      ],
    );
  }
}
