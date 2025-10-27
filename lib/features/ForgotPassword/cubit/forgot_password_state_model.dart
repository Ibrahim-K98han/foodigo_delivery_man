import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:foodigo/features/ForgotPassword/cubit/forgot_password_state.dart';

class ForgotPasswordStateModel extends Equatable {
  final String newPass;
  final String conPass;
  final bool showNewPass;
  final bool showConPass;
  final String email;
  final String code;
  final String otp;
  final String password;
  final String languageCode;
  final String confirmPassword;
  final bool showPassword;
  final bool showConfirmPassword;
  final ForgotPasswordState passwordState;

  const ForgotPasswordStateModel({
    this.newPass = '',
    this.conPass = '',
    this.showNewPass = true,
    this.showConPass = true,
    this.email = '',
    this.otp = '',
    this.code = '',
    this.password = '',
    this.languageCode = '',
    this.confirmPassword = '',
    this.showPassword = true,
    this.showConfirmPassword = true,
    this.passwordState = const ForgotPasswordStateInitial(),
  });

  ForgotPasswordStateModel copyWith({
    String? newPass,
    String? conPass,
    bool? showNewPass,
    bool? showConPass,
    String? email,
    String? otp,
    String? code,
    String? password,
    String? languageCode,
    String? confirmPassword,
    bool? showPassword,
    bool? showConfirmPassword,
    ForgotPasswordState? passwordState,
  }) {
    return ForgotPasswordStateModel(
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
      'email': email,
      'password': newPass,
      'password_confirmation': conPass,
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
      newPass: '',
      conPass: '',
      showNewPass: true,
      showConPass:true,
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
      conPass: map['password'] ?? '',
      newPass: map['password_confirmation'] ?? '',
      showNewPass: map['show_password'] ?? false,
      showConPass: map['show_confirmPassword']  ?? false,
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
