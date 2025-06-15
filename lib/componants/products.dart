import 'package:fashion/componants/custom_text.dart';
import 'package:fashion/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
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
            Customtext(text: product.description, color: Colors.grey, max: 2),
            Gap(5),
            Customtext(
              text: "\$ ${product.price.toString()}",
              color: Colors.red.shade200,
            ),
          ],
        );
      },
    );
  }
}
