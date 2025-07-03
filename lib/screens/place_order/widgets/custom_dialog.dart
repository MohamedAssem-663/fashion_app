import 'package:fashion/componants/custom_button.dart';
import 'package:fashion/componants/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CustomDailog extends StatelessWidget {
  const CustomDailog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: 480,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            GestureDetector(
              child: Align(
                alignment: Alignment.centerRight,
                child: Icon(CupertinoIcons.clear),
              ),
              onTap: () => Navigator.pop(context),
            ),
            Gap(20),
            Customtext(
              text: "Payment success".toUpperCase(),
              color: Colors.black,
            ),
            Gap(30),
            SvgPicture.asset("assets/pop/done.svg", width: 60),
            Gap(20),
            Customtext(
              text: "Payment success".toUpperCase(),
              color: Colors.black,
            ),
            Gap(20),
            Customtext(
              text: "Payment ID 15263541".toUpperCase(),
              color: Colors.black,
            ),
            Gap(20),
            Image.asset(
              "assets/svgs/line.png",
              color: Colors.black,
              width: 120,
            ),
            Gap(20),
            Customtext(
              text: "Rate your purchase".toUpperCase(),
              color: Colors.black,
            ),
            Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/pop/emogi1.svg"),
                Gap(20),
                SvgPicture.asset("assets/pop/emogi2.svg"),
                Gap(20),
                SvgPicture.asset("assets/pop/emogi3.svg"),
              ],
            ),
            Spacer(),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    isSvgg: false,
                    titel: "Submit",
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                  ),
                ),
                Gap(20),
                Expanded(
                  child: CustomButton(
                    isSvgg: false,
                    titel: "Cancel",
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
