import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodigo_delivery_man/data/remote_url.dart';
import 'package:foodigo_delivery_man/features/Splash/cubit/splash_cubit.dart';
import 'package:foodigo_delivery_man/features/Splash/cubit/splash_state.dart';
import 'package:foodigo_delivery_man/presentation/core/routes/route_names.dart';
import 'package:foodigo_delivery_man/utils/utils.dart';
import 'package:foodigo_delivery_man/widget/custom_image.dart';
import 'package:foodigo_delivery_man/widget/custom_text_style.dart';
import 'package:foodigo_delivery_man/widget/primary_button.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late SplashCubit spCubit;

  @override
  void initState() {
    super.initState();
    spCubit = context.read<SplashCubit>();
    spCubit.getSplash();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: BlocBuilder<SplashCubit, SplashState>(
        builder: (context, state) {
          // Show loading indicator while fetching data
          if (state is SplashStateLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          // Show error message if failed
          if (state is SplashStateError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error: ${state.message}'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => spCubit.getSplash(),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          // Show onboarding content when data is loaded
          if (state is SplashStateLoaded &&
              spCubit.splashResponseModel != null) {
            final splashData = spCubit.splashResponseModel!;

            return Column(
              children: [
                CustomImage(
                  path: splashData.image,
                  height: size.height / 1.8,
                  width: double.maxFinite,
                  fit: BoxFit.fill,
                ),
                Utils.verticalSpace(40.0),
                Padding(
                  padding: Utils.symmetric(h: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: splashData.heading,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        height: 1.32,
                      ),
                      CustomText(
                        text: splashData.subheading,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        height: 1.32,
                      ),
                      Utils.verticalSpace(24),
                      PrimaryButton(
                        text: 'Sign In',
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            RouteNames.authenticationScreen,
                          );
                        },
                      ),
                      Utils.verticalSpace(12),
                      PrimaryButton(
                        bgColor: const Color(0xffEFEFEF),
                        text: 'Apply now',
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            RouteNames.deliverymanRegisterScreen,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          }

          // Fallback for any other state
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
