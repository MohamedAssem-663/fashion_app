import 'package:fashion/componants/bromo.dart';
import 'package:fashion/componants/card_widget.dart';
import 'package:fashion/componants/custom_appbar.dart';
import 'package:fashion/componants/custom_button.dart';
import 'package:fashion/componants/custom_divider.dart';
import 'package:fashion/componants/custom_text.dart';
import 'package:fashion/componants/header.dart';
import 'package:fashion/core/app_colors.dart';
import 'package:fashion/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key, required this.product});
  final ProductModel product;

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  int qwantity = 1;

  @override
  Widget build(BuildContext context) {
    double unitPrice = widget.product.price;
    double total = unitPrice * qwantity;
    return Scaffold(
      appBar: CustomAppbar(isBlackk: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Header(title: "CheckOut"),
            CardWidget(
              product: widget.product,
              quantity: qwantity,
              onIncrement: () {
                setState(() {
                  qwantity++;
                });
              },
              onDecrement: () {
                setState(() {
                  if (qwantity > 1) qwantity--;
                });
              },
            ),

            Gap(20),
            CustomDivider(),

            Gap(15),
            Bromo(),
            Gap(20),
            CustomDivider(),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Customtext(
                  text: "Est. Total",
                  fontSize: 20,
                  weight: FontWeight.bold,
                  color: AppColors.primary,
                ),
                Customtext(
                  text: "\$${total.toStringAsFixed(2)}",
                  fontSize: 20,
                  weight: FontWeight.bold,
                  color: Colors.red.shade200,
                ),
              ],
            ),
            Gap(20),
            CustomButton(isSvgg: true, titel: "Checkout", onTap: () {}),
            Gap(30),
          ],
        ),
      ),
    );
  }
}
