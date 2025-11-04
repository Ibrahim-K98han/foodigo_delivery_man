import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodigo/features/Order/model/orders_model.dart';
import 'package:foodigo/features/OrderStatus/cubit/order_status_cubit.dart';
import 'package:foodigo/presentation/core/routes/route_names.dart';
import 'package:foodigo/utils/constraints.dart';
import 'package:foodigo/utils/k_images.dart';
import 'package:foodigo/utils/utils.dart';
import 'package:foodigo/widget/custom_image.dart';
import 'package:foodigo/widget/custom_text_style.dart';
import 'package:intl/intl.dart';

class OrderContainer extends StatefulWidget {
  const OrderContainer({super.key, required this.order});
  final OrdersModel order;

  @override
  State<OrderContainer> createState() => _OrderContainerState();
}

class _OrderContainerState extends State<OrderContainer> {
  String? selectedStatus;
  late OrderStatusCubit orderStatusCubit;

  final List<String> statusList = ['Accept', 'Reject'];

  @override
  void initState() {
    super.initState();
    orderStatusCubit = context.read<OrderStatusCubit>();
    selectedStatus = getOrderStatusText(widget.order.orderRequest);
  }

  String getOrderStatusText(dynamic status) {
    switch (status.toString()) {
      case '0':
        return 'Pending';
      case '1':
        return 'Running';
      case '3':
        return 'Completed';
      case '4':
        return 'Cancelled';
      default:
        return 'Unknown';
    }
  }

  Color getOrderStatusBgColor(dynamic status) {
    switch (status.toString()) {
      case '0':
        return Colors.blue.withOpacity(0.2);
      case '1':
        return Colors.orange.withOpacity(0.2);
      case '3':
        return Colors.green.withOpacity(0.2);
      case '4':
        return Colors.red.withOpacity(0.2);
      default:
        return Colors.grey.withOpacity(0.2);
    }
  }

  Color getOrderStatusColor(dynamic status) {
    switch (status.toString()) {
      case '0':
        return Colors.blue;
      case '1':
        return Colors.orange;
      case '3':
        return Colors.green;
      case '4':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final order = widget.order;
    return Container(
      padding: Utils.symmetric(h: 16.0, v: 8.0),
      height: 136,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const CustomText(text: 'Order Id: ', color: sTxtColor),
                  CustomText(text: '#${order.id}', fontWeight: FontWeight.w500),
                  Utils.horizontalSpace(8),
                  Container(
                    padding: Utils.symmetric(h: 8.0, v: 4.0),
                    height: 24,
                    decoration: BoxDecoration(
                      color: getOrderStatusBgColor(order.orderRequest),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(
                      child: CustomText(
                        text: getOrderStatusText(order.orderRequest),
                        color: getOrderStatusColor(order.orderRequest),
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              (order.orderRequest == '3' || order.orderRequest == '4')
                  ? const SizedBox()
                  : SizedBox(
                    height: 35,
                    width: 120,
                    child: DropdownButtonFormField<String>(
                      padding: EdgeInsets.zero,
                      value:
                          statusList.contains(selectedStatus)
                              ? selectedStatus
                              : null,
                      decoration: InputDecoration(
                        isDense: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: Utils.symmetric(h: 6.0, v: 4.0),
                      ),
                      items:
                          statusList.map((item) {
                            return DropdownMenuItem(
                              value: item,
                              child: CustomText(text: item, fontSize: 12),
                            );
                          }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            selectedStatus = value;
                          });
                          print("value: $value");
                          print("oder status: ${order.orderRequest}");
                          late String statusId;
                          if (order.orderRequest == "0") {
                            if (value == "Accept") {
                              statusId = '1';
                              print("value accept 0: $value");
                              print("status id  accept 0: $statusId");
                            } else {
                              statusId = '2';
                              print("value reject 0: $value");
                              print("status id  reject 0: $statusId");
                            }
                          } else if (order.orderRequest == "1") {
                            if (value == "Accept") {
                              statusId = '3';
                              print("value accept 1: $value");
                              print("status id  accept 1: $statusId");
                            } else {
                              statusId = '4';
                              print("value reject 1: $value");
                              print("status id  accept 1: $statusId");
                            }
                          }

                          // Update the status text in Cubit
                          orderStatusCubit.changeStatus(value);

                          orderStatusCubit.changeOrderStatus(
                            order.id.toString(),
                            statusId,
                            // order.orderRequest,
                            // statusId,
                          );
                        }
                      },
                    ),
                  ),
            ],
          ),
          Utils.verticalSpace(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: Utils.formatPrice(context, order.total),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              Row(
                children: [
                  const CustomImage(
                    path: KImages.stopwatchCheck,
                    color: sTxtColor,
                    width: 18,
                    height: 18,
                    fit: BoxFit.cover,
                  ),
                  // CustomText(text: '03:35 PM', color: sTxtColor),
                  CustomText(
                    text: DateFormat(
                      'hh:mm a',
                    ).format(DateTime.parse(order.createdAt.toString())),
                    color: sTxtColor,
                    fontSize: 12,
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
                arguments: order.id,
              );
            },
            child: Container(
              height: 32,
              decoration: BoxDecoration(
                border: Border.all(color: dBorderColor),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Center(child: CustomText(text: 'View Details')),
            ),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Expanded(
          //       child: GestureDetector(
          //         onTap: onTap,
          //         child: Container(
          //           width: 145,
          //           height: 32,
          //           decoration: BoxDecoration(
          //             border: Border.all(color: dBorderColor),
          //             borderRadius: BorderRadius.circular(6),
          //           ),
          //           child: Center(child: CustomText(text: 'Details')),
          //         ),
          //       ),
          //     ),
          //     Utils.horizontalSpace(12),
          //     Expanded(
          //       child: Container(
          //         width: 145,
          //         height: 32,
          //         decoration: BoxDecoration(
          //           color: dTextColor,
          //           borderRadius: BorderRadius.circular(6),
          //         ),
          //         child: Center(
          //           child: CustomText(text: 'Distance', color: whiteColor),
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
