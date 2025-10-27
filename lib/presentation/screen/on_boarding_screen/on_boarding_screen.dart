import 'package:flutter/material.dart';
import 'package:foodigo_delivery_man/presentation/core/routes/route_names.dart';
import 'package:foodigo_delivery_man/utils/constraints.dart';
import 'package:foodigo_delivery_man/utils/k_images.dart';
import 'package:foodigo_delivery_man/utils/utils.dart';
import 'package:foodigo_delivery_man/widget/custom_image.dart';
import 'package:foodigo_delivery_man/widget/custom_text_style.dart';
import 'package:foodigo_delivery_man/widget/primary_button.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          CustomImage(
            path: KImages.deliveryOnBoarding,
            height: size.height / 1.8,
            width: double.maxFinite,
            fit: BoxFit.fill,
          ),
          Utils.verticalSpace(40.0),
          Padding(
            padding: Utils.symmetric(h: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(
                  text: 'Welcome to',
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  height: 1.32,
                ),
                const Row(
                  children: [
                    Row(
                      children: [
                        CustomText(
                          text: 'Mat',
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                        CustomText(
                          text: '3',
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                          color: redColor,
                        ),
                        CustomText(
                          text: 'ami',
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ],
                    ),
                    CustomText(
                      text: ' Rider App',
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ],
                ),
                Utils.verticalSpace(24),
                PrimaryButton(
                  text: 'Sign In',
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      RouteNames.authenticationScreen,
                    );
                  },
                ),
                Utils.verticalSpace(12),
                PrimaryButton(
                  bgColor: const Color(0xffEFEFEF),
                  text: 'Apply now',
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      RouteNames.deliverymanRegisterScreen,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
