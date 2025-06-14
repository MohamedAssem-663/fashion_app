import 'package:fashion/componants/custom_appbar.dart';
import 'package:fashion/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: AppColors.primary,appBar: CustomAppbar(
      isBlackk: true,
    ),
    body:Stack(
      children: [
        Positioned(
          top: 10,
          left: 0,
          right: 0,
          child: SvgPicture.asset("assets/texts/10.svg")),
             Positioned(
            top: 40,
          left: 0,
          right: 0,
          child: SvgPicture.asset("assets/texts/October.svg")),
        Positioned(
            top:85 ,
          left: 0,
          right: 0,
          child: SvgPicture.asset("assets/texts/Collection.svg")),
     
      ],
      ),
      );
      
  }
}
