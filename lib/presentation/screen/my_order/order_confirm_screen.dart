import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodigo/features/Order/cubit/orders_cubit.dart';
import 'package:foodigo/features/Order/cubit/orders_state.dart';
import 'package:foodigo/presentation/screen/my_order/component/delivery_man_info_card.dart';
import 'package:foodigo/presentation/screen/my_order/component/order_card.dart';
import 'package:foodigo/utils/constraints.dart';
import 'package:foodigo/utils/utils.dart';
import 'package:foodigo/widget/custom_appbar.dart';
import 'package:foodigo/widget/custom_text_style.dart';
import 'package:foodigo/widget/fetch_error_text.dart';
import 'package:foodigo/widget/loading_widget.dart';

import 'component/order_summary.dart';

class OrderConfirmScreen extends StatefulWidget {
  const OrderConfirmScreen({super.key, required this.orderId});

  final String orderId;

  @override
  State<OrderConfirmScreen> createState() => _OrderConfirmScreenState();
}

class _OrderConfirmScreenState extends State<OrderConfirmScreen> {
  late OrdersCubit orCubit;

  @override
  void initState() {
    super.initState();
    orCubit = context.read<OrdersCubit>();
    orCubit.getOrderDetails(widget.orderId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Order Confirmation'),
      body: BlocBuilder<OrdersCubit, OrdersState>(
        builder: (context, state) {
          if (state is OrderLoading) {
            return const LoadingWidget();
          } else if (state is OrderDetailsLoaded) {
            final order = state.resOrderModel;
            return Padding(
              padding: Utils.symmetric(h: 20.0, v: 10.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: dBorderColor),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: Utils.symmetric(h: 12.0, v: 10.0),
                            color: dBorderColor.withOpacity(0.5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomText(text: 'Order Id. ${order.id}'),
                                CustomText(
                                  text: Utils.formatPrice(context, order.total),
                                  fontWeight: FontWeight.w600,
                                ),
                              ],
                            ),
                          ),
                          Utils.verticalSpace(12),
                          Padding(
                            padding: Utils.symmetric(h: 12.0, v: 0.0),
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              primary: true,
                              itemCount: order.items!.length,
                              itemBuilder: (context, index) {
                                final item = order.items![index];
                                return OrderCard(ordersModel: item);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Utils.verticalSpace(16),
                    DeliveryManInfoCard(ordersModel: orCubit.orModel!),
                    Utils.verticalSpace(16),
                    OrderSummary(ordersModel: orCubit.orModel!),
                    Utils.verticalSpace(45),
                    // PrimaryButton(
                    //   borderRadiusSize: 6.0,
                    //   minimumSize: const Size(332, 44),
                    //   bgColor: textColor,
                    //   textColor: whiteColor,
                    //   text: 'Accept Order',
                    //   onPressed: () {
                    //     // Navigator.pushNamed(context, RouteNames.smsScreen);
                    //     showDialog(
                    //       context: context,
                    //       builder: (BuildContext context) {
                    //         return SuccessDialog(ordersModel: orCubit.orModel!);
                    //       },
                    //     );
                    //   },
                    // ),
                    // Utils.verticalSpace(12),
                    // const CustomText(
                    //   text: 'Decline',
                    //   fontSize: 16,
                    //   fontWeight: FontWeight.w500,
                    //   color: redColor,
                    // ),
                    Utils.verticalSpace(12),
                  ],
                ),
              ),
            );
          } else if (state is OrderError) {
            return FetchErrorText(text: state.message);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
