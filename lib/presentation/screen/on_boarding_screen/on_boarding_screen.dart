import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodigo/features/Dashboard/cubit/dashboard_cubit.dart';
import 'package:foodigo/features/Dashboard/cubit/dashboard_state.dart';
import 'package:foodigo/presentation/core/routes/route_names.dart';
import 'package:foodigo/utils/utils.dart';
import 'package:foodigo/widget/custom_image.dart';
import 'package:foodigo/widget/custom_text_style.dart';
import 'package:foodigo/widget/fetch_error_text.dart';
import 'package:foodigo/widget/loading_widget.dart';
import 'package:foodigo/widget/primary_button.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late DashboardCubit dCubit;
  @override
  void initState() {
    super.initState();
    dCubit = context.read<DashboardCubit>();
    dCubit.getSplashData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<DashboardCubit, DashboardState>(
        listener: (context, state) {
          if (state is SplashError) {
            if (state.statusCode == 503 || dCubit.splashModel == null) {
              dCubit.getSplashData();
            }
          }
        },
        builder: (context, state) {
          if (state is SplashLoading) {
            return const LoadingWidget();
          } else if (state is SplashError) {
            if (state.statusCode == 503 || dCubit.splashModel != null) {
              return const SplashData();
            }
          } else if (state is SplashLoaded) {
            return const SplashData();
          }
          if (dCubit.splashModel != null) {
            return const SplashData();
          } else {
            return const FetchErrorText(text: 'Something Went Wrong');
          }
        },
      ),
    );
  }
}

class SplashData extends StatelessWidget {
  const SplashData({super.key});

  @override
  Widget build(BuildContext context) {
    final dCubit = context.read<DashboardCubit>();
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        CustomImage(
          path: dCubit.splashModel!.image,
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
                text: dCubit.splashModel!.heading,
                fontWeight: FontWeight.w500,
                fontSize: 20,
                height: 1.32,
              ),
              CustomText(
                text: dCubit.splashModel!.subheading,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
              Utils.verticalSpace(24),
              PrimaryButton(
                text: 'Sign In',
                onPressed: () {
                  Navigator.pushNamed(context, RouteNames.authenticationScreen);
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
}
