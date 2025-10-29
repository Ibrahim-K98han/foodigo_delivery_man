import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:foodigo/utils/constraints.dart';
import 'package:foodigo/utils/k_images.dart';
import 'package:foodigo/utils/utils.dart';
import 'package:foodigo/widget/custom_appbar.dart';
import 'package:foodigo/widget/custom_dropdown.dart';
import 'package:foodigo/widget/custom_form.dart';
import 'package:foodigo/widget/custom_image.dart';
import 'package:foodigo/widget/custom_text_style.dart';
import 'package:foodigo/widget/primary_button.dart';

class KycSubmitScreen extends StatefulWidget {
  const KycSubmitScreen({super.key});

  @override
  State<KycSubmitScreen> createState() => _KycSubmitScreenState();
}

class _KycSubmitScreenState extends State<KycSubmitScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'KYC Verification'),
      body: KycDataLoaded(),
    );
  }
}

class KycDataLoaded extends StatefulWidget {
  const KycDataLoaded({super.key});

  @override
  State<KycDataLoaded> createState() => _KycDataLoadedState();
}

class _KycDataLoadedState extends State<KycDataLoaded> {
  String? selectedDocumentType;
  final List<String> documentType = ['NID', 'Passport', 'Licence'];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Utils.symmetric(h: 20.0, v: 10.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: Utils.symmetric(h: 12.0, v: 10.0),
              decoration: BoxDecoration(color: dialogBgColor),
              child: Center(
                child: CustomText(
                  text: 'Documents Attachment',
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Utils.verticalSpace(20),
            CustomFormWidget(
              label: 'Company Reg. No.',
              bottomSpace: 8,
              child: TextFormField(
                decoration: InputDecoration(
                  hint: CustomText(text: 'Enter number', color: sTxtColor),
                ),
              ),
            ),
            Utils.verticalSpace(12),
            CustomText(text: 'Documents Type '),
            Utils.verticalSpace(4),
            CustomDropdownButton(
              borderRadius: 6,
              value: selectedDocumentType,
              hintText: 'Select Documents Type ',
              items: documentType,
              onChanged: (value) {
                setState(() {
                  selectedDocumentType = value;
                });
              },
              itemBuilder: (type) => CustomText(text: type),
            ),
            Utils.verticalSpace(12),
            CustomFormWidget(
              label: 'Description',
              bottomSpace: 8,
              child: TextFormField(
                maxLines: 2,
                decoration: InputDecoration(
                  hint: CustomText(text: 'Enter Description', color: sTxtColor),
                ),
              ),
            ),
            Utils.verticalSpace(12),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: 'Documents File( Max. Size 4MB)'),
                Utils.verticalSpace(8),
                DottedBorder(
                  options: RectDottedBorderOptions(
                    dashPattern: [4, 10],
                    strokeWidth: 2,
                    color: Color(0xffEEEFF2),
                    padding: Utils.symmetric(h: 10.0, v: 40.0),
                  ),
                  child: Column(
                    children: [
                      CustomImage(
                        path: KImages.imageAdd,
                        width: 20,
                        height: 20,
                      ),
                      Utils.verticalSpace(8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(text: 'Drag & Drop or '),
                          CustomText(
                            text: 'Choose File',
                            color: blueColor,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                            dColor: blueColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Utils.verticalSpace(8),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CustomImage(
                path: KImages.passport,
                width: 50,
                height: 40,
              ),
              title: CustomText(text: 'Screenshot.jpg', fontSize: 12),
              subtitle: CustomText(
                text: '2.4 mb',
                fontSize: 12,
                color: sTxtColor,
              ),
              trailing: CustomImage(
                path: KImages.loading,
                width: 24,
                height: 24,
              ),
            ),
            Utils.verticalSpace(12),
            CustomFormWidget(
              label: 'Documents No.',
              bottomSpace: 8,
              child: TextFormField(
                decoration: InputDecoration(
                  hint: CustomText(text: '452552 002', color: sTxtColor),
                ),
              ),
            ),
            Utils.verticalSpace(12),
            CustomFormWidget(
              label: 'Date of Expire ',
              bottomSpace: 8,
              child: TextFormField(
                decoration: InputDecoration(
                  hint: CustomText(text: 'Date of Expire', color: sTxtColor),
                ),
              ),
            ),
            Utils.verticalSpace(24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    width: 153,
                    height: 44,
                    decoration: BoxDecoration(
                      border: Border.all(color: redColor),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: CustomText(
                        text: 'Cancel',
                        color: redColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Utils.horizontalSpace(20),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return KycSubmitDialog();
                        },
                      );
                    },
                    child: Container(
                      width: 153,
                      height: 44,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: CustomText(text: 'Submit', fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Utils.verticalSpace(12),
          ],
        ),
      ),
    );
  }
}

class KycSubmitDialog extends StatelessWidget {
  const KycSubmitDialog({super.key});

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
              path: KImages.kycSubmit,
              width: 96,
              height: 96,
              fit: BoxFit.cover,
            ),
            Utils.verticalSpace(20),
            CustomText(
              textAlign: TextAlign.center,
              height: 1.24,
              text: 'Successfully Submit KYC Documents',
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
            Utils.verticalSpace(20),
            PrimaryButton(
              bgColor: dTextColor,
              textColor: whiteColor,
              minimumSize: Size(double.infinity, 44),
              text: 'That\'s Nice',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Utils.verticalSpace(10),
          ],
        ),
      ),
    );
  }
}
