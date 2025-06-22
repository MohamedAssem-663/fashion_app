import 'package:fashion/componants/custom_text.dart';
import 'package:fashion/core/app_colors.dart';
import 'package:fashion/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class ProductInformation extends StatelessWidget {
  const ProductInformation({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Customtext(text: "SHIPPING ADRESS", color: Colors.grey, fontSize: 20),
        Gap(15),
        Customtext(
          text: product.name.toUpperCase(),
          fontSize: 24,
          color: AppColors.primary,
        ),
        Gap(10),
        Padding(
          padding: const EdgeInsets.only(right: 5, left: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Customtext(
                    text: product.description,
                    fontSize: 20,
                    color: Colors.black54,
                  ),
                  Gap(15),
                  Customtext(
                    text: product.description,
                    fontSize: 20,
                    color: Colors.black54,
                  ),
                ],
              ),
              SvgPicture.asset(
                "assets/svgs/arrow.svg",
                width: 35,
                color: Colors.black54,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
