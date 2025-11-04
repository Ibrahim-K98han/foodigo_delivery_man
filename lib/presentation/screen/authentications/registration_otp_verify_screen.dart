import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:foodigo/features/register/cubit/register_cubit.dart';
import 'package:foodigo/features/register/cubit/register_state.dart';
import 'package:foodigo/features/register/model/register_state_model.dart';
import 'package:foodigo/presentation/core/routes/route_names.dart';
import 'package:foodigo/utils/constraints.dart';
import 'package:foodigo/utils/k_images.dart';
import 'package:foodigo/utils/utils.dart';
import 'package:foodigo/widget/custom_image.dart';
import 'package:foodigo/widget/custom_text_style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class RegistrationOtpVerifyScreen extends StatefulWidget {
  const RegistrationOtpVerifyScreen({super.key});

  @override
  State<RegistrationOtpVerifyScreen> createState() =>
      _RegistrationOtpVerifyScreenState();
}

class _RegistrationOtpVerifyScreenState
    extends State<RegistrationOtpVerifyScreen> {
  late RegisterCubit rCubit;
  bool finishTime = true;
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
      body: BlocListener<RegisterCubit, RegisterStateModel>(
        listener: (context, state) {
          final otp = state.registerState;
          if (otp is RegisterOtpError) {
            Utils.failureSnackBar(context, otp.message);
          } else if (otp is RegisterOtpSuccess) {
            Utils.successSnackBar(context, otp.message);
            Navigator.pushNamed(context, RouteNames.setPasswordScreen);
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
                  rCubit.changeOtp(code);
                  print('register code:$code');
                },
                onCompleted: (String code) {
                  if (code.length == 6) {
                    rCubit.verifyRegOtp(email);
                  } else {
                    Utils.errorSnackBar(context, "enter 6 digit");
                  }
                },
              ),
              Utils.verticalSpace(24),

              _countDownTime(),

              Utils.verticalSpace(24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(text: 'Already have  account? '),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RouteNames.authenticationScreen,
                      );
                    },
                    child: CustomText(
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

  Widget _countDownTime() {
    if (finishTime) {
      return Align(
        alignment: Alignment.center,
        child: TimerCountdown(
          format: CountDownTimerFormat.secondsOnly,
          enableDescriptions: false,
          spacerWidth: 6.0,
          timeTextStyle: GoogleFonts.poppins(
            fontSize: 30.0,
            color: primaryColor,
            fontWeight: FontWeight.w600,
          ),
          colonsTextStyle: GoogleFonts.inter(
            fontSize: 30.0,
            color: primaryColor,
            fontWeight: FontWeight.w600,
          ),
          endTime: DateTime.now().add(const Duration(seconds: 30)),
          onEnd: () {
            print('finish');
            setState(() => finishTime = false);
          },
        ),
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const CustomText(
            text: 'Don\'t get verification code',
            fontSize: 14.0,
          ),
          BlocListener<RegisterCubit, RegisterStateModel>(
            listener: (context, state) {
              final resend = state.registerState;
              if (resend is ResendCodeLoading) {
                Utils.loadingDialog(context);
              } else {
                Utils.closeDialog(context);
                if (resend is ResendCodeError) {
                  Utils.failureSnackBar(context, resend.message);
                } else if (resend is ResendCodeSuccess) {
                  Utils.successSnackBar(context, resend.message);
                 
                }
              }
            },
            child: GestureDetector(
              onTap: () => rCubit.resendVerificationCode(),
              child: const CustomText(
                text: 'Resend Code',
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                color: primaryColor,
              ),
            ),
          ),
        ],
      );
    }
  }
}
