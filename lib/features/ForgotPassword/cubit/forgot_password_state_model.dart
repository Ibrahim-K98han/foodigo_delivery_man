import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:foodigo_delivery_man/features/ForgotPassword/cubit/forgot_password_state.dart';

class ForgotPasswordStateModel extends Equatable {
  final String currentPassword;
  final String password;
  final String passwordConfirmation;
  final bool showCurrentPassword;
  final bool showPassword;
  final bool showPasswordConfirmation;
  final String newPass;
  final String conPass;
  final bool showNewPass;
  final bool showConPass;
  final String email;
  final String code;
  final String otp;
  final String languageCode;
  final String confirmPassword;
  final bool showConfirmPassword;
  final ForgotPasswordState passwordState;

  const ForgotPasswordStateModel({
    this.showCurrentPassword = true,
    this.showPasswordConfirmation = true,
    this.showPassword = true,
    this.currentPassword = '',
    this.password = '',
    this.passwordConfirmation = '',
    this.newPass = '',
    this.conPass = '',
    this.showNewPass = true,
    this.showConPass = true,
    this.email = '',
    this.otp = '',
    this.code = '',
    this.languageCode = '',
    this.confirmPassword = '',

    this.showConfirmPassword = true,
    this.passwordState = const ForgotPasswordStateInitial(),
  });

  ForgotPasswordStateModel copyWith({
    String? currentPassword,
    String? password,
    String? passwordConfirmation,
    bool? showCurrentPassword,
    bool? showPassword,
    bool? showPasswordConfirmation,
    String? newPass,
    String? conPass,
    bool? showNewPass,
    bool? showConPass,
    String? email,
    String? otp,
    String? code,
    String? languageCode,
    String? confirmPassword,
    bool? showConfirmPassword,
    ForgotPasswordState? passwordState,
  }) {
    return ForgotPasswordStateModel(
      currentPassword: currentPassword ?? this.currentPassword,
      passwordConfirmation: passwordConfirmation ?? this.passwordConfirmation,
      showCurrentPassword: showCurrentPassword ?? this.showCurrentPassword,
      showPasswordConfirmation:
          showPasswordConfirmation ?? this.showPasswordConfirmation,
      newPass: newPass ?? this.newPass,
      conPass: conPass ?? this.conPass,
      showNewPass: showNewPass ?? this.showNewPass,
      showConPass: showConPass ?? this.showConPass,
      email: email ?? this.email,
      otp: otp ?? this.otp,
      code: code ?? this.code,
      password: password ?? this.password,
      languageCode: languageCode ?? this.languageCode,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      showPassword: showPassword ?? this.showPassword,
      showConfirmPassword: showConfirmPassword ?? this.showConfirmPassword,
      passwordState: passwordState ?? this.passwordState,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'current_password': currentPassword,
      'password': password,
      'password_confirmation': passwordConfirmation,
      'email': email,
      'otp': otp,
      'token': code,
      'c_password': confirmPassword,
      'lang_code': languageCode,
      // 'showPassword': showPassword,
      // 'showConfirmPassword': showConfirmPassword,
    };
  }

  static ForgotPasswordStateModel init() {
    return const ForgotPasswordStateModel(
      currentPassword: '',
      passwordConfirmation: '',
      showCurrentPassword: true,
      showPasswordConfirmation: true,
      newPass: '',
      conPass: '',
      showNewPass: true,
      showConPass: true,
      email: '',
      otp: '',
      code: '',
      password: '',
      languageCode: '',
      confirmPassword: '',
      showPassword: true,
      showConfirmPassword: true,
      passwordState: ForgotPasswordStateInitial(),
    );
  }

  ForgotPasswordStateModel clear() {
    return const ForgotPasswordStateModel(
      newPass: '',
      conPass: '',
      showNewPass: true,
      showConPass: true,
      email: '',
      otp: '',
      code: '',
      password: '',
      confirmPassword: '',
      showPassword: true,
      showConfirmPassword: true,
      passwordState: ForgotPasswordStateInitial(),
    );
  }

  factory ForgotPasswordStateModel.fromMap(Map<String, dynamic> map) {
    return ForgotPasswordStateModel(
      passwordConfirmation: map['password_confirmation'] ?? '',
      currentPassword: map['current_password'] ?? '',
      conPass: map['password'] ?? '',
      newPass: map['password_confirmation'] ?? '',
      showNewPass: map['show_password'] ?? false,
      showConPass: map['show_confirmPassword'] ?? false,
      email: map['email'] ?? '',
      otp: map['otp'] ?? '',
      code: map['token'] ?? '',
      password: map['password'] ?? '',
      confirmPassword: map['password_confirmation'] ?? '',
      showPassword: map['show_password'] ?? false,
      showConfirmPassword: map['show_confirmPassword'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory ForgotPasswordStateModel.fromJson(String source) =>
      ForgotPasswordStateModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PasswordStateModel(email: $email, code: $code, password: $password, confirmPassword: $confirmPassword, showPassword: $showPassword, showConfirmPassword: $showConfirmPassword, passwordState: $passwordState)';
  }

  @override
  List<Object> get props {
    return [
      currentPassword,
      passwordConfirmation,
      showCurrentPassword,
      showPasswordConfirmation,
      newPass,
      conPass,
      showNewPass,
      showConPass,
      email,
      otp,
      code,
      password,
      languageCode,
      confirmPassword,
      showPassword,
      showConfirmPassword,
      passwordState,
    ];
  }
}
