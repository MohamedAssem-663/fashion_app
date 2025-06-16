import 'package:fashion/componants/custom_appbar.dart';
import 'package:fashion/componants/custom_text.dart';
import 'package:fashion/componants/header.dart';
import 'package:fashion/core/app_colors.dart';
import 'package:fashion/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(isBlackk: false),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Header(),
            Gap(20),
            Container(
              padding: EdgeInsets.zero,
              child: Row(
                children: [
                  Image.asset(product.image, width: 100, height: 200),
                  Gap(10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Customtext(
                          text: product.name,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        Gap(15),
                        Customtext(
                          text: product.description,
                          color: Colors.grey,
                          max: 2,
                        ),

                        Gap(20),
                        Customtext(
                          text: "\$ ${product.price.toString()}",
                          color: Colors.red.shade200,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Gap(20),
          ],
        ),
      ),
    );
  }
}
