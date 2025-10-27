import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodigo_delivery_man/features/Dashboard/cubit/dashboard_cubit.dart';
import 'package:foodigo_delivery_man/features/Dashboard/cubit/dashboard_state.dart';
import 'package:foodigo_delivery_man/presentation/core/routes/route_names.dart';
import 'package:foodigo_delivery_man/utils/constraints.dart';
import 'package:foodigo_delivery_man/utils/k_images.dart';
import 'package:foodigo_delivery_man/utils/utils.dart';
import 'package:foodigo_delivery_man/widget/custom_image.dart';
import 'package:foodigo_delivery_man/widget/custom_text_style.dart';
import 'package:foodigo_delivery_man/widget/fetch_error_text.dart';
import 'package:foodigo_delivery_man/widget/loading_widget.dart';
import 'package:foodigo_delivery_man/widget/page_refresh.dart';
import 'package:foodigo_delivery_man/widget/title_and_navigator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late DashboardCubit dCubit;
  @override
  void initState() {
    super.initState();
    dCubit = context.read<DashboardCubit>();
    dCubit.getDashboardData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 128),
        child: HomeAppBar(),
      ),
      body: PageRefresh(
        onRefresh: () async {
          dCubit.getDashboardData();
        },
        child: BlocConsumer<DashboardCubit, DashboardState>(
          listener: (context, state) {
            if (state is DashboardError) {
              if (state.statusCode == 503 || dCubit.dashboardModel == null) {
                dCubit.getDashboardData();
              }
            }
          },
          builder: (context, state) {
            if (state is DashboardLoading) {
              return const LoadingWidget();
            } else if (state is DashboardError) {
              if (state.statusCode == 503 || dCubit.dashboardModel != null) {
                return DashboardData();
              }
            } else if (state is DashboardLoaded) {
              return DashboardData();
            }
            if (dCubit.dashboardModel != null) {
              return DashboardData();
            } else {
              return const FetchErrorText(text: 'Something Went Wrong');
            }
          },
        ),
      ),
    );
  }
}

class DashboardData extends StatelessWidget {
  const DashboardData({super.key});

  @override
  Widget build(BuildContext context) {
    final dCubit = context.read<DashboardCubit>();
    return Padding(
      padding: Utils.symmetric(h: 24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: StatisticsWidget(
                    icon: KImages.activeOrder,
                    title: 'Active Orders',
                    amount:
                        dCubit
                            .dashboardModel!
                            .statistics!
                            .orderStatistics!
                            .completed
                            .toString(),
                    iconBg: greenColor,
                  ),
                ),
                Utils.horizontalSpace(12),
                Expanded(
                  child: StatisticsWidget(
                    icon: KImages.totalOrder,
                    title: 'New Orders',
                    amount: '4054',
                    iconBg: redColor,
                  ),
                ),
              ],
            ),
            Utils.verticalSpace(12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: StatisticsWidget(
                    icon: KImages.cancelOrder,
                    title: 'Cancelled',
                    amount: '4054',
                    iconBg: yellowColor,
                  ),
                ),
                Utils.horizontalSpace(12),
                Expanded(
                  child: StatisticsWidget(
                    icon: KImages.totalOrder,
                    title: 'Total Orders',
                    amount: '4054',
                    iconBg: greyColor,
                  ),
                ),
              ],
            ),
            Utils.verticalSpace(20),
            TitleAndNavigator(title: 'Active Order', press: () {}),
            Utils.verticalSpace(13),
            SizedBox(
              height: 124,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: Utils.symmetric(h: 6.0, v: 0.0),
                    child: const ActiveOrderWidget(),
                  );
                },
              ),
            ),
            Utils.verticalSpace(20),
            // TitleAndNavigator(title: 'Recent Transactions ', press: () {}),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: 'Recent Transactions',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                CustomText(text: 'See All'),
              ],
            ),
            Utils.verticalSpace(13),
            ListView.separated(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              separatorBuilder: (context, index) {
                return Divider(color: greyColor.withOpacity(0.1));
              },
              itemCount: 4,
              itemBuilder: (context, index) {
                return RecentTransactionsCard();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ActiveOrderWidget extends StatelessWidget {
  const ActiveOrderWidget({super.key});

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
                  CustomText(text: 'Order Id: '),
                  CustomText(text: '#25041', fontWeight: FontWeight.w500),
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
                text: '\$234.00',
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              CustomText(text: '03:35 PM, 25 Aug', color: sTxtColor),
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

class StatisticsWidget extends StatelessWidget {
  const StatisticsWidget({
    super.key,
    required this.title,
    required this.amount,
    required this.icon,
    required this.iconBg,
  });

  final String title;
  final String amount;
  final String icon;
  final Color iconBg;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 157,
      height: 62,
      padding: Utils.all(value: 8),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(6),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withOpacity(0.1),
        //     blurRadius: 4,
        //     spreadRadius: 1,
        //     offset: const Offset(2, 2),
        //   ),
        // ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: Utils.all(value: 6),
            decoration: BoxDecoration(
              color: iconBg.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: CustomImage(path: icon),
          ),
          Utils.horizontalSpace(8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(text: title, fontSize: 12, color: lightGrayColor),
              Utils.verticalSpace(6),
              CustomText(text: amount, fontWeight: FontWeight.w600),
            ],
          ),
        ],
      ),
    );
  }
}

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomImage(path: KImages.homeAppbarBg),
        Positioned(
          top: 50,
          left: 0,
          right: 0,
          child: ListTile(
            leading: CustomImage(path: KImages.profile, width: 48, height: 48),
            title: CustomText(text: 'Select Location', color: whiteColor),
            subtitle: CustomText(text: '4517 Washington', color: whiteColor),
            trailing: CustomImage(
              path: KImages.notificationIcon,
              color: whiteColor,
              width: 24,
              height: 24,
            ),
          ),
        ),
      ],
    );
  }
}

class RecentTransactionsCard extends StatefulWidget {
  const RecentTransactionsCard({super.key});

  @override
  State<RecentTransactionsCard> createState() => _RecentTransactionsCardState();
}

class _RecentTransactionsCardState extends State<RecentTransactionsCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      padding: Utils.symmetric(h: 10, v: 0.0),
      width: double.infinity,
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(10.0),
      //   color: whiteColor,
      // ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(text: "Withdraw", fontWeight: FontWeight.w500),
              Utils.verticalSpace(8),
              CustomText(text: "3:02 PM", fontSize: 12, color: sTxtColor),
            ],
          ),
          CustomText(
            text: Utils.formatPrice(context, 888),
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ],
      ),
    );
  }
}
