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
            final change = state.passwordState;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Utils.verticalSpace(20),
                const CustomImage(
                  path: KImages.changePassword,
                  width: 72,
                  height: 72,
                  fit: BoxFit.cover,
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
                      ),
                    ),
                    if (change is ForgotPasswordFormValidateError) ...[
                      if (change.errors.currentPassword.isNotEmpty)
                        FetchErrorText(
                          text: change.errors.currentPassword.first,
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
                      ),
                    ),
                    if (change is ForgotPasswordFormValidateError) ...[
                      if (change.errors.password.isNotEmpty)
                        FetchErrorText(text: change.errors.password.first),
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
                      ),
                    ),
                    if (change is ForgotPasswordFormValidateError) ...[
                      if (change.errors.confirmPassword.isNotEmpty)
                        FetchErrorText(
                          text: change.errors.confirmPassword.first,
                        ),
                    ],
                  ],
                ),
                Utils.verticalSpace(20),
                BlocListener<ForgotPasswordCubit, ForgotPasswordStateModel>(
                  listener: (context, state) {
                     final changePass = state.passwordState;
                     if(changePass is )
                  },
                  child: PrimaryButton(
                    bgColor: dTextColor,
                    textColor: whiteColor,
                    minimumSize: const Size(double.infinity, 44),
                    text: 'Create Password',
                    onPressed: () {},
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
