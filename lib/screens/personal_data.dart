import 'package:fashion/componants/custom_appbar.dart';
import 'package:flutter/material.dart';

class PresonalData extends StatelessWidget {
  const PresonalData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: CustomAppbar(isBlackk: false));
  }
}
