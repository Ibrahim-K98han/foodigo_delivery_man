import 'package:flutter/material.dart';
import 'package:foodigo/features/Dashboard/model/dashboard_model.dart';
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
    return Padding(
      padding: Utils.only(left: 20),
      child: SizedBox(
        height: 124,
        child:
            activeOrder.isNotEmpty
                ? ListView.builder(
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
                )
                : const Center(child: CustomText(text: 'Data Not Found')),
      ),
    );
  }
}

class ActiveOrderCard extends StatefulWidget {
  const ActiveOrderCard({super.key, required this.order});

  final ActiveOrder order;

  @override
  State<ActiveOrderCard> createState() => _ActiveOrderCardState();
}

class _ActiveOrderCardState extends State<ActiveOrderCard> {
  String getOrderStatusText(dynamic status) {
    switch (status.toString()) {
      case '0':
        return 'Pending';
      case '3':
        return 'Completed';
      case '4':
        return 'Cancelled';
      default:
        return 'Unknown';
    }
  }

  Color getOrderStatusColor(dynamic status) {
    switch (status.toString()) {
      case '0':
        return Colors.blue;
      case '3':
        return Colors.green;
      case '4':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  Color getOrderStatusBgColor(dynamic status) {
    switch (status.toString()) {
      case '0':
        return Colors.blue.withOpacity(0.2);
      case '3':
        return Colors.green.withOpacity(0.2);
      case '4':
        return Colors.red.withOpacity(0.2);
      default:
        return Colors.grey.withOpacity(0.2);
    }
  }

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
                  CustomText(
                    text: '#${widget.order.id}',
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              Container(
                padding: Utils.symmetric(h: 6.0, v: 4.0),
                decoration: BoxDecoration(
                  color: getOrderStatusBgColor(widget.order.orderRequest),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: CustomText(
                  text: getOrderStatusText(widget.order.orderRequest),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: getOrderStatusColor(widget.order.orderRequest),
                ),
              ),
            ],
          ),
          Utils.verticalSpace(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: Utils.formatPrice(context, widget.order.grandTotal),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              Row(
                children: [
                  const CustomImage(
                    path: KImages.stopwatchCheck,
                    width: 18,
                    height: 18,
                    fit: BoxFit.cover,
                  ),
                  Utils.horizontalSpace(2),
                  CustomText(
                    text: DateFormat(
                      'hh:mm a, dd MMM',
                    ).format(widget.order.createdAt),
                    color: sTxtColor,
                  ),
                ],
              ),
            ],
          ),
          Utils.verticalSpace(12),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                RouteNames.orderConfirmScreen,
                arguments: widget.order.id,
              );
            },
            child: Container(
              height: 32,
              decoration: BoxDecoration(
                border: Border.all(color: dBorderColor),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Center(
                child: CustomText(
                  text: 'View Details',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          // Row(
          //   children: [
          //     Expanded(
          //       child: GestureDetector(
          //         onTap: () {
          //           Navigator.pushNamed(context, RouteNames.orderConfirmScreen);
          //         },
          //         child: Container(
          //           height: 32,
          //           decoration: BoxDecoration(
          //             border: Border.all(color: lightGrayColor),
          //             borderRadius: BorderRadius.circular(6),
          //           ),
          //           child: Center(
          //             child: CustomText(
          //               text: 'Details',
          //               textAlign: TextAlign.center,
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //     Utils.horizontalSpace(12),
          //     Expanded(
          //       child: Container(
          //         height: 32,
          //         decoration: BoxDecoration(
          //           color: textColor,
          //           borderRadius: BorderRadius.circular(6),
          //         ),
          //         child: Center(
          //           child: CustomText(
          //             text: 'Distance',
          //             textAlign: TextAlign.center,
          //             color: whiteColor,
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
