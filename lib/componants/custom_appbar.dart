import 'package:fashion/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(60.0);
  final bool isBlackk;

  // Constructor
  const CustomAppbar({super.key, required this.isBlackk});

  @override
  Widget build(BuildContext context) {
    bool isBlack = isBlackk;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AppBar(
        backgroundColor: isBlack ? AppColors.primary : Colors.white,
        elevation: 0,

        leading: SvgPicture.asset(
          "assets/svgs/Menu.svg",

          color: isBlack ? Colors.white : AppColors.primary,
        ),
        leadingWidth: 25,
        centerTitle: true,
        title: SvgPicture.asset(
          "assets/logo/logo-bg.svg",

          color: isBlack ? Colors.white : AppColors.primary,
        ),
        actions: [
          SvgPicture.asset("assets/svgs/Search.svg", height: 30, width: 30),
          Gap(18),
          SvgPicture.asset(
            "assets/svgs/shopping bag.svg",
            height: 30,
            width: 30,
            color: isBlack ? Colors.white : AppColors.primary,
          ),
          Gap(18),
        ],
      ),
    );
  }
}
