import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodigo/features/CityDocumentVehicle/cubit/city_document_vehicle_cubit.dart';
import 'package:foodigo/features/GetProfile/cubit/get_profile_cubit.dart';
import 'package:foodigo/features/GetProfile/cubit/get_profile_state.dart';
import 'package:foodigo/features/GetProfile/model/profile_state_model.dart';
import 'package:foodigo/features/Login/model/user_response_model.dart';
import 'package:foodigo/presentation/screen/profile/component/profile_image.dart';
import 'package:foodigo/widget/custom_appbar.dart';
import 'package:foodigo/widget/custom_form.dart';
import 'package:foodigo/widget/custom_text_style.dart';
import 'package:foodigo/widget/fetch_error_text.dart';
import 'package:foodigo/widget/loading_widget.dart';
import 'package:foodigo/widget/primary_button.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../utils/constraints.dart';
import '../../../utils/utils.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String? selectedCity;
  late GetProfileCubit pCubit;
  late CityDocumentVehicleCubit cCubit;

  @override
  void initState() {
    super.initState();
    pCubit = context.read<GetProfileCubit>();
    cCubit = context.read<CityDocumentVehicleCubit>();
    pCubit.getProfileData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: const CustomAppBar(title: 'Edit Profile', visibleLeading: true),
      body: BlocConsumer<GetProfileCubit, ProfileStateModel>(
        listener: (context, state) {
          final profile = state.getProfileState;
          if (profile is UpdateProfileError) {
            if (profile.statusCode == 503) {
              FetchErrorText(text: profile.message);
            } else {
              Utils.errorSnackBar(context, profile.message);
            }
          }
          if (profile is UpdateProfileLoaded) {
            Utils.successSnackBar(context, 'Deliveryman updated successfully');
          }
        },
        builder: (context, state) {
          final profile = state.getProfileState;
          if (profile is UpdateProfileLoading) {
            return const LoadingWidget();
          } else if (profile is UpdateProfileError) {
            if (profile.statusCode == 503 || pCubit.user != null) {
              return LoadProfileData(user: pCubit.user!);
            } else {
              return FetchErrorText(text: profile.message);
            }
          } else if (profile is UpdateProfileLoaded) {
            return LoadProfileData(user: pCubit.user!);
          }
          if (pCubit.user != null) {
            return LoadProfileData(user: pCubit.user!);
          } else {
            return const FetchErrorText(text: 'Something Went Wrong');
          }
        },
      ),
    );
  }
}

class LoadProfileData extends StatelessWidget {
  const LoadProfileData({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    final pCubit = context.read<GetProfileCubit>();

    return Padding(
      padding: Utils.symmetric(h: 20.0),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(child: ProfileImage()),
              Utils.verticalSpace(40.0),
              Row(
                children: [
                  Expanded(
                    child: BlocBuilder<GetProfileCubit, ProfileStateModel>(
                      builder: (context, state) {
                        final validate = state.getProfileState;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomFormWidget(
                              label: 'First Name',
                              bottomSpace: 14.0,
                              child: TextFormField(
                                initialValue: state.name,
                                onChanged: pCubit.name,
                                decoration: const InputDecoration(
                                  fillColor: Color(0xffF8FAFC),
                                  filled: true,
                                  hintText: 'First Name',
                                ),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                    errorText: 'Please enter first name',
                                  ),
                                ]),
                              ),
                            ),
                            if (validate is UpdateProfileStateFormValidate) ...[
                              if (validate.errors.name.isNotEmpty)
                                FetchErrorText(
                                  text: validate.errors.name.first,
                                ),
                            ],
                          ],
                        );
                      },
                    ),
                  ),
                  Utils.horizontalSpace(16),
                  Expanded(
                    child: BlocBuilder<GetProfileCubit, ProfileStateModel>(
                      builder: (context, state) {
                        final validate = state.getProfileState;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomFormWidget(
                              label: 'Last Name',
                              bottomSpace: 14.0,
                              child: TextFormField(
                                initialValue: state.lastName,
                                onChanged: pCubit.lname,
                                decoration: const InputDecoration(
                                  fillColor: Color(0xffF8FAFC),
                                  filled: true,
                                  hintText: 'Last Name',
                                ),
                                validator: FormBuilderValidators.compose([
                                  FormBuilderValidators.required(
                                    errorText: 'Please enter last name',
                                  ),
                                ]),
                              ),
                            ),
                            if (validate is UpdateProfileStateFormValidate) ...[
                              if (validate.errors.lname.isNotEmpty)
                                FetchErrorText(
                                  text: validate.errors.lname.first,
                                ),
                            ],
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),

              const CustomText(text: 'Man Type', color: labelColor),
              BlocBuilder<GetProfileCubit, ProfileStateModel>(
                builder: (context, state) {
                  return Row(
                    children: [
                      Radio<String>(
                        activeColor: primaryColor,
                        value: 'male',
                        groupValue: state.manType,
                        onChanged: (value) {
                          pCubit.changeManType(value!);
                          print(value);
                        },
                      ),
                      const CustomText(text: 'Male'),
                      Radio<String>(
                        activeColor: primaryColor,
                        value: 'female',
                        groupValue: state.manType,
                        onChanged: (value) {
                          pCubit.changeManType(value!);
                          print(value);
                        },
                      ),
                      const CustomText(text: 'Female'),
                      Radio<String>(
                        activeColor: primaryColor,
                        value: 'other',
                        groupValue: state.manType,
                        onChanged: (value) {
                          pCubit.changeManType(value!);
                          print(value);
                        },
                      ),
                      const CustomText(text: 'Other'),
                    ],
                  );
                },
              ),

              BlocBuilder<GetProfileCubit, ProfileStateModel>(
                builder: (context, state) {
                  final validate = state.getProfileState;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomFormWidget(
                        label: 'Email',
                        bottomSpace: 14.0,
                        child: TextFormField(
                          readOnly: true,
                          initialValue: state.email,
                          onChanged: pCubit.email,
                          decoration: const InputDecoration(
                            fillColor: Color(0xffF8FAFC),
                            filled: true,
                            hintText: 'Email',
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                              errorText: 'Please enter Email',
                            ),
                          ]),
                        ),
                      ),
                      if (validate is UpdateProfileStateFormValidate) ...[
                        if (validate.errors.email.isNotEmpty)
                          FetchErrorText(text: validate.errors.email.first),
                      ],
                    ],
                  );
                },
              ),
              BlocBuilder<GetProfileCubit, ProfileStateModel>(
                builder: (context, state) {
                  final validate = state.getProfileState;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomFormWidget(
                        label: 'Phone',
                        bottomSpace: 14.0,
                        child: TextFormField(
                          initialValue: state.phone,
                          onChanged: pCubit.phone,
                          decoration: const InputDecoration(
                            fillColor: Color(0xffF8FAFC),
                            filled: true,
                            hintText: 'phone',
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                              errorText: 'Please enter Phone number',
                            ),
                          ]),
                        ),
                      ),
                      if (validate is UpdateProfileStateFormValidate) ...[
                        if (validate.errors.phone.isNotEmpty)
                          FetchErrorText(text: validate.errors.phone.first),
                      ],
                    ],
                  );
                },
              ),
              Utils.verticalSpace(12),

              // Row(
              //   children: [
              //     Expanded(
              //       child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           const CustomText(text: 'City'),
              //           Utils.verticalSpace(4),
              //           BlocBuilder<
              //             CityDocumentVehicleCubit,
              //             CityDocumentVehicleState
              //           >(
              //             builder: (context, cityState) {
              //               final cities =
              //                   cCubit.cityDocumentVehicleModel?.cities;

              //               return BlocBuilder<GetProfileCubit, User>(
              //                 builder: (context, userState) {
              //                   return DropdownButtonFormField<String>(
              //                     decoration: InputDecoration(
              //                       hintText: 'Select City',
              //                       border: OutlineInputBorder(
              //                         borderRadius: BorderRadius.circular(6),
              //                       ),
              //                       contentPadding: Utils.symmetric(
              //                         h: 12.0,
              //                         v: 12.0,
              //                       ),
              //                     ),
              //                     value: userState.cityId.toString(),
              //                     items:
              //                         cities?.map((city) {
              //                           return DropdownMenuItem<String>(
              //                             value: city.id.toString(),
              //                             child: CustomText(text: city.name),
              //                           );
              //                         }).toList(),
              //                     onChanged: (value) {
              //                       pCubit.city(value!);
              //                       print('Selected City ID: $value');
              //                     },
              //                   );
              //                 },
              //               );
              //             },
              //           ),
              //         ],
              //       ),
              //     ),

              //     Utils.horizontalSpace(8),
              //     Expanded(
              //       child: BlocBuilder<GetProfileCubit, User>(
              //         builder: (context, state) {
              //           final validate = state.getProfileState;
              //           return Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               CustomFormWidget(
              //                 label: 'Zip Code',
              //                 bottomSpace: 0,
              //                 child: TextFormField(
              //                   initialValue: state.zipCode,
              //                   onChanged: pCubit.zip,
              //                   decoration: const InputDecoration(
              //                     hint: CustomText(
              //                       text: '9002',
              //                       color: sTxtColor,
              //                     ),
              //                   ),
              //                   validator: FormBuilderValidators.compose([
              //                     FormBuilderValidators.required(
              //                       errorText: 'Please enter Zip Code',
              //                     ),
              //                   ]),
              //                 ),
              //               ),
              //               if (validate is UpdateProfileStateFormValidate) ...[
              //                 if (validate.errors.zipCode.isNotEmpty)
              //                   FetchErrorText(
              //                     text: validate.errors.zipCode.first,
              //                   ),
              //               ],
              //             ],
              //           );
              //         },
              //       ),
              //     ),
              //   ],
              // ),
              // Utils.verticalSpace(12),
              // BlocBuilder<GetProfileCubit, User>(
              //   builder: (context, state) {
              //     final validate = state.getProfileState;
              //     return Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         CustomFormWidget(
              //           label: 'Address',
              //           bottomSpace: 8,
              //           child: TextFormField(
              //             initialValue: state.address,
              //             onChanged: pCubit.address,
              //             decoration: const InputDecoration(
              //               hint: CustomText(
              //                 text: 'mirpur Dhaka',
              //                 color: sTxtColor,
              //               ),
              //             ),
              //             validator: FormBuilderValidators.compose([
              //               FormBuilderValidators.required(
              //                 errorText: 'Please enter Address',
              //               ),
              //             ]),
              //           ),
              //         ),
              //         if (validate is UpdateProfileStateFormValidate) ...[
              //           if (validate.errors.address.isNotEmpty)
              //             FetchErrorText(text: validate.errors.address.first),
              //         ],
              //       ],
              //     );
              //   },
              // ),
              Utils.verticalSpace(30.0),

              /// Update button
              PrimaryButton(
                bgColor: dTextColor,
                textColor: whiteColor,
                text: 'Save Change',
                onPressed: () {
                  pCubit.updateProfile();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
