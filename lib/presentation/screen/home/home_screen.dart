import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodigo_delivery_man/features/Dashboard/cubit/dashboard_cubit.dart';
import 'package:foodigo_delivery_man/features/Dashboard/cubit/dashboard_state.dart';
import 'package:foodigo_delivery_man/presentation/screen/home/component/active_order_widget.dart';
import 'package:foodigo_delivery_man/presentation/screen/home/component/home_appbar.dart';
import 'package:foodigo_delivery_man/presentation/screen/home/component/recent_transaction_widget.dart';
import 'package:foodigo_delivery_man/presentation/screen/home/component/statistics_widget.dart';
import 'package:foodigo_delivery_man/utils/constraints.dart';
import 'package:foodigo_delivery_man/utils/k_images.dart';
import 'package:foodigo_delivery_man/utils/utils.dart';
import 'package:foodigo_delivery_man/widget/fetch_error_text.dart' show FetchErrorText;
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
      {
        'icon': KImages.activeOrder,
        'title': 'Request Orders',
        'amount':
            dCubit.dashboardModel!.statistics!.orderStatistics!.completed
                .toString(),
        'iconBg': greenColor,
      },
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
      padding: Utils.symmetric(h: 24),
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
            TitleAndNavigator(title: 'Active Order', press: () {}),
            Utils.verticalSpace(13),
            ActiverOrderWidget(
              activeOrder: dCubit.dashboardModel!.activeOrder!,
            ),

            RecentTransactionWidget(
              withdrawHistory: dCubit.dashboardModel!.withdrawHistory!,
            ),
          ],
        ),
      ),
    );
  }
}
