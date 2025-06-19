import 'package:fashion/componants/card_widget.dart';
import 'package:fashion/componants/custom_appbar.dart';
import 'package:fashion/componants/header.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(isBlackk: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Header(title: "CheckOut"),
            CardWidget(product: widget.product),

            Gap(20),
          ],
        ),
      ),
    );
  }
}
