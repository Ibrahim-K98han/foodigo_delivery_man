import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodigo/features/EarningData/cubit/earning_cubit.dart';
import 'package:foodigo/features/EarningData/cubit/earning_state.dart';
import 'package:foodigo/features/EarningData/model/earning_model.dart';
import 'package:foodigo/presentation/screen/my_wallet/withdraw_amount_bottom_sheet.dart';
import 'package:foodigo/utils/constraints.dart';
import 'package:foodigo/utils/k_images.dart';
import 'package:foodigo/utils/utils.dart';
import 'package:foodigo/widget/custom_image.dart';
import 'package:foodigo/widget/custom_text_style.dart';
import 'package:foodigo/widget/fetch_error_text.dart';
import 'package:foodigo/widget/loading_widget.dart';
import 'package:foodigo/widget/page_refresh.dart';
import 'package:intl/intl.dart';

class MyWalletScreen extends StatefulWidget {
  const MyWalletScreen({super.key});

  @override
  State<MyWalletScreen> createState() => _MyWalletScreenState();
}

class _MyWalletScreenState extends State<MyWalletScreen> {
  late EarningCubit earningCubit;

  @override
  void initState() {
    super.initState();
    earningCubit = context.read<EarningCubit>();
    earningCubit.getEarning();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageRefresh(
        onRefresh: () async {
          earningCubit.getEarning();
        },
        child: BlocConsumer<EarningCubit, EarningState>(
          listener: (context, state) {
            final withdraw = state;
            if (withdraw is EarningStateError) {
              if (withdraw.statusCode == 503) {
                FetchErrorText(text: withdraw.message);
              }
            }
          },
          builder: (context, state) {
            final withdraw = state;
            if (withdraw is EarningStateLoading) {
              return const LoadingWidget();
            } else if (withdraw is EarningStateError) {
              if (withdraw.statusCode == 503 ||
                  earningCubit.earningModel != null) {
                return LoadWithdrawData(
                  earningModel: earningCubit.earningModel!,
                );
              } else {
                return FetchErrorText(text: withdraw.message);
              }
            } else if (withdraw is EarningStateLoaded) {
              return LoadWithdrawData(earningModel: earningCubit.earningModel!);
            }
            if (earningCubit.earningModel != null) {
              return LoadWithdrawData(earningModel: earningCubit.earningModel!);
            } else {
              return const FetchErrorText(text: 'Something Went Wrong');
            }
          },
        ),
      ),
    );
  }
}

class LoadWithdrawData extends StatelessWidget {
  const LoadWithdrawData({super.key, required this.earningModel});
  final EarningModel earningModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(height: 175),
            CustomImage(
              path: KImages.walletAppbarBg,
              height: 131,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 50,
              left: 0,
              right: 0,
              child: CustomText(
                textAlign: TextAlign.center,
                text: 'My Wallet',
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            Positioned(
              top: 100,
              left: 24,
              right: 24,
              child: Container(
                padding: Utils.symmetric(h: 10.0, v: 10.0),
                height: 74,
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 0,
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'My Balance',
                      fontSize: 12,
                      color: sTxtColor,
                    ),
                    Utils.verticalSpace(6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: Utils.formatPrice(
                            context,
                            earningModel.currentBalance,
                          ),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              showDragHandle: true,
                              backgroundColor: whiteColor,
                              isScrollControlled: true,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(Utils.radius(16)),
                                  topRight: Radius.circular(Utils.radius(16)),
                                ),
                              ),
                              builder: (context) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                    bottom:
                                        MediaQuery.of(
                                          context,
                                        ).viewInsets.bottom,
                                  ),
                                  child: SizedBox(
                                    height:
                                        Utils.mediaQuery(context).height *
                                        0.60, // fixed height
                                    child: const SingleChildScrollView(
                                      physics: ClampingScrollPhysics(),
                                      child: WithdrawAmountBottomSheet(),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            width: 100,
                            height: 30,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const CustomImage(
                                  path: KImages.wallet,
                                  width: 16,
                                  height: 16,
                                  fit: BoxFit.cover,
                                ),
                                Utils.horizontalSpace(8),
                                const CustomText(
                                  text: 'Withdraw',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        Utils.verticalSpace(24),
        Padding(
          padding: Utils.symmetric(h: 20.0, v: 0.0),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: 'Recent Transactions',
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              // CustomText(text: 'See All'),
            ],
          ),
        ),
        Expanded(
          child: ListView.separated(
            reverse: true,
            padding: Utils.symmetric(h: 20.0),
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (context, index) {
              return Divider(color: greyColor.withOpacity(0.1));
            },
            itemCount: earningModel.withdrawList!.length,
            itemBuilder: (context, index) {
              final withdraw = earningModel.withdrawList![index];
              return Container(
                height: 65,
                padding: Utils.symmetric(h: 10, v: 0.0),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: withdraw.status,
                          fontWeight: FontWeight.w500,
                        ),
                        Utils.verticalSpace(8),
                        CustomText(
                          text: DateFormat(
                            'hh:mm a, dd MMM',
                          ).format(DateTime.parse(withdraw.createdAt)),
                          fontSize: 12,
                          color: sTxtColor,
                        ),
                      ],
                    ),
                    CustomText(
                      text: Utils.formatPrice(context, withdraw.totalAmount),
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
