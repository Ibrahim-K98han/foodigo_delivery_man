import 'package:flutter/material.dart';
import 'package:foodigo/features/Order/model/orders_model.dart';
import 'package:foodigo/utils/constraints.dart';
import 'package:foodigo/utils/k_images.dart';
import 'package:foodigo/utils/utils.dart';
import 'package:foodigo/widget/custom_image.dart';
import 'package:foodigo/widget/custom_text_style.dart';
import 'package:foodigo/widget/primary_button.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key, required this.ordersModel});

  final OrdersModel ordersModel;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: Utils.all(value: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Utils.verticalSpace(20),
            const CustomImage(
              path: KImages.success,
              width: 64,
              height: 64,
              fit: BoxFit.cover,
            ),
            Utils.verticalSpace(20),
            CustomText(
              text: 'Order id #${ordersModel.id}\nSuccessfully Delivered',
              fontSize: 18,
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.center,
              height: 1.32,
            ),
            Utils.verticalSpace(12),
            const CustomText(
              text: 'Great job! The order has been delivered to the customer',
              color: sTxtColor,
              textAlign: TextAlign.center,
            ),
            Utils.verticalSpace(12),
            const CustomText(
              text: '---------------------------------',
              color: sTxtColor,
            ),
            Utils.verticalSpace(12),
            const CustomText(text: 'Total Amount', color: sTxtColor),
            Utils.verticalSpace(12),
            CustomText(
              text: Utils.formatPrice(context, ordersModel.grandTotal),
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: primaryColor,
            ),
            Utils.verticalSpace(24),

            PrimaryButton(
              minimumSize: const Size(220, 44),
              bgColor: textColor,
              textColor: whiteColor,
              text: 'That\'s nice',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Utils.verticalSpace(24),
          ],
        ),
      ),
    );
  }
}
