import 'package:fashion/componants/custom_text.dart';
import 'package:fashion/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.isSvgg,
    required this.titel,
    this.onTap,
  });
  final bool isSvgg;
  final String titel;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    bool isSvg = isSvgg;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: AppColors.primary,
        width: double.infinity,
        height: 60,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isSvg
                  ? SvgPicture.asset("assets/svgs/shopping bag.svg")
                  : SizedBox(width: 0),
              Gap(10),
              Customtext(
                text: titel.toUpperCase(),
                color: Colors.white,
                fontSize: 16,
                weight: FontWeight.bold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
