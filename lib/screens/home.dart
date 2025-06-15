import 'package:fashion/componants/about.dart';
import 'package:fashion/componants/copy_right.dart';
import 'package:fashion/componants/custom_appbar.dart';
import 'package:fashion/componants/custom_text.dart';
import 'package:fashion/componants/design.dart';
import 'package:fashion/componants/products.dart';
import 'package:fashion/componants/social_media.dart';
import 'package:fashion/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: CustomAppbar(isBlackk: true),
      body: Stack(
        children: [
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: SvgPicture.asset("assets/texts/10.svg"),
          ),
          Positioned(
            top: 40,
            left: 0,
            right: 0,
            child: SvgPicture.asset("assets/texts/October.svg"),
          ),
          Positioned(
            top: 90,
            left: 0,
            right: 0,
            child: SvgPicture.asset("assets/texts/Collection.svg"),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Gap(120),
                  Stack(
                    children: [
                      Image.asset("assets/cover/cover1.png"),

                      Positioned(
                        top: 370,
                        left: 230,
                        right: 0,
                        child: SvgPicture.asset("assets/texts/10.svg"),
                      ),
                    ],
                  ),
                  Gap(20),
                  Products(),
                  Gap(20),
                  Customtext(
                    text: "YOU MAY ALSO LIKE".toUpperCase(),
                    fontSize: 25,
                  ),
                  Gap(5),
                  Image.asset("assets/svgs/line.png", width: 190),
                  Gap(30),
                  SizedBox(height: 400, child: Designs()),
                  Gap(20),
                  Container(
                    child: Column(
                      children: [
                        ScialMedia(),
                        Gap(25),
                        Image.asset("assets/svgs/line.png", width: 190),
                        Gap(10),
                        Customtext(
                          max: 3,
                          height: 2,
                          fontSize: 20,
                          text:
                              "Support@Opinui.design \n       +60 825 876 \n 08:00 - 22:00 -Everyday",
                        ),
                        Gap(10),
                        Image.asset("assets/svgs/line.png", width: 190),
                        Gap(20),
                        About(),
                        Gap(34),
                        CopyRight(),
                      ],
                    ),
                  ),
                  Gap(30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
