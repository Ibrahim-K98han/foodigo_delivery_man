import 'package:flutter/material.dart';
import 'package:foodigo/utils/k_images.dart';
import 'package:foodigo/widget/custom_appbar.dart';
import 'package:foodigo/widget/custom_dropdown.dart';
import 'package:foodigo/widget/custom_form.dart';
import 'package:foodigo/widget/custom_image.dart';
import 'package:foodigo/widget/custom_text_style.dart';
import 'package:foodigo/widget/primary_button.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../utils/constraints.dart';
import '../../../utils/utils.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  // late GetProfileCubit pCubit;

  @override
  void initState() {
    super.initState();
    // pCubit = context.read<GetProfileCubit>();
    // pCubit.getProfileData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: const CustomAppBar(title: 'Edit Profile', visibleLeading: true),
      body: LoadProfileData(),

      // BlocConsumer<GetProfileCubit, ProfileStateModel>(
      //   listener: (context, state) {
      //     final profile = state.getProfileState;
      //     if (profile is UpdateProfileError) {
      //       if (profile.statusCode == 503) {
      //         FetchErrorText(text: profile.message);
      //       } else {
      //         Utils.errorSnackBar(context, profile.message);
      //       }
      //     }
      //     if (profile is UpdateProfileLoaded) {
      //       Utils.successSnackBar(context, 'Profile Updated Successfully');
      //     }
      //   },
      //   builder: (context, state) {
      //     final profile = state.getProfileState;
      //     if (profile is UpdateProfileLoading) {
      //       return const LoadingWidget();
      //     } else if (profile is UpdateProfileError) {
      //       if (profile.statusCode == 503 || pCubit.user != null) {
      //         return LoadProfileData(user: pCubit.user!);
      //       } else {
      //         return FetchErrorText(text: profile.message);
      //       }
      //     } else if (profile is UpdateProfileLoaded) {
      //       return LoadProfileData(user: pCubit.user!);
      //     }
      //     if (pCubit.user != null) {
      //       return LoadProfileData(user: pCubit.user!);
      //     } else {
      //       return const FetchErrorText(text: 'Something Went Wrong');
      //     }
      //   },
      // ),
    );
  }
}

class LoadProfileData extends StatefulWidget {
  const LoadProfileData({super.key});

  // final User user;

  @override
  State<LoadProfileData> createState() => _LoadProfileDataState();
}

class _LoadProfileDataState extends State<LoadProfileData> {
  String? selectedCountry;
  String? selectedCity;
  String? selectedState;
  final List<String> country = ['Bangladesh', 'Pakistan'];
  final List<String> city = ['Dhaka', 'Islamabad'];
  final List<String> state = ['A', 'B'];
  @override
  Widget build(BuildContext context) {
    // final pCubit = context.read<GetProfileCubit>();
    return Padding(
      padding: Utils.symmetric(h: 20.0),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileImage(),
              Utils.verticalSpace(20.0),

              Row(
                children: [
                  Expanded(
                    child: CustomFormWidget(
                      label: 'First Name',
                      bottomSpace: 14.0,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          fillColor: Color(0xffF8FAFC),
                          filled: true,
                          hintText: 'First Name',
                        ),
                      ),
                    ),
                  ),
                  Utils.horizontalSpace(16),
                  Expanded(
                    child: CustomFormWidget(
                      label: 'Last Name',
                      bottomSpace: 14.0,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          fillColor: Color(0xffF8FAFC),
                          filled: true,
                          hintText: 'Last Name',
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              CustomFormWidget(
                label: 'Email',
                bottomSpace: 14.0,
                child: TextFormField(
                  // initialValue: state.email,
                  // onChanged: pCubit.email,
                  decoration: const InputDecoration(
                    fillColor: Color(0xffF8FAFC),
                    filled: true,
                    hintText: 'Email',
                  ),
                ),
              ),
              CustomText(text: 'Phone Number', color: labelColor),
              Utils.verticalSpace(4),
              SizedBox(
                height: 48,
                child: InternationalPhoneNumberInput(
                  onInputChanged: (PhoneNumber number) {},
                  selectorConfig: SelectorConfig(
                    setSelectorButtonAsPrefixIcon: true,
                    leadingPadding: 20,
                    trailingSpace: false,
                    useEmoji: true,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  selectorTextStyle: TextStyle(
                    color: blackColor,
                    fontWeight: FontWeight.bold,
                  ),
                  inputDecoration: InputDecoration(
                    hintText: '707 797 0462',
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: Utils.symmetric(v: 18.0),
                  ),
                  spaceBetweenSelectorAndTextField: 8,
                ),
              ),
              Utils.verticalSpace(12),

              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(text: 'Country'),
                        Utils.verticalSpace(4),
                        CustomDropdownButton(
                          borderRadius: 6,
                          value: selectedCountry,
                          hintText: 'Select Country',
                          items: country,
                          onChanged: (value) {
                            setState(() {
                              selectedCountry = value;
                            });
                          },
                          itemBuilder: (country) => CustomText(text: country),
                        ),
                      ],
                    ),
                  ),
                  Utils.horizontalSpace(8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(text: 'City'),
                        Utils.verticalSpace(4),
                        CustomDropdownButton(
                          value: selectedCity,
                          hintText: 'Select City',
                          items: city,
                          onChanged: (value) {
                            setState(() {
                              selectedCity = value;
                            });
                          },
                          itemBuilder: (city) => CustomText(text: city),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Utils.verticalSpace(8),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(text: 'State'),
                        Utils.verticalSpace(4),
                        CustomDropdownButton(
                          borderRadius: 6,
                          value: selectedState,
                          hintText: 'Select State',
                          items: state,
                          onChanged: (value) {
                            setState(() {
                              selectedState = value;
                            });
                          },
                          itemBuilder: (state) => CustomText(text: state),
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
                          label: 'Zip Code',
                          bottomSpace: 8,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hint: CustomText(text: '9002', color: sTxtColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Utils.verticalSpace(8),
              CustomFormWidget(
                label: 'Address',
                bottomSpace: 8,
                child: TextFormField(
                  decoration: InputDecoration(
                    hint: CustomText(text: 'mirpur Dhaka', color: sTxtColor),
                  ),
                ),
              ),

              Utils.verticalSpace(30.0),

              /// Update button
              PrimaryButton(
                bgColor: dTextColor,
                textColor: whiteColor,
                text: 'Save Change',
                onPressed: () {
                  // pCubit.updateProfile();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(50),
            child: CustomImage(
              path: KImages.profile,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            right: 2.0,
            bottom: 2.0,
            child: GestureDetector(
              onTap: () async {
                // final img = await Utils.pickSingleImage();
                // if (img != null && img.isNotEmpty) {
                //   pCubit.imageChange(img);
                // }
              },
              child: const CircleAvatar(
                maxRadius: 12.0,
                backgroundColor: primaryColor,
                child: Icon(
                  Icons.camera_alt_outlined,
                  color: dTextColor,
                  size: 16.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
