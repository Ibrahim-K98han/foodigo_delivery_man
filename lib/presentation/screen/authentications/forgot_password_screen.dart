import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodigo/features/ForgotPassword/cubit/forgot_password_cubit.dart';
import 'package:foodigo/features/ForgotPassword/cubit/forgot_password_state.dart';
import 'package:foodigo/features/ForgotPassword/cubit/forgot_password_state_model.dart';
import 'package:foodigo/presentation/core/routes/route_names.dart';
import 'package:foodigo/utils/constraints.dart';
import 'package:foodigo/utils/k_images.dart';
import 'package:foodigo/utils/utils.dart';
import 'package:foodigo/widget/custom_form.dart';
import 'package:foodigo/widget/custom_image.dart';
import 'package:foodigo/widget/custom_text_style.dart';
import 'package:foodigo/widget/fetch_error_text.dart';
import 'package:foodigo/widget/primary_button.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final fCubit = context.read<ForgotPasswordCubit>();
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
                  text: 'Reset Password',
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
                Utils.verticalSpace(20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomFormWidget(
                      label: 'Email',
                      bottomSpace: 8,
                      child: TextFormField(
                        initialValue: state.email,
                        onChanged: fCubit.changeEmail,
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
                    if (validate is ForgotPasswordFormValidateError) ...[
                      if (validate.errors.email.isNotEmpty)
                        FetchErrorText(text: validate.errors.email.first),
                    ],
                  ],
                ),
                Utils.verticalSpace(20),
                BlocListener<ForgotPasswordCubit, ForgotPasswordStateModel>(
                  listener: (context, state) {
                    final forgotPass = state.passwordState;
                    if (forgotPass is ForgotPasswordStateLoading) {
                      Utils.loadingDialog(context);
                    } else {
                      Utils.closeDialog(context);
                      if (forgotPass is ForgotPasswordStateError) {
                        Utils.failureSnackBar(context, forgotPass.message);
                      } else if (forgotPass is ForgotPasswordStateLoaded) {
                        Utils.successSnackBar(context, forgotPass.message);
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          RouteNames.forgotPasswordOtpScreen,
                          (route) => false,
                        );
                      }
                    }
                  },
                  child: PrimaryButton(
                    text: 'Send Code',
                    onPressed: () {
                      fCubit.forgotPasswordCode();
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
