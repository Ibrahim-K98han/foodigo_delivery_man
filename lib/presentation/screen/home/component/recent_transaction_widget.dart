import 'package:flutter/material.dart';
import 'package:foodigo/features/restaurant_features/Dashboard/model/dashboard_model.dart';
import 'package:foodigo/utils/constraints.dart';
import 'package:foodigo/utils/utils.dart';
import 'package:foodigo/widget/custom_text_style.dart';
import 'package:intl/intl.dart';

class RecentTransactionWidget extends StatelessWidget {
  const RecentTransactionWidget({super.key, required this.withdrawHistory});

  final List<WithdrawHistory> withdrawHistory;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Utils.verticalSpace(20),
        const Row(
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
        withdrawHistory.isNotEmpty
            ? ListView.separated(
              itemCount: withdrawHistory.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) {
                return Divider(color: greyColor.withOpacity(0.1));
              },

              itemBuilder: (context, index) {
                final withdraw = withdrawHistory[index];
                return RecentTransactionsCard(withdraw: withdraw);
              },
            )
            : Padding(
              padding: Utils.only(top: 20),
              child: const CustomText(text: 'Data Not Found'),
            ),
      ],
    );
  }
}

class RecentTransactionsCard extends StatelessWidget {
  const RecentTransactionsCard({super.key, required this.withdraw});

  final WithdrawHistory withdraw;

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
              CustomText(text: withdraw.status, fontWeight: FontWeight.w500),
              Utils.verticalSpace(8),
              CustomText(
                text: DateFormat('hh:mm a, dd MMM').format(withdraw.createdAt),
                fontSize: 12,
                color: sTxtColor,
              ),
            ],
          ),
          CustomText(
            text: Utils.formatPrice(context, withdraw.amount),
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ],
      ),
    );
  }
}
