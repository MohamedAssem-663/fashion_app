import 'package:fashion/componants/custom_text.dart';
import 'package:flutter/material.dart';

class CopyRight extends StatelessWidget {
  const CopyRight({super.key});

  @override
  Widget build(BuildContext context) {
    return Customtext(
      text: "Copyright © OpenUi All Rights Reserved",
      fontSize: 18,
      color: Colors.grey,
      max: 2,
      height: 2.5,
    );
  }
}
