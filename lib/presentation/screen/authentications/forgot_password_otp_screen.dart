import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodigo/features/ForgotPassword/cubit/forgot_password_cubit.dart';
import 'package:foodigo/features/ForgotPassword/cubit/forgot_password_state.dart';
import 'package:foodigo/features/ForgotPassword/cubit/forgot_password_state_model.dart';
import 'package:foodigo/presentation/core/routes/route_names.dart';
import 'package:foodigo/utils/constraints.dart';
import 'package:foodigo/utils/k_images.dart';
import 'package:foodigo/utils/utils.dart';
import 'package:foodigo/widget/custom_image.dart';
import 'package:foodigo/widget/custom_text_style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class ForgotPasswordOtpScreen extends StatefulWidget {
  const ForgotPasswordOtpScreen({super.key});

  @override
  State<ForgotPasswordOtpScreen> createState() =>
      _ForgotPasswordOtpScreenState();
}

class _ForgotPasswordOtpScreenState extends State<ForgotPasswordOtpScreen> {
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
    print('register email $email');
    return Scaffold(
      appBar: AppBar(title: const CustomImage(path: KImages.logo, height: 40)),
      body: BlocListener<ForgotPasswordCubit, ForgotPasswordStateModel>(
        listener: (context, state) {
          final otp = state.passwordState;
          if (otp is ForgotPssOtpVerifyStateError) {
            Utils.failureSnackBar(context, otp.message);
          } else if (otp is ForgotPassOtpVerifyStateSuccess) {
            Utils.successSnackBar(context, otp.message);
            Navigator.pushNamed(context, RouteNames.createNewPasswordScreen);
          }
        },
        child: Padding(
          padding: Utils.symmetric(h: 20.0, v: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                text: 'Verify Code!',
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
              Utils.verticalSpace(16),
              const CustomText(
                text: 'Please enter the code, we just sent to email',
                color: sTxtColor,
              ),
              Utils.verticalSpace(44),
              Pinput(
                length: 6,
                defaultPinTheme: PinTheme(
                  height: Utils.vSize(50.0),
                  width: Utils.hSize(50.0),
                  textStyle: GoogleFonts.inter(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w700,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: borderColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onChanged: (String code) {
                  fCubit.forgotOtpChange(code);
                  print('forgot code:$code');
                },
                onCompleted: (String code) {
                  if (code.length == 6) {
                    fCubit.verifyForgetPassOtp(email);
                  } else {
                    Utils.errorSnackBar(context, "enter 6 digit");
                  }
                },
              ),
              Utils.verticalSpace(24),

              Utils.verticalSpace(24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomText(text: 'Already have  account? '),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RouteNames.authenticationScreen,
                      );
                    },
                    child: const CustomText(
                      text: ' Sign In',
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
