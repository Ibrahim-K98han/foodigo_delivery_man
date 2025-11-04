
import 'package:flutter/material.dart';
import 'package:foodigo/widget/custom_text_style.dart';

class OrderSummaryTextWidget extends StatelessWidget {
  const OrderSummaryTextWidget({
    super.key,
    required this.title,
    this.titleColor,
    required this.subTitle,
    this.subTitleColor,
    this.fontWeight,
  });

  final String title;
  final Color? titleColor;
  final String subTitle;
  final Color? subTitleColor;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(text: title, color: titleColor!),
        CustomText(
          text: subTitle,
          color: subTitleColor!,
          fontWeight: fontWeight!,
        ),
      ],
    );
  }
}
