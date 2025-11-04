import 'package:flutter/material.dart';
import 'package:foodigo/data/remote_url.dart';
import 'package:foodigo/features/Order/model/orders_model.dart';
import 'package:foodigo/utils/constraints.dart';
import 'package:foodigo/utils/k_images.dart';
import 'package:foodigo/utils/utils.dart';
import 'package:foodigo/widget/custom_image.dart';
import 'package:foodigo/widget/custom_text_style.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key, required this.ordersModel});
  final Items ordersModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      titleAlignment: ListTileTitleAlignment.center,
      horizontalTitleGap: 8.0,
      contentPadding: EdgeInsets.zero,
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: CustomImage(
          path: RemoteUrls.imageUrl(
            ordersModel.product?.image ?? KImages.placeholderImage,
          ),
          width: 68,
          height: 48,
          fit: BoxFit.cover,
        ),
      ),
      title: Padding(
        padding: Utils.only(bottom: 12),
        child: CustomText(
          text: ordersModel.product?.name ?? 'Not Item',
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: CustomText(
        text: Utils.formatPrice(context, ordersModel.product?.price ?? '0.0'),
        fontWeight: FontWeight.w500,
        color: primaryColor,
      ),
      trailing: CustomText(
        text: 'Q: ${ordersModel.qty}',
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
