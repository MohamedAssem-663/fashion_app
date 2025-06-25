import 'package:fashion/componants/custom_appbar.dart';
import 'package:fashion/componants/custom_button.dart';
import 'package:fashion/componants/custom_text.dart';
import 'package:fashion/componants/header.dart';
import 'package:fashion/core/Utils/function/app_router.dart';
import 'package:fashion/core/app_colors.dart';
import 'package:fashion/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class PlaceOrder extends StatefulWidget {
  const PlaceOrder({super.key, required this.product, required this.total});
  final ProductModel product;
  final double total;

  @override
  State<PlaceOrder> createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  dynamic _savedAddress;

  void _openAddress(context) async {
    final addressData = await GoRouter.of(
      context,
    ).push(AppRouter.kAddAdress, extra: widget.product);
    if (addressData != null) {
      setState(() {
        _savedAddress = addressData;
      });
    }
  }

  void _editAddress() async {
    final newAddress = await GoRouter.of(
      context,
    ).push(AppRouter.kAddAdress, extra: widget.product);
    setState(() {
      _savedAddress = newAddress;
    });
  }

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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Customtext(
                  text: "SHIPPING ADRESS",
                  color: Colors.grey,
                  fontSize: 20,
                ),
                Gap(15),

                Padding(
                  padding: const EdgeInsets.only(right: 5, left: 5),
                  child: _savedAddress != null
                      ? GestureDetector(
                          onTap: _editAddress,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Customtext(
                                    text:
                                        "${_savedAddress['firstName'] + _savedAddress['lastName']}",

                                    fontSize: 24,
                                    color: AppColors.primary,
                                  ),
                                  Gap(10),
                                  Customtext(
                                    text: _savedAddress["address"]
                                        .toUpperCase(),
                                    fontSize: 20,
                                    color: Colors.black54,
                                  ),
                                  Gap(15),
                                  Customtext(
                                    text: _savedAddress["city"].toUpperCase(),
                                    fontSize: 20,
                                    color: Colors.black54,
                                  ),
                                  Gap(15),
                                  Customtext(
                                    text: "(${_savedAddress["phone"]})"
                                        .toUpperCase(),
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
                        )
                      : SizedBox.shrink(),
                ),
              ],
            ),
            Gap(20),
            customContainer(
              "Add New Address",
              Icons.add,
              false,
              () {
                _openAddress(context);
              },
              () {
                _openAddress(context);
              },
            ),
            Gap(30),
            _savedAddress == null
                ? Customtext(
                    text: "Shipping MethoD".toUpperCase(),
                    color: Colors.grey,
                    fontSize: 20,
                  )
                : SizedBox.shrink(),
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
                  text: "\$${widget.total.toStringAsFixed(2)}",
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
