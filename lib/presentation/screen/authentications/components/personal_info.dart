import 'package:flutter/material.dart';
import 'package:foodigo_delivery_man/utils/constraints.dart';
import 'package:foodigo_delivery_man/utils/utils.dart';
import 'package:foodigo_delivery_man/widget/custom_dropdown.dart';
import 'package:foodigo_delivery_man/widget/custom_form.dart';
import 'package:foodigo_delivery_man/widget/custom_text_style.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PersonalInfoStep extends StatefulWidget {
  const PersonalInfoStep({super.key});

  @override
  State<PersonalInfoStep> createState() => _PersonalInfoStepState();
}

class _PersonalInfoStepState extends State<PersonalInfoStep> {
  String? selectedGender;
  String? selectedCountry;
  String? selectedCity;
  String? selectedState;
  final List<String> country = ['Bangladesh', 'Pakistan'];
  final List<String> city = ['Dhaka', 'Islamabad'];
  final List<String> state = ['A', 'B'];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Utils.symmetric(h: 20.0, v: 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomText(
            text: 'Personal Info',
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          Utils.verticalSpace(12),

          CustomFormWidget(
            label: 'Full Name',
            bottomSpace: 8,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'onam sorker'
              ),
            ),
          ),
          const CustomText(text: 'Gender', color: labelColor),
          Row(
            children: [
              Radio<String>(
                activeColor: primaryColor,
                value: 'male',
                groupValue: selectedGender,
                onChanged: (value) => setState(() => selectedGender = value),
              ),
              const CustomText(text: 'Male'),
              Radio<String>(
                value: 'female',
                groupValue: selectedGender,
                onChanged: (value) => setState(() => selectedGender = value),
              ),
              const CustomText(text: 'Female'),
              Radio<String>(
                value: 'other',
                groupValue: selectedGender,
                onChanged: (value) => setState(() => selectedGender = value),
              ),
              const CustomText(text: 'Other'),
            ],
          ),
          CustomText(text: 'Phone', color: labelColor),
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
          Utils.verticalSpace(8),
          CustomFormWidget(
            label: 'Email',
            bottomSpace: 8,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'example@gmail.com'
              ),
            ),
          ),
          CustomFormWidget(
            label: 'Date Of Birth',
            bottomSpace: 8,
            child: TextFormField(
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.date_range, color: sTxtColor),
               hintText: 'Date'
              ),
            ),
          ),

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
                      borderRadius: 6,
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
                         hintText: '9002'
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
                hintText: 'mirpur Dhaka'
              ),
            ),
          ),
          Utils.verticalSpace(8),
        ],
      ),
    );
  }
}


