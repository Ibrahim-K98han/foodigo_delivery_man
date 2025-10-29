import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodigo/features/register/cubit/register_cubit.dart';
import 'package:foodigo/features/register/cubit/register_state.dart';
import 'package:foodigo/features/register/model/register_state_model.dart';
import 'package:foodigo/utils/constraints.dart';
import 'package:foodigo/utils/k_images.dart';
import 'package:foodigo/utils/utils.dart';
import 'package:foodigo/widget/custom_dropdown.dart';
import 'package:foodigo/widget/custom_form.dart';
import 'package:foodigo/widget/custom_image.dart';
import 'package:foodigo/widget/custom_text_style.dart';
import 'package:foodigo/widget/fetch_error_text.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:image_picker/image_picker.dart';

class DocumentInfoStep extends StatefulWidget {
  const DocumentInfoStep({super.key});

  @override
  State<DocumentInfoStep> createState() => _DocumentInfoStepState();
}

class _DocumentInfoStepState extends State<DocumentInfoStep> {
  late RegisterCubit rCubit;
  String? selectedDocument;
  final List<String> document = ['NID', 'Passport', 'Licence'];
  @override
  void initState() {
    super.initState();
    rCubit = context.read<RegisterCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Utils.symmetric(h: 20, v: 0.0),
      child: BlocBuilder<RegisterCubit, RegisterStateModel>(
        builder: (context, state) {
          final validate = state.registerState;
          return Column(
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
                        const CustomText(text: 'Document Type'),
                        Utils.verticalSpace(4),
                        CustomDropdownButton(
                          borderRadius: 6,
                          value: selectedDocument,
                          hintText: 'Select Document',
                          items: document,
                          onChanged: (value) {
                            rCubit.changeDocumentType(value!);
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
                            initialValue: state.documentNumber,
                            onChanged: rCubit.changeDocumentNumber,
                            decoration: const InputDecoration(
                              hint: CustomText(
                                text: 'Enter Number',
                                color: sTxtColor,
                              ),
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                errorText: 'Please Enter Document Number',
                              ),
                            ]),
                          ),
                        ),
                        if (validate is RegisterValidateStateError) ...[
                          if (validate.errors.zipCode.isNotEmpty)
                            FetchErrorText(text: validate.errors.zipCode.first),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
              Utils.verticalSpace(12),
              const CustomText(text: 'Upload (JPEG, PDF & PNG Max. Size 10MB)'),
              Utils.verticalSpace(16),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText(text: 'Profile Photo'),
                      Utils.verticalSpace(8),
                      DottedBorder(
                        options: RectDottedBorderOptions(
                          dashPattern: [4, 10],
                          strokeWidth: 1,
                          color: const Color(0xffEEEFF2),
                          padding: Utils.symmetric(h: 10.0, v: 18.0),
                        ),
                        child: Column(
                          children: [
                            const CustomImage(
                              path: KImages.imageAdd,
                              width: 20,
                              height: 20,
                            ),
                            Utils.verticalSpace(8),
                            GestureDetector(
                              onTap: () async {
                                final pickedFile = await ImagePicker()
                                    .pickImage(source: ImageSource.gallery);
                                if (pickedFile != null) {
                                  rCubit.changeProfilImg(pickedFile.path);
                                }
                              },
                              child: const Row(
                                children: [
                                  CustomText(
                                    text: 'Drag & Drop or ',
                                    fontSize: 10,
                                  ),
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
                      const CustomText(text: 'Documents'),
                      Utils.verticalSpace(8),
                      DottedBorder(
                        options: RectDottedBorderOptions(
                          dashPattern: [4, 10],
                          strokeWidth: 1,
                          color: const Color(0xffEEEFF2),
                          padding: Utils.symmetric(h: 10.0, v: 18.0),
                        ),
                        child: Column(
                          children: [
                            const CustomImage(
                              path: KImages.imageAdd,
                              width: 20,
                              height: 20,
                            ),
                            Utils.verticalSpace(8),
                            GestureDetector(
                              onTap: () async {
                                final pickedFile = await ImagePicker()
                                    .pickImage(source: ImageSource.gallery);
                                if (pickedFile != null) {
                                  rCubit.changeDocumentImg(pickedFile.path);
                                }
                              },
                              child: const Row(
                                children: [
                                  CustomText(
                                    text: 'Drag & Drop or ',
                                    fontSize: 10,
                                  ),
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
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Utils.verticalSpace(12),
              const ListTile(
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
              Utils.verticalSpace(8),
              CustomFormWidget(
                label: 'Short note',
                bottomSpace: 8,
                child: TextFormField(
                  initialValue: state.shortNote,
                  onChanged: rCubit.changeShortNote,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    hint: CustomText(text: 'Enter Note', color: sTxtColor),
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                      errorText: 'Please Enter Note',
                    ),
                  ]),
                ),
              ),
              if (validate is RegisterValidateStateError) ...[
                if (validate.errors.name.isNotEmpty)
                  FetchErrorText(text: validate.errors.name.first),
              ],
            ],
          );
        },
      ),
    );
  }
}
