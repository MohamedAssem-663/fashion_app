import 'package:fashion/componants/custom_appbar.dart';
import 'package:fashion/componants/custom_text.dart';
import 'package:fashion/core/app_colors.dart';
import 'package:fashion/models/product_model.dart';
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
                  Image.asset("assets/cover/cover1.png"),
                  Gap(20),
                  GridView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: ProductModel.products.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 0,
                      childAspectRatio: 0.50,
                    ),
                    itemBuilder: (context, index) {
                      final product = ProductModel.products[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(product.image),
                          Gap(10),
                          Customtext(text: product.name),
                          Gap(5),
                          Customtext(
                            text: product.description,
                            color: Colors.grey,
                            max: 2,
                          ),
                          Gap(5),
                          Customtext(
                            text: "\$ ${product.price.toString()}",
                            color: Colors.red.shade200,
                          ),
                        ],
                      );
                    },
                  ),
                  Gap(20),
                  Customtext(
                    text: "YOU MAY ALSO LIKE".toUpperCase(),
                    fontSize: 25,
                  ),
                  Gap(5),
                  Image.asset("assets/svgs/line.png", width: 180),

                  Gap(50),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
