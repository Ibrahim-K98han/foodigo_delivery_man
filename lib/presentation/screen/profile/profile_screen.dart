import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodigo/data/remote_url.dart';
import 'package:foodigo/features/GetProfile/cubit/get_profile_cubit.dart';
import 'package:foodigo/features/Login/bloc/login_bloc.dart';
import 'package:foodigo/features/Login/bloc/login_event.dart';
import 'package:foodigo/features/Login/bloc/login_state.dart';
import 'package:foodigo/features/Login/model/login_state_model.dart';
import 'package:foodigo/presentation/core/routes/route_names.dart';
import 'package:foodigo/presentation/screen/profile/component/drawer_item.dart';
import 'package:foodigo/utils/constraints.dart';
import 'package:foodigo/utils/k_images.dart';
import 'package:foodigo/utils/utils.dart';
import 'package:foodigo/widget/circle_image.dart';
import 'package:foodigo/widget/custom_image.dart';
import 'package:foodigo/widget/custom_text_style.dart';
import 'package:foodigo/widget/loading_widget.dart';
import 'package:foodigo/widget/primary_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late GetProfileCubit profileCubit;
  late String image;
  late String name;
  late String lname;
  late String email;
  @override
  void initState() {
    _initState();
    super.initState();
  }

  _initState() {
    profileCubit = context.read<GetProfileCubit>();
    profileCubit.getProfileData();
    if (profileCubit.user != null && profileCubit.user!.manImage.isNotEmpty) {
      image = RemoteUrls.imageUrl(profileCubit.user!.manImage);
      // name = profileData.user!.name;
      // email = profileData.user!.email;
    } else {
      image = KImages.profile;
      // name = 'user';
      // email = 'user@gmail.com';
    }
    name = profileCubit.user?.fname ?? 'User';
    lname = profileCubit.user?.lname ?? 'Name';
    email = profileCubit.user?.email ?? 'user@gmail.com';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFFFFFF8), Color(0xFFFEFEDD)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                children: [
                  Utils.verticalSpace(12.0),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: Utils.only(left: 16, top: 30, bottom: 10),
                      child: const CustomText(
                        text: 'Profile',
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Utils.verticalSpace(12.0),

                  CircleImage(image: image, size: 80),
                  Utils.verticalSpace(8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(
                        text: '$name $lname',
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                      ),
                      Utils.horizontalSpace(8),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            RouteNames.editProfileScreen,
                          );
                        },
                        child: const CustomImage(
                          path: KImages.editIcon,
                          color: Color(0xFF46D993),
                          height: 18,
                          width: 18,
                        ),
                      ),
                    ],
                  ),
                  Utils.verticalSpace(2),
                  CustomText(text: email, color: sTxtColor),
                  Utils.verticalSpace(20),
                ],
              ),
            ),
            Utils.verticalSpace(20),
            DrawerItem(
              icon: KImages.profileInActive,
              title: 'My Profile',
              onTap: () {
                Navigator.pushNamed(context, RouteNames.editProfileScreen);
              },
              isVisibleBorder: false,
            ),
            DrawerItem(
              icon: KImages.kyc,
              title: 'KYC Verification',
              onTap: () {
                Navigator.pushNamed(context, RouteNames.kycVerificationScreen);
              },
              isVisibleBorder: false,
            ),
            DrawerItem(
              icon: KImages.location,
              title: 'Working Area',
              onTap: () {},
              isVisibleBorder: false,
            ),
            DrawerItem(
              icon: KImages.helpCenter,
              title: 'Help Center',
              onTap: () {},
              isVisibleBorder: false,
            ),
            DrawerItem(
              icon: KImages.privacy,
              title: 'Privacy Policy',
              onTap: () {
                Navigator.pushNamed(context, RouteNames.privacyPolicyScreen);
              },
              isVisibleBorder: false,
            ),
            DrawerItem(
              icon: KImages.help,
              title: 'Terms of Condition',
              onTap: () {
                Navigator.pushNamed(context, RouteNames.termsConditionScreen);
              },
              isVisibleBorder: false,
            ),
            DrawerItem(
              icon: KImages.changePass,
              title: 'Change Password',
              onTap: () {
                Navigator.pushNamed(context, RouteNames.changePasswordScreen);
              },
              isVisibleBorder: false,
            ),
            DrawerItem(
              icon: KImages.loggout,
              title: 'Logout',
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const LogoutDialog();
                  },
                );
              },
              isVisibleBorder: false,
            ),
          ],
        ),
      ),
    );
  }
}

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: Utils.all(value: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.close, color: redColor, size: 20),
              ),
            ),
            const CustomImage(
              path: KImages.logoutImage,
              width: 96,
              height: 96,
              fit: BoxFit.cover,
            ),
            Utils.verticalSpace(20),
            const CustomText(
              textAlign: TextAlign.center,
              height: 1.24,
              text: 'Are you sure you want Logout ?',
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
            Utils.verticalSpace(32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: PrimaryButton(
                    bgColor: dTextColor,
                    textColor: whiteColor,
                    minimumSize: const Size(double.infinity, 44),
                    text: 'Not now',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Utils.horizontalSpace(12),
                Expanded(
                  child: BlocConsumer<LoginBloc, LoginStateModel>(
                    listener: (context, state) {
                      if (state.loginState is LoginStateLogoutLoaded) {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          RouteNames.authenticationScreen,
                          (route) => false,
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state.loginState is LoginStateLogoutLoading) {
                        return const LoadingWidget();
                      }
                      return PrimaryButton(
                        bgColor: redColor,
                        textColor: whiteColor,
                        minimumSize: const Size(double.infinity, 44),
                        text: 'Log Out',
                        onPressed: () {
                          context.read<LoginBloc>().add(
                            const LoginEventLogout(),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            Utils.verticalSpace(10),
          ],
        ),
      ),
    );
  }
}
