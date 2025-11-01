import 'package:flutter/material.dart';
import 'package:foodigo_delivery_man/presentation/screen/authentications/create_new_password_screen.dart';
import 'package:foodigo_delivery_man/presentation/screen/authentications/forgot_password_otp_screen.dart';
import 'package:foodigo_delivery_man/presentation/screen/authentications/forgot_password_screen.dart';
import 'package:foodigo_delivery_man/presentation/screen/authentications/registration_otp_verify_screen.dart';
import 'package:foodigo_delivery_man/presentation/screen/authentications/set_password_screen.dart';
import 'package:foodigo_delivery_man/presentation/screen/my_order/my_orders_screen.dart';
import 'package:foodigo_delivery_man/presentation/screen/my_order/order_confirm_screen.dart';
import 'package:foodigo_delivery_man/presentation/screen/on_boarding_screen/on_boarding_screen.dart';
import 'package:foodigo_delivery_man/presentation/screen/profile/change_password_screen.dart';
import 'package:foodigo_delivery_man/presentation/screen/profile/edit_profile_screen.dart';
import 'package:foodigo_delivery_man/presentation/screen/profile/kyc_submit_screen.dart';
import 'package:foodigo_delivery_man/presentation/screen/profile/kyc_verification_screen.dart';
import 'package:foodigo_delivery_man/presentation/screen/profile/privacy_policy_screen.dart';
import 'package:foodigo_delivery_man/presentation/screen/profile/terms_condition_screen.dart';
import 'package:foodigo_delivery_man/presentation/screen/sms/sms_screen.dart';
import '../../screen/authentications/authentication_screen.dart';
import '../../screen/authentications/deliveryman_register_screen.dart';
import '../../screen/main_page/main_screen.dart';
import '../../screen/splash/splash_screen.dart';

class RouteNames {
  static const String splashScreen = '/ss';
  static const String onBoardingScreen = '/onBoardingScreen';
  static const String authenticationScreen = '/authenticationScreen';
  static const String deliverymanRegisterScreen = '/deliverymanRegisterScreen';
  static const String verificationScreen = '/verificationScreen';
  static const String phoneVerificationScreen = '/phoneVerificationScreen';
  static const String emailVerificationScreen = '/emailVerificationScreen';
  static const String forgotPassScreen = '/forgotPassScreen';
  static const String otpScreen = '/otpScreen';
  static const String mainScreen = '/mainScreen';
  static const String restaurantMainScreen = '/restaurantMainScreen';
  static const String allFoodScreen = '/allFoodScreen';
  static const String myMenuScreen = '/myMenuScreen';
  static const String allRestaurantScreen = '/allRestaurantScreen';
  static const String allCategoryScreen = '/allCategoryScreen';
  static const String productDetailsScreen = '/productDetailsScreen';
  static const String orderScreen = '/orderScreen';
  static const String addressScreen = '/addressScreen';
  static const String editAddressScreen = '/editAddressScreen';
  static const String restaurantProfileScreen = '/restaurantProfileScreen';
  static const String wishlistScreen = '/wishlistScreen';
  static const String paymentMethodScreen = '/paymentMethodScreen';
  static const String trackOrderScreen = '/orderTrackScreen';
  static const String smsScreen = '/smsScreen';
  static const String editProfileScreen = '/editProfileScreen';
  static const String myOrderScreen = '/myOrderScreen';
  static const String orderConfirmScreen = '/orderConfirmScreen';
  static const String kycVerificationScreen = '/kycVerificationScreen';
  static const String kycSubmitScreen = '/kycSubmitScreen';
  static const String privacyPolicyScreen = '/privacyPolicyScreen';
  static const String termsConditionScreen = '/termsConditionScreen';
  static const String changePasswordScreen = '/changePasswordScreen';
  static const String registrationOtpVerifyScreen =
      '/registrationOtpVerifyScreen';
  static const String setPasswordScreen = '/setPasswordScreen';
  static const String forgotPasswordScreen = '/forgotPasswordScreen';
  static const String forgotPasswordOtpScreen = '/forgotPasswordOtpScreen';
  static const String createNewPasswordScreen = '/createNewPasswordScreen';

  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SplashScreen(),
        );

      case RouteNames.authenticationScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const AuthenticationScreen(),
        );

      case RouteNames.deliverymanRegisterScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const DeliverymanRegistrationScreen(),
        );

      case RouteNames.mainScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const MainScreen(),
        );

      case RouteNames.smsScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SmsScreen(),
        );
      case RouteNames.editProfileScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const EditProfileScreen(),
        );

      case RouteNames.myOrderScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const MyOrdersScreen(),
        );
      case RouteNames.onBoardingScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const OnBoardingScreen(),
        );
      case RouteNames.orderConfirmScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const OrderConfirmScreen(),
        );
      case RouteNames.kycVerificationScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const KycVerificationScreen(),
        );
      case RouteNames.kycSubmitScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const KycSubmitScreen(),
        );
      case RouteNames.privacyPolicyScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const PrivacyPolicy(),
        );
      case RouteNames.termsConditionScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const TermsAndConditionScreen(),
        );
      case RouteNames.changePasswordScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ChangePasswordScreen(),
        );
      case RouteNames.registrationOtpVerifyScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const RegistrationOtpVerifyScreen(),
        );
      case RouteNames.setPasswordScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SetPasswordScreen(),
        );
      case RouteNames.forgotPassScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ForgotPasswordScreen(),
        );
      case RouteNames.forgotPasswordOtpScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ForgotPasswordOtpScreen(),
        );
      case RouteNames.createNewPasswordScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const CreateNewPasswordScreen(),
        );

      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(child: Text('No Route Found ${settings.name}')),
              ),
        );
    }
  }
}
