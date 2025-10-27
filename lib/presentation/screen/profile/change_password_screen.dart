import 'package:flutter/material.dart';
import 'package:foodigo/utils/constraints.dart';
import 'package:foodigo/utils/k_images.dart';
import 'package:foodigo/utils/utils.dart';
import 'package:foodigo/widget/custom_appbar.dart';
import 'package:foodigo/widget/custom_form.dart';
import 'package:foodigo/widget/custom_image.dart';
import 'package:foodigo/widget/primary_button.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Change Password'),
      body: Padding(
        padding: Utils.symmetric(h: 20.0, v: 10.0),
        child: Column(
          children: [
            Utils.verticalSpace(20),
            const CustomImage(
              path: KImages.changePassword,
              width: 72,
              height: 72,
              fit: BoxFit.cover,
            ),
            Utils.verticalSpace(30),
            CustomFormWidget(
              label: 'Password',
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: '******',
                  suffixIcon: Icon(Icons.visibility_off),
                ),
              ),
            ),
            Utils.verticalSpace(10),
            CustomFormWidget(
              label: 'Password',
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: '******',
                  suffixIcon: Icon(Icons.visibility_off),
                ),
              ),
            ),
            Utils.verticalSpace(10),
            CustomFormWidget(
              label: 'Password',
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: '******',
                  suffixIcon: Icon(Icons.visibility_off),
                ),
              ),
            ),
            Utils.verticalSpace(20),
            PrimaryButton(
              bgColor: dTextColor,
              textColor: whiteColor,
              minimumSize: const Size(double.infinity, 44),
              text: 'Create Password',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
