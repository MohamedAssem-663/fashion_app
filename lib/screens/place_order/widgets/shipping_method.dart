import 'package:fashion/componants/custom_text.dart';
import 'package:fashion/screens/place_order/place_order.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ShippingMethod extends StatelessWidget {
  const ShippingMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Customtext(
          text: "Shipping MethoD".toUpperCase(),
          color: Colors.grey,
          fontSize: 20,
        ),
        Gap(15),
        customContainer(
          "Pickup at store",
          Icons.keyboard_arrow_down_sharp,
          true,
          () {},
          () {},
        ),
        Gap(30),
      ],
    );
  }
}
