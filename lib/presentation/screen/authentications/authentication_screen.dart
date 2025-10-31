import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodigo_delivery_man/features/Login/bloc/login_bloc.dart';
import 'package:foodigo_delivery_man/features/Login/bloc/login_event.dart';
import 'package:foodigo_delivery_man/features/Login/bloc/login_state.dart';
import 'package:foodigo_delivery_man/features/Login/model/login_state_model.dart';
import 'package:foodigo_delivery_man/presentation/core/routes/route_names.dart';
import 'package:foodigo_delivery_man/utils/constraints.dart';
import 'package:foodigo_delivery_man/utils/utils.dart';
import 'package:foodigo_delivery_man/widget/custom_appbar.dart';
import 'package:foodigo_delivery_man/widget/custom_form.dart';
import 'package:foodigo_delivery_man/widget/custom_text_style.dart';
import 'package:foodigo_delivery_man/widget/fetch_error_text.dart';
import 'package:foodigo_delivery_man/widget/loading_widget.dart';
import 'package:foodigo_delivery_man/widget/primary_button.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  late LoginBloc loginBloc;
  @override
  void initState() {
    loginBloc = context.read<LoginBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Sign In', visibleLeading: false),
      body: Padding(
        padding: Utils.symmetric(h: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(
              text: 'Welcome Back!',
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            Utils.verticalSpace(6.0),
            const CustomText(
              text: 'Login to track and manage your complaints.',
              fontSize: 12,
              color: textGrayColor,
            ),
            Utils.verticalSpace(20.0),

            BlocBuilder<LoginBloc, LoginStateModel>(
              builder: (context, state) {
                final login = state.loginState;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomFormWidget(
                      label: 'Email',
                      child: TextFormField(
                        initialValue: state.email,
                        onChanged:
                            (value) =>
                                loginBloc.add(LoginEventUserEmail(value)),
                        decoration: const InputDecoration(
                          hintText: 'email@gmail.com',
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    if (login is LoginStateFormValidate) ...[
                      if (login.errors.email.isNotEmpty)
                        FetchErrorText(text: login.errors.email.first),
                    ],
                  ],
                );
              },
            ),
            Utils.verticalSpace(12.0),

            BlocBuilder<LoginBloc, LoginStateModel>(
              builder: (context, state) {
                final login = state.loginState;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomFormWidget(
                      label: 'Password',
                      child: TextFormField(
                        obscureText: state.show,
                        keyboardType: TextInputType.visiblePassword,
                        initialValue: state.password,
                        onChanged:
                            (value) => loginBloc.add(LoginEventPassword(value)),
                        decoration: InputDecoration(
                          hintText: '******',
                          suffixIcon: IconButton(
                            onPressed:
                                () => loginBloc.add(
                                  ShowPasswordEvent(state.show),
                                ),
                            icon: Icon(
                              state.show
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: blackColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (login is LoginStateFormValidate) ...[
                      if (login.errors.password.isNotEmpty)
                        FetchErrorText(text: login.errors.password.first),
                    ],
                  ],
                );
              },
            ),
            Utils.verticalSpace(12.0),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RouteNames.forgotPassScreen);
              },
              child: const CustomText(
                text: 'Forgot Password',
                fontWeight: FontWeight.w500,
              ),
            ),
            Utils.verticalSpace(20.0),
            BlocConsumer<LoginBloc, LoginStateModel>(
              listener: (context, login) {
                final state = login.loginState;
                if (state is LoginStateError) {
                  Utils.failureSnackBar(context, state.message);
                } else if (state is LoginStateLoaded) {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    RouteNames.mainScreen,
                    (route) => false,
                  );
                }
              },
              builder: (context, login) {
                final state = login.loginState;
                if (state is LoginStateLoading) {
                  return const LoadingWidget();
                }
                return PrimaryButton(
                  text: 'Sign In',
                  onPressed: () {
                    Utils.closeKeyBoard(context);
                    loginBloc.add(const LoginEventSubmit());
                  },
                );
              },
            ),
            Utils.verticalSpace(20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomText(
                  text: 'Don’t have a Account? ',
                  color: textGrayColor,
                  fontWeight: FontWeight.w500,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      RouteNames.deliverymanRegisterScreen,
                    );
                  },
                  child: const CustomText(
                    text: 'Register',
                    fontWeight: FontWeight.w500,
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
