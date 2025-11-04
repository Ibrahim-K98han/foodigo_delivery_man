import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodigo/features/Order/cubit/orders_cubit.dart';
import 'package:foodigo/features/Order/cubit/orders_state.dart';
import 'package:foodigo/features/Order/model/orders_model.dart';
import 'package:foodigo/features/OrderStatus/cubit/order_status_cubit.dart';
import 'package:foodigo/features/OrderStatus/cubit/order_status_state.dart';
import 'package:foodigo/features/OrderStatus/model/change_order_status_state_model.dart';
import 'package:foodigo/presentation/screen/my_order/component/order_container.dart';
import 'package:foodigo/utils/constraints.dart';
import 'package:foodigo/utils/k_images.dart';
import 'package:foodigo/utils/utils.dart';
import 'package:foodigo/widget/custom_appbar.dart';
import 'package:foodigo/widget/custom_image.dart';
import 'package:foodigo/widget/custom_text_style.dart';
import 'package:foodigo/widget/fetch_error_text.dart';
import 'package:foodigo/widget/loading_widget.dart';
import 'package:foodigo/widget/page_refresh.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen>
    with TickerProviderStateMixin {
  String? _lastChangedStatus;
  late TabController tabController;
  late OrdersCubit orCubit;

  @override
  void initState() {
    super.initState();
    orCubit = context.read<OrdersCubit>();
    orCubit.getAllOrder();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void _navigateToTab(int index) {
    if (mounted && tabController.index != index) {
      tabController.animateTo(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyColor.withOpacity(0.06),
      appBar: const CustomAppBar(title: 'My Order', visibleLeading: false),
      body: BlocListener<OrderStatusCubit, ChangeOrderStatusStateModel>(
        listenWhen: (previous, current) {
          return previous.orderStatusState != current.orderStatusState;
        },
        listener: (context, state) {
          if (state.orderStatusState is OrderStatusSuccess) {
            final successState = state.orderStatusState as OrderStatusSuccess;
            orCubit.getAllOrder();

            _lastChangedStatus = state.orderStatus;
            final statusList = ['Pending', 'Running', 'Completed', 'Cancelled'];
            final newStatusIndex = statusList.indexOf(state.orderStatus);

            if (newStatusIndex != -1) {
              _navigateToTab(newStatusIndex);
            }

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(successState.message),
                backgroundColor: Colors.green,
                duration: const Duration(seconds: 2),
              ),
            );
          } else if (state.orderStatusState is OrderStatusError) {
            final error = state.orderStatusState as OrderStatusError;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(error.message),
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 2),
              ),
            );
          }
        },
        child: PageRefresh(
          onRefresh: () async {
            orCubit.getAllOrder();
          },
          child: BlocBuilder<OrdersCubit, OrdersState>(
            builder: (context, state) {
              if (state is OrderLoading) {
                return const LoadingWidget();
              } else if (state is OrderError &&
                  state.statusCode != 503 &&
                  orCubit.orderModel!.isEmpty) {
                return FetchErrorText(text: state.message);
              }
              return LoadOrderData(
                order: orCubit.orderModel!,
                tabController: tabController,
              );
            },
          ),
        ),
      ),
    );
  }
}

class LoadOrderData extends StatelessWidget {
  const LoadOrderData({
    super.key,
    required this.tabController,
    required this.order,
  });

  final TabController tabController;

  final List<OrdersModel> order;

  static const Map<int, String> statusMap = {
    0: "Pending",
    1: "Running",
    3: "Completed",
    4: "Cancelled",
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          tabAlignment: TabAlignment.start,
          padding: Utils.symmetric(h: 20.0, v: 0.0),
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          controller: tabController,
          isScrollable: true,
          indicator: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: primaryColor),
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          dividerColor: Colors.transparent,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black,
          tabs:
              statusMap.values.map((label) {
                return Tab(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 0.0,
                    ),
                    child: CustomText(text: label, fontSize: 14),
                  ),
                );
              }).toList(),
        ),
        Expanded(
          child: Padding(
            padding: Utils.only(top: 12),
            child: TabBarView(
              controller: tabController,
              children:
                  statusMap.keys.map((status) {
                    final filteredOrders =
                        order.where((order) {
                          final statusValue = int.tryParse(order.orderRequest);
                          return statusValue == status;
                        }).toList();

                    if (filteredOrders.isEmpty) {
                      return const Center(
                        child: CustomImage(path: KImages.cartNotFound),
                      );
                    }
                    return ListView.builder(
                      padding: Utils.symmetric(h: 20.0, v: 0.0),
                      itemCount: filteredOrders.length,
                      itemBuilder: (context, index) {
                        final item = filteredOrders[index];
                        return Padding(
                          padding: Utils.only(bottom: 12),
                          child: OrderContainer(order: item),
                        );
                      },
                    );
                  }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
