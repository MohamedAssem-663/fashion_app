import 'package:fashion/componants/custom_text.dart';
import 'package:fashion/componants/qwantity.dart';
import 'package:fashion/core/app_colors.dart';
import 'package:fashion/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({super.key, required this.product});
  final ProductModel product;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  int qwantity = 1;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(widget.product.image, width: 120),
        Gap(10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(5),
              Customtext(
                text: widget.product.name.toUpperCase(),
                fontSize: 20,
                color: AppColors.primary,
                spacing: 3,
              ),
              Gap(15),
              SizedBox(
                width: size.width * 0.6,
                child: Customtext(
                  text: widget.product.description,
                  color: Colors.grey,
                  max: 2,
                ),
              ),
              Gap(15),
              Row(
                children: [
                  Qwantity(
                    onTap: () {
                      setState(() {
                        if (qwantity > 1) {
                          qwantity--;
                        }
                      });
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
                      setState(() {
                        qwantity++;
                      });
                    },
                    svg: "assets/svgs/plus.svg",
                  ),
                ],
              ),
              Gap(30),
              Customtext(
                text: "\$ ${widget.product.price.toString()}",
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
