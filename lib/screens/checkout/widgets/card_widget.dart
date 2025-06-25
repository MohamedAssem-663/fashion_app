import 'package:fashion/componants/custom_text.dart';
import 'package:fashion/screens/checkout/widgets/qwantity.dart';
import 'package:fashion/core/app_colors.dart';
import 'package:fashion/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.product,
    required this.qwantity,
    required this.onIncrement,
    required this.onDecrement,
  });
  final ProductModel product;
  final int qwantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(product.image, width: 120),
        Gap(10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(5),
              Customtext(
                text: product.name.toUpperCase(),
                fontSize: 20,
                color: AppColors.primary,
                spacing: 3,
              ),
              Gap(15),
              SizedBox(
                width: size.width * 0.6,
                child: Customtext(
                  text: product.description,
                  color: Colors.grey,
                  max: 2,
                ),
              ),
              Gap(15),
              Row(
                children: [
                  Qwantity(
                    onTap: () {
                      onDecrement();
                    },
                    svg: "assets/svgs/min.svg",
                  ),
                  Gap(10),
                  Customtext(
                    text: qwantity.toString(),
                    color: AppColors.primary,
                    weight: FontWeight.bold,
                  ),
                  Gap(10),

                  Qwantity(
                    onTap: () {
                      onIncrement();
                    },
                    svg: "assets/svgs/plus.svg",
                  ),
                ],
              ),
              Gap(30),
              Customtext(
                text: "\$ ${product.price.toString()}",
                color: Colors.red.shade200,
                fontSize: 20,
                weight: FontWeight.bold,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
