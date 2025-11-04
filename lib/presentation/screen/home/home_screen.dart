import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodigo/features/Dashboard/cubit/dashboard_cubit.dart';
import 'package:foodigo/features/Dashboard/cubit/dashboard_state.dart';
import 'package:foodigo/presentation/core/routes/route_names.dart';
import 'package:foodigo/presentation/screen/home/component/active_order_widget.dart';
import 'package:foodigo/presentation/screen/home/component/home_appbar.dart';
import 'package:foodigo/presentation/screen/home/component/recent_transaction_widget.dart';
import 'package:foodigo/presentation/screen/home/component/statistics_widget.dart';
import 'package:foodigo/presentation/screen/main_page/component/main_controller.dart';
import 'package:foodigo/utils/constraints.dart';
import 'package:foodigo/utils/k_images.dart';
import 'package:foodigo/utils/utils.dart';
import 'package:foodigo/widget/fetch_error_text.dart';
import 'package:foodigo/widget/loading_widget.dart';
import 'package:foodigo/widget/page_refresh.dart';
import 'package:foodigo/widget/title_and_navigator.dart';

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
      appBar: const PreferredSize(
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
    final stats = [
      // {
      //   'icon': KImages.activeOrder,
      //   'title': 'Request Orders',
      //   'amount':
      //       dCubit.dashboardModel!.statistics!.orderStatistics!.request
      //           .toString(),
      //   'iconBg': greenColor,
      // },
      {
        'icon': KImages.running,
        'title': 'Running Orders',
        'amount':
            dCubit.dashboardModel!.statistics!.orderStatistics!.running
                .toString(),
        'iconBg': blueColor.withOpacity(0.2),
      },
      {
        'icon': KImages.cancelOrder,
        'title': 'Cancelled',
        'amount':
            dCubit.dashboardModel!.statistics!.orderStatistics!.cancelled
                .toString(),
        'iconBg': yellowColor,
      },
      {
        'icon': KImages.cancelOrder,
        'title': 'Completed',
        'amount':
            dCubit.dashboardModel!.statistics!.orderStatistics!.completed
                .toString(),
        'iconBg': yellowColor,
      },
      {
        'icon': KImages.total,
        'title': 'Total Orders',
        'amount':
            dCubit.dashboardModel!.statistics!.orderStatistics!.total
                .toString(),
        'iconBg': greyColor,
      },
    ];
    return Padding(
      padding: Utils.symmetric(h: 0.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children:
                  stats.map((item) {
                    return StatisticsWidget(
                      title: item['title'].toString(),
                      amount: item['amount'].toString(),
                      icon: item['icon'].toString(),
                      iconBg: item['iconBg'] as Color,
                    );
                  }).toList(),
            ),
            Utils.verticalSpace(20),
            Padding(
              padding: Utils.symmetric(h: 20.0, v: 0.0),
              child: TitleAndNavigator(
                title: 'Active Order',
                press: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    RouteNames.mainScreen,
                    (route) => false,
                  );
                  Future.delayed(const Duration(milliseconds: 100), () {
                    MainController().changeTab(1);
                  });
                },
              ),
            ),
            Utils.verticalSpace(13),
            ActiverOrderWidget(
              activeOrder: dCubit.dashboardModel!.activeOrder!,
            ),
            Utils.verticalSpace(16),

            Padding(
              padding: Utils.symmetric(h: 20.0, v: 0.0),
              child: TitleAndNavigator(
                title: 'Recent Transactions',
                press: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    RouteNames.mainScreen,
                    (route) => false,
                  );
                  Future.delayed(const Duration(milliseconds: 100), () {
                    MainController().changeTab(2);
                  });
                },
              ),
            ),

            Padding(
              padding: Utils.symmetric(h: 20.0, v: 0.0),
              child: RecentTransactionWidget(
                withdrawHistory: dCubit.dashboardModel!.withdrawHistory!,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
