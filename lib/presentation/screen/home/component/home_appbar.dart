import 'package:flutter/material.dart';
import 'package:foodigo/utils/constraints.dart';
import 'package:foodigo/utils/k_images.dart';
import 'package:foodigo/widget/custom_image.dart';
import 'package:foodigo/widget/custom_text_style.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomImage(path: KImages.homeAppbarBg),
        Positioned(
          top: 50,
          left: 0,
          right: 0,
          child: ListTile(
            leading: CustomImage(path: KImages.profile, width: 48, height: 48),
            title: CustomText(text: 'Select Location', color: whiteColor),
            subtitle: CustomText(text: '4517 Washington', color: whiteColor),
            trailing: CustomImage(
              path: KImages.notificationIcon,
              color: whiteColor,
              width: 24,
              height: 24,
            ),
          ),
        ),
      ],
    );
  }
}
