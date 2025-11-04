import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodigo/features/ForgotPassword/cubit/forgot_password_cubit.dart';
import 'package:foodigo/features/ForgotPassword/cubit/forgot_password_state.dart';
import 'package:foodigo/features/ForgotPassword/cubit/forgot_password_state_model.dart';
import 'package:foodigo/utils/constraints.dart';
import 'package:foodigo/utils/k_images.dart';
import 'package:foodigo/utils/utils.dart';
import 'package:foodigo/widget/custom_appbar.dart';
import 'package:foodigo/widget/custom_form.dart';
import 'package:foodigo/widget/custom_image.dart';
import 'package:foodigo/widget/fetch_error_text.dart';
import 'package:foodigo/widget/primary_button.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final fCubit = context.read<ForgotPasswordCubit>();
    return Scaffold(
      appBar: const CustomAppBar(title: 'Change Password'),
      body: Padding(
        padding: Utils.symmetric(h: 20.0, v: 10.0),
        child: BlocBuilder<ForgotPasswordCubit, ForgotPasswordStateModel>(
          builder: (context, state) {
            final validate = state.passwordState;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Utils.verticalSpace(20),
                const Center(
                  child: CustomImage(
                    path: KImages.changePassword,
                    width: 72,
                    height: 72,
                    fit: BoxFit.cover,
                  ),
                ),
                Utils.verticalSpace(30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomFormWidget(
                      label: 'Current Password',
                      child: TextFormField(
                        initialValue: state.currentPassword,
                        onChanged: fCubit.currentPass,
                        obscureText: state.showCurrentPassword,
                        decoration: InputDecoration(
                          hintText: '******',
                          suffixIcon: IconButton(
                            onPressed: fCubit.showCurrentPassword,
                            icon: Icon(
                              state.showCurrentPassword
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                            ),
                          ),
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                            errorText: 'Please Enter Current Password',
                          ),
                        ]),
                      ),
                    ),
                    if (validate is ForgotPasswordFormValidateError) ...[
                      if (validate.errors.currentPassword.isNotEmpty)
                        FetchErrorText(
                          text: validate.errors.currentPassword.first,
                        ),
                    ],
                  ],
                ),
                Utils.verticalSpace(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomFormWidget(
                      label: 'New Password',
                      child: TextFormField(
                        initialValue: state.password,
                        onChanged: fCubit.password,
                        obscureText: state.showPassword,
                        decoration: InputDecoration(
                          hintText: '******',
                          suffixIcon: IconButton(
                            onPressed: fCubit.showPassword,
                            icon: Icon(
                              state.showPassword
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: blackColor,
                            ),
                          ),
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                            errorText: 'Please Enter New Password',
                          ),
                        ]),
                      ),
                    ),
                    if (validate is ForgotPasswordFormValidateError) ...[
                      if (validate.errors.password.isNotEmpty)
                        FetchErrorText(text: validate.errors.password.first),
                    ],
                  ],
                ),
                Utils.verticalSpace(10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomFormWidget(
                      label: 'Confirm Password',
                      child: TextFormField(
                        initialValue: state.passwordConfirmation,
                        onChanged: fCubit.passwordConfirmation,
                        obscureText: state.showPasswordConfirmation,
                        decoration: InputDecoration(
                          hintText: '******',
                          suffixIcon: IconButton(
                            onPressed: fCubit.showPasswordConfirmation,
                            icon: Icon(
                              state.showPasswordConfirmation
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: blackColor,
                            ),
                          ),
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                            errorText: 'Please Enter Confirm Password',
                          ),
                        ]),
                      ),
                    ),
                    if (validate is ForgotPasswordFormValidateError) ...[
                      if (validate.errors.confirmPassword.isNotEmpty)
                        FetchErrorText(
                          text: validate.errors.confirmPassword.first,
                        ),
                    ],
                  ],
                ),
                Utils.verticalSpace(20),
                BlocConsumer<ForgotPasswordCubit, ForgotPasswordStateModel>(
                  listener: (context, state) {
                    final reg = state.passwordState;
                    if (reg is UpdatePasswordStateLoading) {
                      Utils.loadingDialog(context);
                    } else {
                      Utils.closeDialog(context);
                      if (reg is UpdatePasswordStateError) {
                        Utils.failureSnackBar(context, reg.message);
                      } else if (reg is UpdatePasswordStateSuccess) {
                        Utils.successSnackBar(context, reg.message);
                        Navigator.of(context).pop(true);
                      }
                    }
                  },
                  builder: (context, state) {
                    return PrimaryButton(
                      bgColor: dTextColor,
                      textColor: whiteColor,
                      minimumSize: const Size(double.infinity, 44),
                      text: 'Create Password',
                      onPressed: () {
                        fCubit.changePassword();
                        // fCubit.clear();
                      },
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
