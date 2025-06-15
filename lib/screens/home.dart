import 'package:fashion/componants/custom_appbar.dart';
import 'package:fashion/componants/custom_text.dart';
import 'package:fashion/core/app_colors.dart';
import 'package:fashion/models/cover_model.dart';
import 'package:fashion/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:ionicons/ionicons.dart';

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
                  Image.asset("assets/svgs/line.png", width: 190),
                  Gap(30),
                  SizedBox(
                    height: 400,
                    child: ListView.builder(
                      itemCount: CoverModel.covers.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final item = CoverModel.covers[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Image.asset(
                                  item.image,
                                  height: 350,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Gap(10),
                              Customtext(
                                text: item.title.toUpperCase(),
                                fontSize: 20,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Gap(20),
                  Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Ionicons.logo_twitter, color: Colors.white),
                            Gap(30),
                            Icon(Ionicons.logo_instagram, color: Colors.white),
                            Gap(30),
                            Icon(Ionicons.logo_facebook, color: Colors.white),
                          ],
                        ),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Customtext(text: "About", fontSize: 30),
                            Gap(30),
                            Customtext(text: "Countact", fontSize: 30),
                            Gap(30),
                            Customtext(text: "Blog", fontSize: 30),
                          ],
                        ),
                        Gap(34),
                        Customtext(
                          text: "Copyright © OpenUi All Rights Reserved",
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  Gap(300),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
