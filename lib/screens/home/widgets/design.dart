import 'package:fashion/componants/custom_text.dart';
import 'package:fashion/models/cover_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Designs extends StatelessWidget {
  const Designs({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: CoverModel.covers.length,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final item = CoverModel.covers[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Image.asset(item.image, height: 350, fit: BoxFit.cover),
              ),
              Gap(10),
              Customtext(text: item.title.toUpperCase(), fontSize: 20),
            ],
          ),
        );
      },
    );
  }
}
