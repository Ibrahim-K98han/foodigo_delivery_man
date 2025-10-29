import 'package:flutter/material.dart';
import 'package:foodigo/presentation/core/routes/route_names.dart';
import 'package:foodigo/utils/constraints.dart';
import 'package:foodigo/utils/k_images.dart';
import 'package:foodigo/utils/utils.dart';
import 'package:foodigo/widget/custom_appbar.dart';
import 'package:foodigo/widget/custom_image.dart';
import 'package:foodigo/widget/custom_text_style.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 6, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyColor.withOpacity(0.06),
      appBar: const CustomAppBar(title: 'My Order', visibleLeading: false),
      body: LoadOrderData(tabController: tabController),
    );
  }
}

class LoadOrderData extends StatelessWidget {
  const LoadOrderData({super.key, required this.tabController});

  final TabController tabController;

  static const Map<int, String> statusMap = {
    1: "Pending",
    2: "Confirmed",
    3: "Processing",
    4: "On the Way",
    5: "Delivered",
    6: "Canceled",
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: tabController,
          isScrollable: true,
          indicator: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(8),
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
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: CustomText(text: label, fontSize: 14),
                  ),
                );
              }).toList(),
        ),
        Expanded(
          child: Padding(
            padding: Utils.symmetric(h: 20, v: 10.0),
            child: TabBarView(
              controller: tabController,
              children: [
                ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: Utils.only(bottom: 10),
                      child: OrderContainer(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RouteNames.orderConfirmScreen,
                          );
                        },
                      ),
                    );
                  },
                ),
                ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: Utils.only(bottom: 10),
                      child: OrderContainer(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RouteNames.orderConfirmScreen,
                          );
                        },
                      ),
                    );
                  },
                ),
                ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: Utils.only(bottom: 10),
                      child: OrderContainer(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RouteNames.orderConfirmScreen,
                          );
                        },
                      ),
                    );
                  },
                ),
                ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: Utils.only(bottom: 10),
                      child: OrderContainer(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RouteNames.orderConfirmScreen,
                          );
                        },
                      ),
                    );
                  },
                ),
                ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: Utils.only(bottom: 10),
                      child: OrderContainer(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RouteNames.orderConfirmScreen,
                          );
                        },
                      ),
                    );
                  },
                ),
                ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: Utils.only(bottom: 10),
                      child: OrderContainer(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RouteNames.orderConfirmScreen,
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class OrderContainer extends StatelessWidget {
  const OrderContainer({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Utils.symmetric(h: 12.0, v: 6.0),
      width: 327,
      height: 124,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CustomText(text: 'Order Id: ', color: sTxtColor),
              CustomText(text: '#25041', fontWeight: FontWeight.w500),
              Utils.horizontalSpace(12),
              Container(
                padding: Utils.symmetric(h: 8.0, v: 4.0),
                width: 60,
                height: 24,
                decoration: BoxDecoration(
                  color: blueColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Center(
                  child: CustomText(
                    text: 'Active',
                    color: blueColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          Utils.verticalSpace(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: '\$234.00',
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              Row(
                children: [
                  CustomImage(
                    path: KImages.stopwatchCheck,
                    color: sTxtColor,
                    width: 18,
                    height: 18,
                    fit: BoxFit.cover,
                  ),
                  CustomText(text: '03:35 PM', color: sTxtColor),
                ],
              ),
            ],
          ),
          Utils.verticalSpace(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: onTap,
                  child: Container(
                    width: 145,
                    height: 32,
                    decoration: BoxDecoration(
                      border: Border.all(color: dBorderColor),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(child: CustomText(text: 'Details')),
                  ),
                ),
              ),
              Utils.horizontalSpace(12),
              Expanded(
                child: Container(
                  width: 145,
                  height: 32,
                  decoration: BoxDecoration(
                    color: dTextColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: CustomText(text: 'Distance', color: whiteColor),
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
