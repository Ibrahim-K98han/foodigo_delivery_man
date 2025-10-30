import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodigo/features/ForgotPassword/cubit/forgot_password_cubit.dart';
import 'package:foodigo/features/ForgotPassword/cubit/forgot_password_state.dart';
import 'package:foodigo/features/ForgotPassword/cubit/forgot_password_state_model.dart';
import 'package:foodigo/presentation/core/routes/route_names.dart';
import 'package:foodigo/utils/k_images.dart';
import 'package:foodigo/utils/utils.dart';
import 'package:foodigo/widget/custom_form.dart';
import 'package:foodigo/widget/custom_image.dart';
import 'package:foodigo/widget/custom_text_style.dart';
import 'package:foodigo/widget/fetch_error_text.dart';
import 'package:foodigo/widget/primary_button.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  late ForgotPasswordCubit fCubit;
  bool finishTime = true;
  @override
  void initState() {
    super.initState();
    fCubit = context.read<ForgotPasswordCubit>();
  }

  @override
  Widget build(BuildContext context) {
    final email = fCubit.state.email;
    final otp = fCubit.state.otp;
    print(' email ========= $email');
    print('otp ====== $otp');
    return Scaffold(
      appBar: AppBar(title: const CustomImage(path: KImages.logo, height: 40)),
      body: Padding(
        padding: Utils.symmetric(h: 20.0, v: 10.0),
        child: BlocBuilder<ForgotPasswordCubit, ForgotPasswordStateModel>(
          builder: (context, state) {
            final validate = state.passwordState;
            return Column(
              children: [
                Utils.verticalSpace(20),
                const CustomText(
                  text: 'Create New Password',
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
                Utils.verticalSpace(20),
                Column(
                  children: [
                    CustomFormWidget(
                      bottomSpace: 14,
                      label: 'Password',
                      child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        initialValue: state.password,
                        onChanged: fCubit.newPass,
                        obscureText: state.showNewPass,
                        decoration: InputDecoration(
                          hintText: '******',
                          suffixIcon: IconButton(
                            onPressed: fCubit.showNewPassword,
                            icon: Icon(
                              state.showNewPass
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                            ),
                          ),
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                            errorText: 'Please enter password',
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
                Column(
                  children: [
                    CustomFormWidget(
                      bottomSpace: 14,
                      label: 'Confirm Password',
                      child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        initialValue: state.confirmPassword,
                        onChanged: fCubit.conPass,
                        obscureText: state.showConPass,
                        decoration: InputDecoration(
                          hintText: '******',
                          suffixIcon: IconButton(
                            onPressed: fCubit.showConPassword,
                            icon: Icon(
                              state.showConPass
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                            ),
                          ),
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                            errorText: 'Please enter confirm password',
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
                BlocListener<ForgotPasswordCubit, ForgotPasswordStateModel>(
                  listener: (context, state) {
                    final reg = state.passwordState;
                    if (reg is ForgotPasswordResetStateLoading) {
                      Utils.loadingDialog(context);
                    } else {
                      Utils.closeDialog(context);
                      if (reg is ForgotPasswordResetStateError) {
                        Utils.failureSnackBar(context, reg.message);
                      } else if (reg is PasswordResetStateUpdated) {
                        Utils.successSnackBar(context, reg.message);
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          RouteNames.authenticationScreen,
                          (route) => false,
                        );
                      }
                    }
                  },
                  child: PrimaryButton(
                    text: 'Set Password',
                    onPressed: () {
                      fCubit.updatePassword(email, otp);
                    },
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
