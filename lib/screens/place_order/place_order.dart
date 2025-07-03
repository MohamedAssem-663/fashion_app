import 'package:fashion/componants/custom_appbar.dart';
import 'package:fashion/componants/custom_button.dart';
import 'package:fashion/componants/custom_divider.dart';
import 'package:fashion/componants/custom_text.dart';
import 'package:fashion/componants/header.dart';
import 'package:fashion/core/Utils/function/app_router.dart';
import 'package:fashion/core/app_colors.dart';
import 'package:fashion/models/product_model.dart';
import 'package:fashion/screens/checkout/widgets/card_widget.dart';
import 'package:fashion/screens/place_order/widgets/custom_dialog.dart';
import 'package:fashion/screens/place_order/widgets/shipping_method.dart';
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
  dynamic _savedCard;
  int qwantity = 1;

  //address
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

  //card
  void _openCard() async {
    final cardData = await GoRouter.of(context).push(AppRouter.kAddCredit);
    if (cardData != null) {
      setState(() {
        _savedCard = cardData;
      });
    }
  }

  void _editCard() async {
    final editCard = await GoRouter.of(context).push(AppRouter.kAddCredit);
    setState(() {
      _savedCard = editCard;
    });
  }

  @override
  Widget build(BuildContext context) {
    double unitPrice = widget.product.price;
    double totall = unitPrice * qwantity;
    return Scaffold(
      appBar: CustomAppbar(isBlackk: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Header(title: "CheckOut"),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _savedCard != null && _savedAddress != null
                      ? SizedBox.shrink()
                      : Customtext(
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
              _savedAddress == null
                  ? customContainer(
                      "Add New Address",
                      Icons.add,
                      false,
                      () {
                        _openAddress(context);
                      },
                      () {
                        _openAddress(context);
                      },
                    )
                  : SizedBox.shrink(),
              Gap(30),

              _savedCard != null && _savedAddress != null
                  ? SizedBox.shrink()
                  : ShippingMethod(),
              _savedCard != null && _savedAddress != null
                  ? SizedBox.shrink()
                  : Customtext(
                      text: "Payment method".toUpperCase(),
                      color: Colors.grey,
                      fontSize: 20,
                    ),
              Gap(15),

              _savedCard != null
                  ? Column(
                      children: [
                        CustomDivider(),
                        Gap(10),
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/svgs/Mastercard.svg",
                              width: 40,
                            ),
                            Gap(10),
                            Customtext(
                              text: "Master Card Ending",
                              color: Colors.black,
                            ),
                            Gap(10),
                            Customtext(
                              text:
                                  "••••${_savedCard["number"].toString().substring(_savedCard["number"].length - 2)}",
                              color: Colors.black,
                            ),

                            Spacer(),
                            IconButton(
                              onPressed: _editCard,
                              icon: SvgPicture.asset("assets/svgs/arrow.svg"),
                            ),
                          ],
                        ),
                        Gap(10),
                        CustomDivider(),
                      ],
                    )
                  : customContainer(
                      "select payment method",
                      Icons.keyboard_arrow_down_sharp,
                      false,
                      () {
                        _openCard();
                      },
                      () {
                        _openCard();
                      },
                    ),
              Gap(15),
              CardWidget(
                product: widget.product,
                qwantity: qwantity,
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

              SizedBox(height: 110),
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
                    text: "\$${totall.toStringAsFixed(2)}",
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
                onTap: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      return Dialog(child: CustomDailog());
                    },
                  );
                },
              ),
              Gap(30),
            ],
          ),
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
