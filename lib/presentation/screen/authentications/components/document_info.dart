import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodigo/features/CityDocumentVehicle/cubit/city_document_vehicle_cubit.dart';
import 'package:foodigo/features/CityDocumentVehicle/cubit/city_document_vehicle_state.dart';
import 'package:foodigo/features/register/cubit/register_cubit.dart';
import 'package:foodigo/features/register/cubit/register_state.dart';
import 'package:foodigo/features/register/model/register_state_model.dart';
import 'package:foodigo/utils/constraints.dart';
import 'package:foodigo/utils/k_images.dart';
import 'package:foodigo/utils/utils.dart';
import 'package:foodigo/widget/custom_form.dart';
import 'package:foodigo/widget/custom_image.dart';
import 'package:foodigo/widget/custom_text_style.dart';
import 'package:foodigo/widget/fetch_error_text.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class DocumentInfoStep extends StatefulWidget {
  const DocumentInfoStep({super.key});

  @override
  State<DocumentInfoStep> createState() => _DocumentInfoStepState();
}

class _DocumentInfoStepState extends State<DocumentInfoStep> {
  late RegisterCubit rCubit;
  late CityDocumentVehicleCubit cCubit;
  String? selectedDocument;
  @override
  void initState() {
    super.initState();
    rCubit = context.read<RegisterCubit>();
    cCubit = context.read<CityDocumentVehicleCubit>();
    cCubit.getCityDocumentVehicleData();
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
                  // Expanded(
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       const CustomText(text: 'Document Type'),
                  //       Utils.verticalSpace(4),
                  //       CustomDropdownButton(
                  //         borderRadius: 6,
                  //         value: selectedDocument,
                  //         hintText: 'Select Document',
                  //         items: document,
                  //         onChanged: (value) {
                  //           rCubit.changeDocumentType(value!);
                  //         },
                  //         itemBuilder: (document) => CustomText(text: document),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomText(text: 'Document Type'),
                        Utils.verticalSpace(4),
                        BlocBuilder<
                          CityDocumentVehicleCubit,
                          CityDocumentVehicleState
                        >(
                          builder: (context, state) {
                            final document =
                                cCubit.cityDocumentVehicleModel!.documentTypes;

                            return DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                hintText: 'Select Document',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                contentPadding: Utils.symmetric(
                                  h: 6.0,
                                  v: 12.0,
                                ),
                              ),
                              value: selectedDocument,
                              items:
                                  document!.map((doc) {
                                    return DropdownMenuItem<String>(
                                      value: doc.id.toString(),
                                      child: CustomText(text: doc.name),
                                    );
                                  }).toList(),
                              onChanged: (value) {
                                rCubit.changeDocumentType(value!);
                                print('Selected Document ID: $value');
                              },
                            );
                          },
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
                              hintText: 'Enter Number',
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText(text: 'Profile Photo'),
                      Utils.verticalSpace(8),
                      SizedBox(
                        width: 158,
                        child: DottedBorder(
                          options: RectDottedBorderOptions(
                            dashPattern: [4, 10],
                            strokeWidth: 2,
                            color: const Color(0xffEEEFF2),
                            padding: Utils.symmetric(h: 10.0, v: 18.0),
                          ),
                          child: Center(
                            child: Column(
                              children: [
                                if (rCubit.proImg != null &&
                                    rCubit.proImg!.isNotEmpty)
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.file(
                                      File(rCubit.proImg!),
                                      width: 158,
                                      height: 80,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                else ...[
                                  const CustomImage(
                                    path: KImages.imageAdd,
                                    width: 20,
                                    height: 20,
                                  ),
                                  Utils.verticalSpace(8),
                                  GestureDetector(
                                    onTap: () async {
                                      // final pickedFile = await ImagePicker()
                                      //     .pickImage(source: ImageSource.gallery);
                                      // if (pickedFile != null) {
                                      //   rCubit.changeProfilImg(pickedFile.path);
                                      // }
                                      final img = await Utils.pickSingleImage();
                                      if (img != null && img.isNotEmpty) {
                                        rCubit.changeProfilImg(img);
                                      }
                                    },
                                    child: const CustomText(
                                      text: 'Choose File',
                                      fontSize: 10,
                                      color: blueColor,
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.underline,
                                      dColor: blueColor,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
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
                      SizedBox(
                        width: 158,
                        child: DottedBorder(
                          options: RectDottedBorderOptions(
                            dashPattern: [4, 10],
                            strokeWidth: 1,
                            color: const Color(0xffEEEFF2),
                            padding: Utils.symmetric(h: 10.0, v: 18.0),
                          ),
                          child: Center(
                            child: Column(
                              children: [
                                if (rCubit.documentImg != null &&
                                    rCubit.documentImg!.isNotEmpty)
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.file(
                                      File(rCubit.documentImg!),
                                      width: 158,
                                      height: 80,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                else ...[
                                  const CustomImage(
                                    path: KImages.imageAdd,
                                    width: 20,
                                    height: 20,
                                  ),

                                  Utils.verticalSpace(8),
                                  GestureDetector(
                                    onTap: () async {
                                      final img = await Utils.pickSingleImage();
                                      if (img != null && img.isNotEmpty) {
                                        rCubit.changeDocumentImg(img);
                                      }
                                    },
                                    child: const CustomText(
                                      text: 'Choose File',
                                      fontSize: 10,
                                      color: blueColor,
                                      fontWeight: FontWeight.w500,
                                      decoration: TextDecoration.underline,
                                      dColor: blueColor,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Utils.verticalSpace(12),
              // const ListTile(
              //   contentPadding: EdgeInsets.zero,
              //   leading: CustomImage(
              //     path: KImages.passport,
              //     width: 50,
              //     height: 40,
              //   ),
              //   title: CustomText(text: 'Screenshot.jpg', fontSize: 12),
              //   subtitle: CustomText(
              //     text: '2.4 mb',
              //     fontSize: 12,
              //     color: sTxtColor,
              //   ),
              //   trailing: CustomImage(
              //     path: KImages.loading,
              //     width: 24,
              //     height: 24,
              //   ),
              // ),
              Utils.verticalSpace(8),
              CustomFormWidget(
                label: 'Short note',
                bottomSpace: 8,
                child: TextFormField(
                  initialValue: state.shortNote,
                  onChanged: rCubit.changeShortNote,
                  maxLines: 3,
                  decoration: const InputDecoration(hintText: 'Enter Note'),
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
