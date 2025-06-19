import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Qwantity extends StatelessWidget {
  const Qwantity({super.key, required this.svg, this.onTap});
  final String svg;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey.shade300, width: 1),
        ),
        child: SvgPicture.asset(svg),
      ),
    );
  }
}
