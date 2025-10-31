import 'package:flutter/material.dart';
import 'package:foodigo_delivery_man/presentation/core/routes/route_names.dart';
import 'package:foodigo_delivery_man/utils/constraints.dart';
import 'package:foodigo_delivery_man/utils/k_images.dart';
import 'package:foodigo_delivery_man/utils/utils.dart';
import 'package:foodigo_delivery_man/widget/custom_appbar.dart';
import 'package:foodigo_delivery_man/widget/custom_image.dart';
import 'package:foodigo_delivery_man/widget/custom_text_style.dart';

class KycVerificationScreen extends StatelessWidget {
  const KycVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'KYC Verification'),
      body: Padding(
        padding: Utils.symmetric(h: 24, v: 10.0),
        child: KycScreenDataLoad(),
      ),
    );
  }
}

class KycScreenDataLoad extends StatelessWidget {
  const KycScreenDataLoad({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        KycTextWidget(title: 'Company Reg. No.', subTitle: '8485214'),
        KycTextWidget(title: 'Document Type.', subTitle: 'Passport'),
        KycTextWidget(title: 'Document No.', subTitle: 'A41004511'),
        KycTextWidget(title: 'Date of Expire .', subTitle: '12/09/2031'),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(text: 'Status : '),
            Container(
              width: 84,
              height: 28,
              decoration: BoxDecoration(
                color: greenColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: CustomText(text: 'Approve', color: greenColor),
              ),
            ),
          ],
        ),
        Utils.verticalSpace(20),
        Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RouteNames.kycSubmitScreen);
                },
                child: Container(
                  height: 36,
                  decoration: BoxDecoration(
                    border: Border.all(color: sTxtColor.withOpacity(0.5)),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const CustomImage(
                          path: KImages.editIcon,
                          width: 20,
                          height: 20,
                          color: sTxtColor,
                        ),
                        Utils.horizontalSpace(12),
                        const CustomText(
                          text: 'Edit',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Utils.horizontalSpace(12),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return KycDialog();
                    },
                  );
                },
                child: Container(
                  height: 36,
                  decoration: BoxDecoration(
                    color: textColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.visibility, size: 20, color: whiteColor),
                        Utils.horizontalSpace(12),
                        CustomText(
                          text: 'View',
                          textAlign: TextAlign.center,
                          color: whiteColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class KycDialog extends StatelessWidget {
  const KycDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: Utils.all(value: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.close, color: redColor, size: 20),
              ),
            ),
            CustomImage(
              path: KImages.passport,
              width: 280,
              height: 200,
              fit: BoxFit.cover,
            ),
            Utils.verticalSpace(20),
            KycTextWidget(title: 'Company Reg. No.', subTitle: '8485214'),
            KycTextWidget(title: 'Document Type.', subTitle: 'Passport'),
            KycTextWidget(title: 'Document No.', subTitle: 'A41004511'),
            KycTextWidget(title: 'Date of Expire .', subTitle: '12/09/2031'),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(text: 'Status : '),
                Container(
                  width: 84,
                  height: 28,
                  decoration: BoxDecoration(
                    color: greenColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: CustomText(text: 'Approve', color: greenColor),
                  ),
                ),
              ],
            ),
            Utils.verticalSpace(10),
          ],
        ),
      ),
    );
  }
}

class KycTextWidget extends StatelessWidget {
  const KycTextWidget({super.key, required this.title, required this.subTitle});
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Utils.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(text: '$title :'),
          CustomText(text: subTitle, color: sTxtColor),
        ],
      ),
    );
  }
}
