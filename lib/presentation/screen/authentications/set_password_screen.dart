import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:foodigo_delivery_man/utils/k_images.dart';
import 'package:foodigo_delivery_man/widget/primary_button.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../features/register/cubit/register_cubit.dart';
import '../../../features/register/cubit/register_state.dart';
import '../../../features/register/model/register_state_model.dart';
import '../../../utils/utils.dart';
import '../../../widget/custom_form.dart';
import '../../../widget/custom_image.dart';
import '../../../widget/custom_text_style.dart';
import '../../../widget/fetch_error_text.dart';
import '../../core/routes/route_names.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  late RegisterCubit rCubit;
 
  @override
  void initState() {
    super.initState();
    rCubit = context.read<RegisterCubit>();
  }

  @override
  Widget build(BuildContext context) {
    final email = rCubit.state.email;
    print('register email $email');
    return Scaffold(
      appBar: AppBar(title: const CustomImage(path: KImages.logo, height: 40)),
      body: Padding(
        padding: Utils.symmetric(h: 20.0, v: 10.0),
        child: BlocBuilder<RegisterCubit, RegisterStateModel>(
          builder: (context, state) {
            final validate = state.registerState;
            return Column(
              children: [
                Utils.verticalSpace(20),
                const CustomText(
                  text: 'Set Password',
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
                        initialValue: state.password,
                        obscureText: state.showPassword,
                        onChanged: rCubit.changePassword,
                        decoration: InputDecoration(
                          hintText: '******',
                          suffixIcon: IconButton(
                            onPressed: rCubit.showPassword,
                            icon: Icon(
                              state.showPassword
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
                    if (validate is RegisterValidateStateError) ...[
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
                        onChanged: rCubit.changeConPassword,
                        obscureText: state.showConPassword,
                        decoration: InputDecoration(
                          hintText: '******',
                          suffixIcon: IconButton(
                            onPressed: rCubit.showConfirmPassword,
                            icon: Icon(
                              state.showConPassword
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
                    if (validate is RegisterValidateStateError) ...[
                      if (validate.errors.confirmPassword.isNotEmpty)
                        FetchErrorText(
                          text: validate.errors.confirmPassword.first,
                        ),
                    ],
                  ],
                ),
                Utils.verticalSpace(20),
                BlocListener<RegisterCubit, RegisterStateModel>(
                  listener: (context, state) {
                    final reg = state.registerState;
                    if (reg is SetPasswordLoading) {
                      Utils.loadingDialog(context);
                    } else {
                      Utils.closeDialog(context);
                      if (reg is SetPasswordError) {
                        Utils.failureSnackBar(context, reg.message);
                      } else if (reg is SetPasswordSuccess) {
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
                      rCubit.setPassword(email);
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
