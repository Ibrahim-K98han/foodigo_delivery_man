import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodigo/data/remote_url.dart';
import 'package:foodigo/features/ForgotPassword/cubit/forgot_password_state.dart';
import 'package:foodigo/features/ForgotPassword/cubit/forgot_password_state_model.dart';
import 'package:foodigo/features/ForgotPassword/repository/forgot_password_repository.dart';
import 'package:foodigo/features/Login/bloc/login_bloc.dart';
import 'package:foodigo/utils/utils.dart';

import '../../../data/errors/failure.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordStateModel> {
  final ForgotPasswordRepository _repository;
  final LoginBloc _loginBloc;

  ForgotPasswordCubit({
    required ForgotPasswordRepository forgotPasswordRepository,
    required LoginBloc login_bloc,
  }) : _repository = forgotPasswordRepository,
       _loginBloc = login_bloc,
       super(ForgotPasswordStateModel.init());

  void changeEmail(String text) {
    emit(state.copyWith(email: text));
  }

  void currentPass(String text) {
    emit(
      state.copyWith(
        currentPassword: text,
        passwordState: const ForgotPasswordStateInitial(),
      ),
    );
  }

  void password(String text) {
    emit(
      state.copyWith(
        password: text,
        passwordState: const ForgotPasswordStateInitial(),
      ),
    );
  }

  void passwordConfirmation(String text) {
    emit(
      state.copyWith(
        passwordConfirmation: text,
        passwordState: const ForgotPasswordStateInitial(),
      ),
    );
  }

  void showCurrentPassword() {
    emit(
      state.copyWith(
        showCurrentPassword: !state.showCurrentPassword,
        passwordState: const ForgotPasswordStateInitial(),
      ),
    );
  }

  void showPassword() {
    emit(
      state.copyWith(
        showPassword: !state.showPassword,
        passwordState: const ForgotPasswordStateInitial(),
      ),
    );
  }

  void showPasswordConfirmation() {
    emit(
      state.copyWith(
        showPasswordConfirmation: !state.showPasswordConfirmation,
        passwordState: const ForgotPasswordStateInitial(),
      ),
    );
  }

  void newPass(String text) {
    emit(
      state.copyWith(
        newPass: text,
        passwordState: const ForgotPasswordStateInitial(),
      ),
    );
  }

  void conPass(String text) {
    emit(
      state.copyWith(
        conPass: text,
        passwordState: const ForgotPasswordStateInitial(),
      ),
    );
  }

  void showNewPassword() {
    emit(
      state.copyWith(
        showNewPass: !state.showNewPass,
        passwordState: const ForgotPasswordStateInitial(),
      ),
    );
  }

  void showConPassword() {
    emit(
      state.copyWith(
        showConPass: !state.showConPass,
        passwordState: const ForgotPasswordStateInitial(),
      ),
    );
  }

  void forgotOtpChange(String text) {
    print('state cubit otp:$text');
    emit(
      state.copyWith(
        otp: text,
        passwordState: const ForgotPasswordStateInitial(),
      ),
    );
  }

  Future<void> forgotPasswordCode() async {
    emit(state.copyWith(passwordState: const ForgotPasswordStateLoading()));
    final body = {'email': state.email, 'lang_code': state.languageCode};
    print('verification email $body');
    final result = await _repository.forgotPassword(body);
    result.fold(
      (failure) {
        if (failure is InvalidAuthData) {
          final errors = ForgotPasswordFormValidateError(failure.errors);
          emit(state.copyWith(passwordState: errors));
        } else {
          final errors = ForgotPasswordStateError(
            failure.message,
            failure.statusCode,
          );
          emit(state.copyWith(passwordState: errors));
        }
      },
      (successMessage) {
        emit(
          state.copyWith(
            passwordState: ForgotPasswordStateLoaded(successMessage),
          ),
        );
      },
    );
  }

  // Future<void> verifyForgetOtp(String email, String otp) async {
  //   print("Cubit OTP: $otp");
  //   emit(state.copyWith(passwordState: ForgotPassOtpStateLoading()));
  //   final result = await _repository.verifyForgotOtp(
  //     ForgotPasswordStateModel(email: state.email, otp: otp),
  //     email,
  //   );
  //   result.fold(
  //     (failure) {
  //       final errors = ForgotPssOtpStateError(
  //         failure.message,
  //         failure.statusCode,
  //       );
  //       emit(state.copyWith(passwordState: errors));
  //     },
  //     (success) {
  //       final userLoaded = ForgotPassOtpStateSuccess(success);
  //       emit(state.copyWith(passwordState: userLoaded));
  //     },
  //   );
  // }

  Future<void> verifyForgetPassOtp(String email) async {
    // print("Cubit Forgot Pass OTP: $otp");
    emit(state.copyWith(passwordState: ForgotPassOtpVerifyStateLoading()));
    final result = await _repository.verifyForgotPassOtp(state);
    result.fold(
      (failure) {
        final errors = ForgotPssOtpVerifyStateError(
          failure.message,
          failure.statusCode,
        );
        emit(state.copyWith(passwordState: errors));
      },
      (success) {
        final userLoaded = ForgotPassOtpVerifyStateSuccess(success);
        emit(state.copyWith(passwordState: userLoaded));
      },
    );
  }

  Future<void> updatePassword(String email, String otp) async {
    emit(
      state.copyWith(passwordState: const ForgotPasswordResetStateLoading()),
    );
    debugPrint('update-password-languageCode ${state.languageCode}');
    final result = await _repository.resetPassword(state);
    result.fold(
      (failure) {
        if (failure is InvalidAuthData) {
          final errors = ForgotPasswordResetFormValidateError(failure.errors);
          emit(state.copyWith(passwordState: errors));
        } else {
          final errors = ForgotPasswordResetStateError(
            failure.message,
            failure.statusCode,
          );
          emit(state.copyWith(passwordState: errors));
        }
      },
      (data) {
        emit(state.copyWith(passwordState: PasswordResetStateUpdated(data)));
      },
    );
  }

  Future<void> changePassword() async {
    emit(state.copyWith(passwordState: const UpdatePasswordStateLoading()));
    final uri = Utils.tokenWithCode(
      RemoteUrls.updatePassword,
      _loginBloc.userInformation!.token,
      _loginBloc.state.languageCode,
    );
    final result = await _repository.updatePassword(
      state,
      uri,
      _loginBloc.userInformation!.token,
    );
    result.fold(
      (failure) {
        if (failure is InvalidAuthData) {
          final errors = UpdatePasswordFormValidateError(failure.errors);
          emit(state.copyWith(passwordState: errors));
        } else {
          final errors = UpdatePasswordStateError(
            failure.message,
            failure.statusCode,
          );
          emit(state.copyWith(passwordState: errors));
        }
      },
      (success) {
        emit(
          state.copyWith(passwordState: UpdatePasswordStateSuccess(success)),
        );
      },
    );
  }

  void clear() {
    emit(
      state.copyWith(
        currentPassword: '',
        password: '',
        passwordConfirmation: '',
        newPass: '',
        conPass: '',
        showNewPass: true,
        showConPass: true,
        passwordState: const ForgotPasswordStateInitial(),
      ),
    );
  }
}
