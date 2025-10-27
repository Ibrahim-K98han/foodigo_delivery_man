import 'package:flutter/material.dart';
import 'package:foodigo/utils/constraints.dart';
import 'package:foodigo/utils/k_images.dart';
import 'package:foodigo/utils/utils.dart';
import 'package:foodigo/widget/custom_appbar.dart';
import 'package:foodigo/widget/custom_image.dart';
import 'package:foodigo/widget/custom_text_style.dart';
import 'package:foodigo/widget/primary_button.dart';

class OrderConfirmScreen extends StatelessWidget {
  const OrderConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Order Confirmation'),
      body: LoadOrderConfirmationData(),
    );
  }
}

class LoadOrderConfirmationData extends StatelessWidget {
  const LoadOrderConfirmationData({super.key});

  @override
  Widget build(BuildContext context) {
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
                        CustomText(text: 'Order Id. 24155'),
                        CustomText(text: '\$113', fontWeight: FontWeight.w600),
                      ],
                    ),
                  ),
                  Utils.verticalSpace(12),
                  Padding(
                    padding: Utils.symmetric(h: 12.0, v: 0.0),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      primary: true,
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return OrderCard();
                      },
                    ),
                  ),
                ],
              ),
            ),
            Utils.verticalSpace(16),
            const DeliveryManInfoCard(),
            Utils.verticalSpace(16),
            const OrderSummary(),
            Utils.verticalSpace(45),
            PrimaryButton(
              borderRadiusSize: 6.0,
              minimumSize: Size(332, 44),
              bgColor: textColor,
              textColor: whiteColor,
              text: 'Accept Order',
              onPressed: () {
                // Navigator.pushNamed(context, RouteNames.smsScreen);
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return SuccessDialog();
                  },
                );
              },
            ),
            Utils.verticalSpace(12),
            CustomText(
              text: 'Decline',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: redColor,
            ),
            Utils.verticalSpace(12),
          ],
        ),
      ),
    );
  }
}

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: Utils.all(value: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Utils.verticalSpace(20),
            CustomImage(
              path: KImages.success,
              width: 64,
              height: 64,
              fit: BoxFit.cover,
            ),
            Utils.verticalSpace(20),
            CustomText(
              text: 'Order id #40545\nSuccessfully Delivered',
              fontSize: 18,
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.center,
              height: 1.32,
            ),
            Utils.verticalSpace(12),
            CustomText(
              text: 'Great job! The order has been delivered to the customer',
              color: sTxtColor,
              textAlign: TextAlign.center,
            ),
            Utils.verticalSpace(12),
            CustomText(
              text: '---------------------------------',
              color: sTxtColor,
            ),
            Utils.verticalSpace(12),
            CustomText(text: 'Total Amount', color: sTxtColor),
            Utils.verticalSpace(12),
            CustomText(
              text: '\$52.50',
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: primaryColor,
            ),
            Utils.verticalSpace(24),

            PrimaryButton(
              minimumSize: Size(220, 44),
              bgColor: textColor,
              textColor: whiteColor,
              text: 'That\'s nice',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Utils.verticalSpace(24),
          ],
        ),
      ),
    );
  }
}

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Utils.symmetric(h: 12.0, v: 0.0),
      width: double.infinity,
      height: 151,
      decoration: BoxDecoration(
        border: Border.all(color: dBorderColor),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomText(
            text: 'Order Summery',
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          Utils.verticalSpace(8),
          OrderSummaryTextWidget(
            title: 'Sbtotal',
            titleColor: sTxtColor,
            subTitle: '\$50.99',
            subTitleColor: textColor,
            fontWeight: FontWeight.w500,
          ),
          Utils.verticalSpace(6),
          OrderSummaryTextWidget(
            title: 'Delivery Free',
            titleColor: sTxtColor,
            subTitle: '\$1.50',
            subTitleColor: textColor,
            fontWeight: FontWeight.w500,
          ),
          Utils.verticalSpace(6),
          OrderSummaryTextWidget(
            title: 'Platform ',
            titleColor: sTxtColor,
            subTitle: '\$0.99',
            subTitleColor: textColor,
            fontWeight: FontWeight.w500,
          ),
          Utils.verticalSpace(6),
          Divider(color: sTxtColor.withOpacity(0.2)),
          Utils.verticalSpace(6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CustomText(
                    text: 'Total ',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  CustomText(text: '(incl.VAT)', color: sTxtColor),
                ],
              ),
              CustomText(
                text: '\$200.00',
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class OrderSummaryTextWidget extends StatelessWidget {
  const OrderSummaryTextWidget({
    super.key,
    required this.title,
    this.titleColor,
    required this.subTitle,
    this.subTitleColor,
    this.fontWeight,
  });

  final String title;
  final Color? titleColor;
  final String subTitle;
  final Color? subTitleColor;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(text: title, color: titleColor!),
        CustomText(
          text: subTitle,
          color: subTitleColor!,
          fontWeight: fontWeight!,
        ),
      ],
    );
  }
}

class DeliveryManInfoCard extends StatelessWidget {
  const DeliveryManInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Utils.symmetric(h: 12.0, v: 0.0),
      width: double.infinity,
      height: 170,
      decoration: BoxDecoration(
        border: Border.all(color: dBorderColor),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(50),
                    child: CustomImage(
                      path: KImages.profile,
                      width: 48,
                      height: 48,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Utils.horizontalSpace(8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'Will Smith',
                        fontWeight: FontWeight.w500,
                      ),
                      Utils.verticalSpace(5),
                      CustomText(
                        text: 'Customer',
                        fontSize: 12,
                        color: sTxtColor,
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    padding: Utils.all(value: 6),
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: CustomImage(
                      path: KImages.bubbleChat,
                      width: 24,
                      height: 24,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Utils.horizontalSpace(8),
                  Container(
                    padding: Utils.all(value: 6),
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: CustomImage(
                      path: KImages.call,
                      width: 24,
                      height: 24,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Utils.verticalSpace(12),
          CustomText(text: 'Payment Info', fontWeight: FontWeight.w500),
          Utils.verticalSpace(8),
          Row(
            children: [
              CustomText(text: 'Method: ', fontSize: 12),
              CustomText(
                text: 'Cash on Delivery',
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
          Utils.verticalSpace(8),
          Row(
            children: [
              CustomText(text: 'Status: ', fontSize: 12),
              CustomText(
                text: 'Unpaid',
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: primaryColor,
              ),
            ],
          ),
          Utils.verticalSpace(8),
          Row(
            children: [
              CustomText(text: 'Address: ', fontSize: 12),
              CustomText(
                text: 'House-12, Mirpur-10, Dhaka 1236',
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  const OrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      titleAlignment: ListTileTitleAlignment.center,
      horizontalTitleGap: 8.0,
      contentPadding: EdgeInsets.zero,
      leading: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(4),
        child: CustomImage(
          path: KImages.foodImage1,
          width: 68,
          height: 48,
          fit: BoxFit.cover,
        ),
      ),
      title: Padding(
        padding: Utils.only(bottom: 16),
        child: CustomText(text: 'Savory Meat', fontWeight: FontWeight.w500),
      ),
      subtitle: CustomText(
        text: '\$56.22',
        fontWeight: FontWeight.w500,
        color: primaryColor,
      ),
      trailing: CustomText(text: 'Q:1', fontWeight: FontWeight.w500),
    );
  }
}
