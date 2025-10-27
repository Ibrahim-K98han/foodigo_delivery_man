import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:foodigo/utils/constraints.dart';
import 'package:foodigo/utils/k_images.dart';
import 'package:foodigo/utils/utils.dart';
import 'package:foodigo/widget/custom_form.dart';
import 'package:foodigo/widget/custom_image.dart';
import 'package:foodigo/widget/custom_text_style.dart';

class VehicleInfoStep extends StatefulWidget {
  const VehicleInfoStep({super.key});

  @override
  State<VehicleInfoStep> createState() => _VehicleInfoStepState();
}

class _VehicleInfoStepState extends State<VehicleInfoStep> {
  bool _rememberMe = false;
  String? selectedType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Utils.symmetric(h: 20.0, v: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            text: 'Vehicle Information',
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          Utils.verticalSpace(12),
          const CustomText(text: 'Vehicle Type', color: labelColor),
          Row(
            children: [
              Radio<String>(
                activeColor: primaryColor,
                value: 'bike',
                groupValue: selectedType,
                onChanged: (value) => setState(() => selectedType = value),
              ),
              const CustomText(text: 'Bike'),
              Radio<String>(
                activeColor: primaryColor,
                value: 'cycle',
                groupValue: selectedType,
                onChanged: (value) => setState(() => selectedType = value),
              ),
              const CustomText(text: 'Cycle'),
              Radio<String>(
                activeColor: primaryColor,
                value: 'walker',
                groupValue: selectedType,
                onChanged: (value) => setState(() => selectedType = value),
              ),
              const CustomText(text: 'Walker'),
            ],
          ),
          Utils.verticalSpace(8),
          CustomFormWidget(
            label: 'Vehicle Number',
            bottomSpace: 8,
            child: TextFormField(
              decoration: InputDecoration(
                hint: CustomText(text: 'DH 31-7530', color: sTxtColor),
              ),
            ),
          ),
          Utils.verticalSpace(8),
          CustomText(text: 'Upload (JPEG, PDF & PNG Max. Size 10MB)'),
          Utils.verticalSpace(8),
          DottedBorder(
            options: RectDottedBorderOptions(
              dashPattern: [4, 10],
              strokeWidth: 1,
              color: Color(0xffEEEFF2),
              padding: Utils.symmetric(h: 10.0, v: 28.0),
            ),
            child: Column(
              children: [
                CustomImage(path: KImages.imageAdd, width: 20, height: 20),
                Utils.verticalSpace(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(text: 'Drag & Drop or ', fontSize: 10),
                    CustomText(
                      text: 'Choose File',
                      fontSize: 10,
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
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CustomImage(path: KImages.passport, width: 50, height: 40),
            title: CustomText(text: 'Screenshot.jpg', fontSize: 12),
            subtitle: CustomText(
              text: '2.4 mb',
              fontSize: 12,
              color: sTxtColor,
            ),
            trailing: CustomImage(path: KImages.loading, width: 24, height: 24),
          ),
          _buildRemember(context),
        ],
      ),
    );
  }

  Widget _buildRemember(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          value: _rememberMe,
          activeColor: primaryColor,
          onChanged: (bool? val) {
            setState(() {
              _rememberMe = val ?? false;
            });
          },
        ),
        Expanded(
          child: Wrap(
            children: [
              CustomText(text: 'I am agree with company ', color: greyColor),
              CustomText(
                text: 'Terms  of Service & Privacy Policy.',
                decoration: TextDecoration.underline,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
