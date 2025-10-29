import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodigo/features/register/cubit/register_cubit.dart';
import 'package:foodigo/features/register/cubit/register_state.dart';
import 'package:foodigo/features/register/model/register_state_model.dart';
import 'package:foodigo/utils/constraints.dart';
import 'package:foodigo/utils/utils.dart';
import 'package:foodigo/widget/custom_dropdown.dart';
import 'package:foodigo/widget/custom_form.dart';
import 'package:foodigo/widget/custom_text_style.dart';
import 'package:foodigo/widget/fetch_error_text.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PersonalInfoStep extends StatefulWidget {
  const PersonalInfoStep({super.key});

  @override
  State<PersonalInfoStep> createState() => _PersonalInfoStepState();
}

class _PersonalInfoStepState extends State<PersonalInfoStep> {
  late RegisterCubit rCubit;
  String? selectedGender;
  String? selectedCity;
  final List<String> city = ['1', '2'];

  @override
  void initState() {
    super.initState();
    rCubit = context.read<RegisterCubit>();
    // rCubit.getCityData();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Utils.symmetric(h: 20.0, v: 0.0),
      child: BlocBuilder<RegisterCubit, RegisterStateModel>(
        builder: (context, state) {
          final validate = state.registerState;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                text: 'Personal Info',
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
                        CustomFormWidget(
                          label: 'First Name',
                          bottomSpace: 8,
                          child: TextFormField(
                            initialValue: state.fname,
                            onChanged: rCubit.changeFName,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              hint: CustomText(text: 'onam', color: sTxtColor),
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                errorText: 'Please First Name',
                              ),
                            ]),
                          ),
                        ),
                        if (validate is RegisterValidateStateError) ...[
                          if (validate.errors.name.isNotEmpty)
                            FetchErrorText(text: validate.errors.name.first),
                        ],
                      ],
                    ),
                  ),
                  Utils.horizontalSpace(10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomFormWidget(
                          label: 'Last Name',
                          bottomSpace: 8,
                          child: TextFormField(
                            initialValue: state.lname,
                            onChanged: rCubit.changeLName,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              hint: CustomText(
                                text: 'sorker',
                                color: sTxtColor,
                              ),
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                errorText: 'Please Last Name',
                              ),
                            ]),
                          ),
                        ),
                        if (validate is RegisterValidateStateError) ...[
                          if (validate.errors.lname.isNotEmpty)
                            FetchErrorText(text: validate.errors.lname.first),
                        ],
                      ],
                    ),
                  ),
                ],
              ),
              const CustomText(text: 'Gender', color: labelColor),
              Row(
                children: [
                  Radio<String>(
                    activeColor: primaryColor,
                    value: 'male',
                    groupValue: state.gender,
                    onChanged: (value) {
                      rCubit.changeGender(value!);
                      print(value);
                    },
                  ),
                  const CustomText(text: 'Male'),
                  Radio<String>(
                    activeColor: primaryColor,
                    value: 'female',
                    groupValue: state.gender,
                    onChanged: (value) {
                      rCubit.changeGender(value!);
                      print(value);
                    },
                  ),
                  const CustomText(text: 'Female'),
                  Radio<String>(
                    activeColor: primaryColor,
                    value: 'ohter',
                    groupValue: state.gender,
                    onChanged: (value) {
                      rCubit.changeGender(value!);
                      print(value);
                    },
                  ),
                  const CustomText(text: 'Other'),
                ],
              ),

              const CustomText(text: 'Phone', color: labelColor),
              Utils.verticalSpace(4),
              SizedBox(
                height: 48,
                child: InternationalPhoneNumberInput(
                  onInputChanged: (PhoneNumber number) {
                    rCubit.changeCountryCode(number.dialCode ?? '');
                    rCubit.changePhone(number.phoneNumber ?? '');
                    print('dialcode ${number.dialCode}');
                    print('dialcode ${number.phoneNumber}');
                  },

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

              Utils.verticalSpace(8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomFormWidget(
                    label: 'Email',
                    bottomSpace: 8,
                    child: TextFormField(
                      initialValue: state.email,
                      onChanged: rCubit.changeEmail,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        hint: CustomText(
                          text: 'example@gmail.com',
                          color: sTxtColor,
                        ),
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                          errorText: 'Please Enter Email',
                        ),
                      ]),
                    ),
                  ),
                  if (validate is RegisterValidateStateError) ...[
                    if (validate.errors.email.isNotEmpty)
                      FetchErrorText(text: validate.errors.email.first),
                  ],
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomFormWidget(
                    label: 'Date Of Birth',
                    bottomSpace: 8,
                    child: TextFormField(
                      readOnly: true,
                      initialValue: state.dateOfBirth,
                      onChanged: rCubit.changeDateOfBirth,
                      key: ValueKey(state.dateOfBirth),

                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () async {
                            final DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime.now(),
                            );
                            if (picked != null) {
                              final formattedDate =
                                  "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
                              rCubit.changeDateOfBirth(formattedDate);
                              print(formattedDate);
                            }
                          },
                          child: Icon(Icons.date_range, color: sTxtColor),
                        ),
                        hint: CustomText(text: 'Date', color: sTxtColor),
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomText(text: 'City'),
                        Utils.verticalSpace(4),
                        CustomDropdownButton(
                          borderRadius: 6,
                          value: selectedCity,
                          hintText: 'Select City',
                          items: city,
                          onChanged: (value) {
                            rCubit.changeCity(value!);
                            print(value);
                          },
                          itemBuilder: (city) => CustomText(text: city),
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
                            initialValue: state.zipCode,
                            onChanged: rCubit.changeZipCode,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              hint: CustomText(text: '9005', color: sTxtColor),
                            ),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                errorText: 'Please Enter Zip Code',
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
              Utils.verticalSpace(8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomFormWidget(
                    label: 'Address',
                    bottomSpace: 8,
                    child: TextFormField(
                      initialValue: state.address,
                      onChanged: rCubit.changeAddress,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        hint: CustomText(
                          text: 'mirpur Dhaka',
                          color: sTxtColor,
                        ),
                      ),
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                          errorText: 'Please Enter Address',
                        ),
                      ]),
                    ),
                  ),
                  if (validate is RegisterValidateStateError) ...[
                    if (validate.errors.address.isNotEmpty)
                      FetchErrorText(text: validate.errors.address.first),
                  ],
                ],
              ),
              Utils.verticalSpace(8),
            ],
          );
        },
      ),
    );
  }
}
