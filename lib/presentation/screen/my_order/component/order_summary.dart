import 'package:flutter/material.dart';
import 'package:foodigo/features/Order/model/orders_model.dart';
import 'package:foodigo/presentation/screen/my_order/component/order_summary_text_widget.dart';
import 'package:foodigo/utils/constraints.dart';
import 'package:foodigo/utils/utils.dart';
import 'package:foodigo/widget/custom_text_style.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key, required this.ordersModel});

  final OrdersModel ordersModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Utils.symmetric(h: 12.0, v: 0.0),
      width: double.infinity,
      height: 151,
      decoration: BoxDecoration(
        border: Border.all(color: dBorderColor),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomText(
            text: 'Order Summery',
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          Utils.verticalSpace(8),
          OrderSummaryTextWidget(
            title: 'Sbtotal',
            titleColor: sTxtColor,
            subTitle: Utils.formatPrice(context, ordersModel.total),
            subTitleColor: textColor,
            fontWeight: FontWeight.w500,
          ),
          Utils.verticalSpace(6),
          OrderSummaryTextWidget(
            title: 'Delivery Fee',
            titleColor: sTxtColor,
            subTitle: Utils.formatPrice(context, ordersModel.deliveryCharge),
            subTitleColor: textColor,
            fontWeight: FontWeight.w500,
          ),
          Utils.verticalSpace(6),
          // OrderSummaryTextWidget(
          //   title: 'Platform ',
          //   titleColor: sTxtColor,
          //   subTitle: '\$0.99',
          //   subTitleColor: textColor,
          //   fontWeight: FontWeight.w500,
          // ),
          // Utils.verticalSpace(6),
          Divider(color: sTxtColor.withOpacity(0.2)),
          Utils.verticalSpace(6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  CustomText(
                    text: 'Total ',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  CustomText(text: '(incl.VAT)', color: sTxtColor),
                ],
              ),
              CustomText(
                text: Utils.formatPrice(context, ordersModel.grandTotal),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
