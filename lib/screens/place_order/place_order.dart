import 'package:fashion/componants/custom_appbar.dart';
import 'package:fashion/componants/custom_button.dart';
import 'package:fashion/componants/custom_text.dart';
import 'package:fashion/componants/header.dart';
import 'package:fashion/core/Utils/function/app_router.dart';
import 'package:fashion/core/app_colors.dart';
import 'package:fashion/models/product_model.dart';
import 'package:fashion/screens/place_order/widgets/product_information.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class PlaceOrder extends StatelessWidget {
  const PlaceOrder({super.key, required this.product, required this.total});
  final ProductModel product;
  final double total;

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
            ProductInformation(product: product),
            Gap(20),
            customContainer(
              "Add New Address",
              Icons.add,
              false,
              () {
                GoRouter.of(context).push(AppRouter.kAddAdress);
              },
              () {
                GoRouter.of(context).push(AppRouter.kAddAdress);
              },
            ),
            Gap(30),
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
            Customtext(
              text: "Payment method".toUpperCase(),
              color: Colors.grey,
              fontSize: 20,
            ),
            Gap(15),
            customContainer(
              "select payment method",
              Icons.keyboard_arrow_down_sharp,
              false,
              () {},
              () {},
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Customtext(
                  text: "Total",
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
            CustomButton(
              isSvgg: true,
              titel: "Place order".toUpperCase(),
              onTap: () {},
            ),
            Gap(30),
          ],
        ),
      ),
    );
  }
}

Widget customContainer(text, icon, isFree, onPressed, onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Customtext(text: text, color: AppColors.primary),
          Spacer(),
          isFree
              ? Customtext(text: "FREE", color: AppColors.primary)
              : SizedBox.shrink(),
          Gap(10),
          IconButton(
            onPressed: onPressed,
            icon: Icon(icon, color: AppColors.primary),
          ),
        ],
      ),
    ),
  );
}
