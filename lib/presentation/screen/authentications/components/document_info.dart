import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:foodigo/utils/constraints.dart';
import 'package:foodigo/utils/k_images.dart';
import 'package:foodigo/utils/utils.dart';
import 'package:foodigo/widget/custom_dropdown.dart';
import 'package:foodigo/widget/custom_form.dart';
import 'package:foodigo/widget/custom_image.dart';
import 'package:foodigo/widget/custom_text_style.dart';

class DocumentInfoStep extends StatefulWidget {
  const DocumentInfoStep({super.key});

  @override
  State<DocumentInfoStep> createState() => _DocumentInfoStepState();
}

class _DocumentInfoStepState extends State<DocumentInfoStep> {
  String? selectedDocument;
  final List<String> document = ['NID', 'Passport', 'Licence'];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Utils.symmetric(h: 20, v: 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            text: 'Document Info',
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          Utils.verticalSpace(12),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: 'Document Type'),
                    Utils.verticalSpace(4),
                    CustomDropdownButton(
                      borderRadius: 6,
                      value: selectedDocument,
                      hintText: 'Select Document',
                      items: document,
                      onChanged: (value) {
                        setState(() {
                          selectedDocument = value;
                        });
                      },
                      itemBuilder: (document) => CustomText(text: document),
                    ),
                  ],
                ),
              ),
              Utils.horizontalSpace(8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomFormWidget(
                      label: 'Document Number',
                      bottomSpace: 8,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hint: CustomText(
                            text: 'Enter Number',
                            color: sTxtColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Utils.verticalSpace(8),
          CustomText(text: 'Upload (JPEG, PDF & PNG Max. Size 10MB)'),
          Utils.verticalSpace(8),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: 'Profile Photo'),
                  Utils.verticalSpace(8),
                  DottedBorder(
                    options: RectDottedBorderOptions(
                      dashPattern: [4, 10],
                      strokeWidth: 1,
                      color: Color(0xffEEEFF2),
                      padding: Utils.symmetric(h: 10.0, v: 18.0),
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
                ],
              ),
              Utils.horizontalSpace(12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: 'Documents'),
                  Utils.verticalSpace(8),
                  DottedBorder(
                    options: RectDottedBorderOptions(
                      dashPattern: [4, 10],
                      strokeWidth: 1,
                      color: Color(0xffEEEFF2),
                      padding: Utils.symmetric(h: 10.0, v: 18.0),
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
                ],
              ),
            ],
          ),
          Utils.verticalSpace(12),
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
          Utils.verticalSpace(8),
          CustomFormWidget(
            label: 'Short note',
            bottomSpace: 8,
            child: TextFormField(
              maxLines: 3,
              decoration: InputDecoration(
                hint: CustomText(text: 'Enter Note', color: sTxtColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
