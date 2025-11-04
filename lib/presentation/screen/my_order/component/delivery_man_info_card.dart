import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foodigo/data/remote_url.dart';
import 'package:foodigo/features/Order/model/orders_model.dart';
import 'package:foodigo/utils/constraints.dart';
import 'package:foodigo/utils/utils.dart';
import 'package:foodigo/widget/custom_image.dart';
import 'package:foodigo/widget/custom_text_style.dart';

class DeliveryManInfoCard extends StatelessWidget {
  const DeliveryManInfoCard({super.key, required this.ordersModel});
  final OrdersModel ordersModel;

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> decoded = jsonDecode(
      ordersModel.deliveryAddress,
    );
    print(decoded['address']);
    return Container(
      padding: Utils.symmetric(h: 12.0, v: 0.0),
      width: double.infinity,
      height: 170,
      decoration: BoxDecoration(
        border: Border.all(color: dBorderColor),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: CustomImage(
                      path: RemoteUrls.imageUrl(
                        ordersModel.deliveryman!.manImage,
                      ),
                      width: 48,
                      height: 48,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Utils.horizontalSpace(8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text:
                            '${ordersModel.deliveryman!.fname} ${ordersModel.deliveryman!.lname}',
                        fontWeight: FontWeight.w500,
                      ),
                      Utils.verticalSpace(5),
                      CustomText(
                        text: ordersModel.deliveryman!.email,
                        fontSize: 12,
                        color: sTxtColor,
                      ),
                    ],
                  ),
                ],
              ),
              // Row(
              //   children: [
              //     Container(
              //       padding: Utils.all(value: 6),
              //       decoration: BoxDecoration(
              //         color: primaryColor.withOpacity(0.2),
              //         borderRadius: BorderRadius.circular(50),
              //       ),
              //       child: const CustomImage(
              //         path: KImages.bubbleChat,
              //         width: 24,
              //         height: 24,
              //         fit: BoxFit.cover,
              //       ),
              //     ),
              //     Utils.horizontalSpace(8),
              //     Container(
              //       padding: Utils.all(value: 6),
              //       decoration: BoxDecoration(
              //         color: primaryColor.withOpacity(0.2),
              //         borderRadius: BorderRadius.circular(50),
              //       ),
              //       child: const CustomImage(
              //         path: KImages.call,
              //         width: 24,
              //         height: 24,
              //         fit: BoxFit.cover,
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
          Utils.verticalSpace(12),
          const CustomText(text: 'Payment Info', fontWeight: FontWeight.w500),
          Utils.verticalSpace(8),
          Row(
            children: [
              const CustomText(text: 'Method: ', fontSize: 12),
              CustomText(
                text: ordersModel.paymentMethod,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          Utils.verticalSpace(8),
          Row(
            children: [
              const CustomText(text: 'Status: ', fontSize: 12),
              CustomText(
                text: ordersModel.paymentStatus,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: primaryColor,
              ),
            ],
          ),
          Utils.verticalSpace(8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(text: 'Address: ', fontSize: 12),
              Expanded(
                child: CustomText(
                  text: decoded['address'],
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
