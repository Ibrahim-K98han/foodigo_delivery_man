import 'package:equatable/equatable.dart';
import 'package:foodigo/features/register/model/city_model.dart';

import '../../../data/errors/errors_model.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {
  const RegisterInitial();

  @override
  List<Object> get props => [];
}

class CityLoading extends RegisterState {
  const CityLoading();
}

class CityError extends RegisterState {
  final String message;
  final int statusCode;

  const CityError(this.message, this.statusCode);
  @override
  List<Object> get props => [message, statusCode];
}

class CityLoaded extends RegisterState {
  final CityModel cityModel;

  const CityLoaded(this.cityModel);
  @override
  List<Object> get props => [cityModel];
}

class RegisterStateLoading extends RegisterState {}
class RegisterStateOneLoading extends RegisterState {}

class RegisterStateTwoLoading extends RegisterState {}

class RegisterStateThreeLoading extends RegisterState {}

class RegisterStateOneSuccess extends RegisterState {
  final String message;

  const RegisterStateOneSuccess(this.message);

  @override
  List<Object> get props => [message];
}
class RegisterStateSuccess extends RegisterState {
  final String message;

  const RegisterStateSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class RegisterStateTwoSuccess extends RegisterState {
  final String message;

  const RegisterStateTwoSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class RegisterStateThreeSuccess extends RegisterState {
  final String message;

  const RegisterStateThreeSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class RegisterValidateStateError extends RegisterState {
  final Errors errors;

  const RegisterValidateStateError(this.errors);

  @override
  List<Object> get props => [errors];
}

class RegisterStateOneError extends RegisterState {
  final String message;
  final int statusCode;

  const RegisterStateOneError(this.message, this.statusCode);

  @override
  List<Object> get props => [message, statusCode];
}
class RegisterStateError extends RegisterState {
  final String message;
  final int statusCode;

  const RegisterStateError(this.message, this.statusCode);

  @override
  List<Object> get props => [message, statusCode];
}

class RegisterStateTwoError extends RegisterState {
  final String message;
  final int statusCode;

  const RegisterStateTwoError(this.message, this.statusCode);

  @override
  List<Object> get props => [message, statusCode];
}

class RegisterStateThreeError extends RegisterState {
  final String message;
  final int statusCode;

  const RegisterStateThreeError(this.message, this.statusCode);

  @override
  List<Object> get props => [message, statusCode];
}

/// otp
class RegisterOtpStateLoading extends RegisterState {}

class RegisterOtpStateSuccess extends RegisterState {
  final String message;

  const RegisterOtpStateSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class RegisterOtpStateError extends RegisterState {
  final String message;
  final int statusCode;

  const RegisterOtpStateError(this.message, this.statusCode);

  @override
  List<Object> get props => [message, statusCode];
}

class SignUpStateError extends RegisterState {
  final String errorMsg;
  final int statusCode;

  const SignUpStateError(this.errorMsg, this.statusCode);

  @override
  List<Object> get props => [errorMsg, statusCode];
}

class SignUpStateResendCodeLoaded extends RegisterState {
  final String message;

  const SignUpStateResendCodeLoaded(this.message);

  @override
  List<Object> get props => [message];
}

class LoginEventPrivacy extends RegisterState {}

class SignUpStateFormValidate extends RegisterState {
  final Errors errors;

  const SignUpStateFormValidate(this.errors);

  @override
  List<Object> get props => [errors];
}

class SignUpStateResendCodeLoading extends RegisterState {
  const SignUpStateResendCodeLoading();

  @override
  List<Object> get props => [];
}

class SignUpEventResendVerificationSubmit extends RegisterState {
  const SignUpEventResendVerificationSubmit();

  @override
  List<Object> get props => [];
}

///Create New pass
class CreateNewPassOtpStateError extends RegisterState {
  final String message;
  final int statusCode;

  const CreateNewPassOtpStateError(this.message, this.statusCode);

  @override
  List<Object> get props => [message, statusCode];
}

class CreateNewPassOtpStateSuccess extends RegisterState {
  final String message;

  const CreateNewPassOtpStateSuccess(this.message);

  @override
  List<Object> get props => [message];
}
