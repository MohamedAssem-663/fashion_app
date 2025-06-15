import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ionicons/ionicons.dart';

class ScialMedia extends StatelessWidget {
  const ScialMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Ionicons.logo_twitter, color: Colors.white),
        Gap(30),
        Icon(Ionicons.logo_instagram, color: Colors.white),
        Gap(30),
        Icon(Ionicons.logo_facebook, color: Colors.white),
      ],
    );
  }
}
