import 'package:flutter/material.dart';
import 'package:foodigo/presentation/core/routes/route_names.dart';
import 'package:foodigo/utils/constraints.dart';
import 'package:foodigo/utils/k_images.dart';
import 'package:foodigo/utils/utils.dart';
import 'package:foodigo/widget/custom_image.dart';
import 'package:foodigo/widget/custom_text_style.dart';
import 'package:foodigo/widget/primary_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

class RegistrationOtpVerifyScreen extends StatelessWidget {
  const RegistrationOtpVerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: CustomImage(path: KImages.logo, height: 40)),
      body: Padding(
        padding: Utils.symmetric(h: 20.0, v: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: 'Verify Code!',
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
            Utils.verticalSpace(16),
            CustomText(
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
                // rCubit.otpChange(code);
              },
              onCompleted: (String code) {
                if (code.length == 6) {
                  // rCubit.verifyRegOtp();
                } else {
                  Utils.errorSnackBar(context, "enter 6 digit");
                }
              },
            ),
            Utils.verticalSpace(24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: 'Resend code in ',
                  color: sTxtColor,
                  fontSize: 16,
                ),
                CustomText(
                  text: '00:48',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
            Utils.verticalSpace(24),
            PrimaryButton(text: 'Verify', onPressed: () {}),

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
    );
  }
}
