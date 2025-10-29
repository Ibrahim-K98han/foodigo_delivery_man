import 'package:flutter/material.dart';
import 'package:foodigo/features/restaurant_features/Dashboard/model/dashboard_model.dart';
import 'package:foodigo/presentation/core/routes/route_names.dart';
import 'package:foodigo/utils/constraints.dart';
import 'package:foodigo/utils/k_images.dart';
import 'package:foodigo/utils/utils.dart';
import 'package:foodigo/widget/custom_image.dart';
import 'package:foodigo/widget/custom_text_style.dart';
import 'package:intl/intl.dart';

class ActiverOrderWidget extends StatelessWidget {
  const ActiverOrderWidget({super.key, required this.activeOrder});
  final List<ActiveOrder> activeOrder;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 124,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: activeOrder.length,
        itemBuilder: (context, index) {
          final order = activeOrder[index];
          return Padding(
            padding: Utils.symmetric(h: 6.0, v: 0.0),
            child: ActiveOrderCard(order: order),
          );
        },
      ),
    );
  }
}

class ActiveOrderCard extends StatelessWidget {
  const ActiveOrderCard({super.key, required this.order});

  final ActiveOrder order;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Utils.symmetric(h: 12.0, v: 12.0),
      width: 257,
      height: 124,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const CustomText(text: 'Order Id: ', color: sTxtColor),
                  CustomText(text: '#${order.id}', fontWeight: FontWeight.w500),
                ],
              ),
              Container(
                padding: Utils.symmetric(h: 4.0, v: 2.0),
                decoration: BoxDecoration(
                  color: redColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: CustomText(
                  text: 'Cash Delivery',
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: redColor,
                ),
              ),
            ],
          ),
          Utils.verticalSpace(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: Utils.formatPrice(context, order.grandTotal),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              Row(
                children: [
                  const CustomImage(
                    path: KImages.stopwatchCheck,
                    width: 14,
                    height: 14,
                    fit: BoxFit.cover,
                  ),
                  Utils.horizontalSpace(2),
                  CustomText(
                    text: DateFormat('hh:mm a, dd MMM').format(order.createdAt),
                    color: sTxtColor,
                  ),
                ],
              ),
            ],
          ),
          Utils.verticalSpace(12),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RouteNames.orderConfirmScreen);
                  },
                  child: Container(
                    height: 32,
                    decoration: BoxDecoration(
                      border: Border.all(color: lightGrayColor),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: CustomText(
                        text: 'Details',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
              Utils.horizontalSpace(12),
              Expanded(
                child: Container(
                  height: 32,
                  decoration: BoxDecoration(
                    color: textColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: CustomText(
                      text: 'Distance',
                      textAlign: TextAlign.center,
                      color: whiteColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
