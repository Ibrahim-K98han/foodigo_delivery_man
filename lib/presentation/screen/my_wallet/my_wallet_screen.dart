import 'package:flutter/material.dart';
import 'package:foodigo/utils/constraints.dart';
import 'package:foodigo/utils/k_images.dart';
import 'package:foodigo/utils/utils.dart';
import 'package:foodigo/widget/custom_dropdown.dart';
import 'package:foodigo/widget/custom_form.dart';
import 'package:foodigo/widget/custom_image.dart';
import 'package:foodigo/widget/custom_text_style.dart';
import 'package:foodigo/widget/primary_button.dart';

class MyWalletScreen extends StatefulWidget {
  const MyWalletScreen({super.key});

  @override
  State<MyWalletScreen> createState() => _MyWalletScreenState();
}

class _MyWalletScreenState extends State<MyWalletScreen> {
  String? selectedPaymentMethod;
  final List<String> paymentMethod = ['Bikash', 'Rocket'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                            text: '\$25046.00',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(16),
                                  ),
                                ),
                                builder: (BuildContext context) {
                                  return Padding(
                                    padding: Utils.all(value: 16),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Center(
                                          child: Container(
                                            width: 40,
                                            height: 4,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                            ),
                                          ),
                                        ),
                                        Utils.verticalSpace(10),
                                        CustomText(
                                          text: 'Set amount',
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        Utils.verticalSpace(6),
                                        CustomText(
                                          text:
                                              'How much would you like to top up?',
                                          color: sTxtColor,
                                        ),
                                        Utils.verticalSpace(20),
                                        CustomText(
                                          text: 'Select Payment Method',
                                        ),
                                        Utils.verticalSpace(6),
                                        CustomDropdownButton(
                                          borderRadius: 6,
                                          value: selectedPaymentMethod,
                                          hintText: 'Select Country',
                                          items: paymentMethod,
                                          onChanged: (value) {
                                            setState(() {
                                              selectedPaymentMethod = value;
                                            });
                                          },
                                          itemBuilder:
                                              (paymentMethod) => CustomText(
                                                text: paymentMethod,
                                              ),
                                        ),
                                        Utils.verticalSpace(10),
                                        CustomFormWidget(
                                          label: 'Amount',
                                          bottomSpace: 8,
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              hint: CustomText(
                                                text: '000',
                                                color: sTxtColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Utils.verticalSpace(10),
                                        CustomFormWidget(
                                          label: 'Banck Info',
                                          bottomSpace: 8,
                                          child: TextFormField(
                                            maxLines: 2,
                                            decoration: InputDecoration(
                                              hint: CustomText(
                                                text: 'Enter Bank Description',
                                                color: sTxtColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Utils.verticalSpace(20),
                                        PrimaryButton(
                                          minimumSize: Size(
                                            double.infinity,
                                            44,
                                          ),
                                          text: 'Withdraw',
                                          onPressed: () {},
                                        ),
                                      ],
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
                                  CustomImage(
                                    path: KImages.wallet,
                                    width: 16,
                                    height: 16,
                                    fit: BoxFit.cover,
                                  ),
                                  Utils.horizontalSpace(8),
                                  CustomText(
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
            child: Row(
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
              padding: Utils.symmetric(h: 20.0),
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              separatorBuilder: (context, index) {
                return Divider(color: greyColor.withOpacity(0.1));
              },
              itemCount: 10,
              itemBuilder: (context, index) {
                // return RecentTransactionsCard();
                return CustomText(text: 'WithdrawHistory');
              },
            ),
          ),
        ],
      ),
    );
  }
}
