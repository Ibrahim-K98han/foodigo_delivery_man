import 'package:flutter/material.dart';
import 'package:foodigo/utils/constraints.dart';
import 'package:foodigo/utils/utils.dart';
import 'package:foodigo/widget/custom_image.dart';
import 'package:foodigo/widget/custom_text_style.dart';

class StatisticsWidget extends StatelessWidget {
  const StatisticsWidget({
    super.key,
    required this.title,
    required this.amount,
    required this.icon,
    required this.iconBg,
  });

  final String title;
  final String amount;
  final String icon;
  final Color iconBg;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.41,
      height: size.height * 0.09,
      padding: Utils.all(value: 8),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(6),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withOpacity(0.1),
        //     blurRadius: 4,
        //     spreadRadius: 1,
        //     offset: const Offset(2, 2),
        //   ),
        // ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: Utils.all(value: 6),
            decoration: BoxDecoration(
              color: iconBg.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: CustomImage(path: icon),
          ),
          Utils.horizontalSpace(8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(text: title, fontSize: 12, color: lightGrayColor),
              Utils.verticalSpace(10),
              CustomText(text: amount, fontWeight: FontWeight.w600),
            ],
          ),
        ],
      ),
    );
  }
}
