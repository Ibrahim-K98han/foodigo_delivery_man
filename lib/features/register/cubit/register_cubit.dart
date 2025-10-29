import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodigo/data/remote_url.dart';
import 'package:foodigo/features/register/cubit/register_state.dart';
import 'package:foodigo/features/register/model/register_state_model.dart';
import 'package:foodigo/features/register/repository/register_repository.dart';

import '../../../data/errors/failure.dart';

class RegisterCubit extends Cubit<RegisterStateModel> {
  final RegisterRepository _repository;

  RegisterCubit({required RegisterRepository registerRepository})
    : _repository = registerRepository,
      super(RegisterStateModel.init());

  // CityModel? cityModel;

  Timer? _resendTimer;

  @override
  Future<void> close() {
    _resendTimer?.cancel();
    return super.close();
  }

  void addTabNumber(int tab) {
    emit(state.copyWith(activeTab: tab));
  }

  void changeFName(String text) {
    emit(state.copyWith(fname: text, registerState: const RegisterInitial()));
  }

  void changeLName(String text) {
    emit(state.copyWith(lname: text, registerState: const RegisterInitial()));
  }

  void changeGender(String text) {
    emit(state.copyWith(gender: text, registerState: const RegisterInitial()));
  }

  void changeVehicleType(String text) {
    emit(
      state.copyWith(
        vehicleTypeId: text,
        registerState: const RegisterInitial(),
      ),
    );
  }

  void changeVehicleNumber(String text) {
    emit(
      state.copyWith(
        vehicleNumber: text,
        registerState: const RegisterInitial(),
      ),
    );
  }

  void changeCountryCode(String text) {
    emit(
      state.copyWith(countryCode: text, registerState: const RegisterInitial()),
    );
  }

  void changePhone(String text) {
    emit(state.copyWith(phone: text, registerState: const RegisterInitial()));
  }

  void changeEmail(String text) {
    emit(state.copyWith(email: text, registerState: const RegisterInitial()));
  }

  void changeDateOfBirth(String text) {
    emit(
      state.copyWith(dateOfBirth: text, registerState: const RegisterInitial()),
    );
  }

  void changeCity(String text) {
    emit(state.copyWith(cityId: text, registerState: const RegisterInitial()));
  }

  void changeDocumentType(String text) {
    emit(
      state.copyWith(
        documentTypeId: text,
        registerState: const RegisterInitial(),
      ),
    );
  }

  void changeDocumentNumber(String text) {
    emit(
      state.copyWith(
        documentNumber: text,
        registerState: const RegisterInitial(),
      ),
    );
  }

  void changeShortNote(String text) {
    emit(
      state.copyWith(shortNote: text, registerState: const RegisterInitial()),
    );
  }

  void changeZipCode(String text) {
    emit(state.copyWith(zipCode: text, registerState: const RegisterInitial()));
  }

  void changeProfilImg(String text) {
    emit(
      state.copyWith(profileImg: text, registerState: const RegisterInitial()),
    );
  }

  void changeVehicleImg(String text) {
    emit(
      state.copyWith(
        vehicleImage: text,
        registerState: const RegisterInitial(),
      ),
    );
  }

  void changeDocumentImg(String text) {
    emit(
      state.copyWith(document: text, registerState: const RegisterInitial()),
    );
  }

  void changeAddress(String text) {
    emit(state.copyWith(address: text, registerState: const RegisterInitial()));
  }

  void changePassword(String text) {
    emit(
      state.copyWith(password: text, registerState: const RegisterInitial()),
    );
  }

  void changeConPassword(String text) {
    emit(
      state.copyWith(
        confirmPassword: text,
        registerState: const RegisterInitial(),
      ),
    );
  }

  void showPassword() {
    emit(
      state.copyWith(
        showPassword: !state.showPassword,
        registerState: const RegisterInitial(),
      ),
    );
  }

  void showConfirmPassword() {
    emit(
      state.copyWith(
        showConPassword: !state.showConPassword,
        registerState: const RegisterInitial(),
      ),
    );
  }

  void privacyPolicy() {
    emit(
      state.copyWith(
        isActive: !state.isActive,
        registerState: const RegisterInitial(),
      ),
    );
  }

  void otpChange(String text) {
    emit(state.copyWith(otp: text));
  }

  Future<void> registerStepOne() async {
    print('Register Step One: ${state.toMap()}');
    emit(state.copyWith(registerState: RegisterStateOneLoading()));
    final result = await _repository.registerStepOne(state);
    result.fold(
      (failure) {
        if (failure is InvalidAuthData) {
          final errors = RegisterValidateStateError(failure.errors);
          emit(state.copyWith(registerState: errors));
        } else {
          final errors = RegisterStateOneError(
            failure.message,
            failure.statusCode,
          );
          emit(state.copyWith(registerState: errors));
        }
      },
      (success) {
        emit(state.copyWith(registerState: RegisterStateOneSuccess(success)));
      },
    );
  }

  Future<void> registerStepTwo() async {
    print('Register Step Two: ${state.toMap()}');
    emit(state.copyWith(registerState: RegisterStateTwoLoading()));

    final result = await _repository.registerStepTwo(
      state,
      Uri.parse(RemoteUrls.registerStepTwo),
    );
    result.fold(
      (failure) {
        if (failure is InvalidAuthData) {
          final errors = RegisterValidateStateError(failure.errors);
          emit(state.copyWith(registerState: errors));
        } else {
          final errors = RegisterStateTwoError(
            failure.message,
            failure.statusCode,
          );
          emit(state.copyWith(registerState: errors));
        }
      },
      (success) {
        emit(state.copyWith(registerState: RegisterStateTwoSuccess(success)));
      },
    );
  }

  Future<void> registerStepThree() async {
    print('Register Step Three: ${state.toMap()}');
    emit(state.copyWith(registerState: RegisterStateThreeLoading()));
    final result = await _repository.registerStepThree(
      state,
      Uri.parse(RemoteUrls.registerStepThree),
    );
    result.fold(
      (failure) {
        if (failure is InvalidAuthData) {
          final errors = RegisterValidateStateError(failure.errors);
          emit(state.copyWith(registerState: errors));
        } else {
          final errors = RegisterStateThreeError(
            failure.message,
            failure.statusCode,
          );
          emit(state.copyWith(registerState: errors));
        }
      },
      (success) {
        emit(state.copyWith(registerState: RegisterStateThreeSuccess(success)));
      },
    );
  }

  // Future<void> getCityData() async {
  //   emit(state.copyWith(registerState: const CityLoading()));
  //   final result = await _repository.getCityData();
  //   result.fold(
  //     (l) => emit(
  //       state.copyWith(registerState: CityError(l.message, l.statusCode)),
  //     ),
  //     (success) {
  //       cityModel = success;
  //       emit(state.copyWith(registerState: CityLoaded(success)));
  //     },
  //   );
  // }

  Future<void> verifyRegOtp(String email) async {
    emit(state.copyWith(registerState: RegisterOtpStateLoading()));
    final result = await _repository.verifyRegOtp(state, email);
    result.fold(
      (failure) {
        final errors = RegisterOtpStateError(
          failure.message,
          failure.statusCode,
        );
        emit(state.copyWith(registerState: errors));
      },
      (success) {
        final userLoaded = RegisterOtpStateSuccess(success);
        emit(state.copyWith(registerState: userLoaded));
      },
    );
  }

  Future<void> resendVerificationCode() async {
    emit(state.copyWith(registerState: const SignUpStateResendCodeLoading()));
    final body = {'email': state.email, 'lang_code': state.languageCode};
    print('verification email $body');
    final result = await _repository.resendVerificationCode(body);
    result.fold(
      (failure) {
        if (failure is InvalidAuthData) {
          final errors = SignUpStateFormValidate(failure.errors);
          emit(state.copyWith(registerState: errors));
        } else {
          final errors = SignUpStateError(failure.message, failure.statusCode);
          emit(state.copyWith(registerState: errors));
        }
      },
      (success) {
        emit(
          state.copyWith(registerState: SignUpStateResendCodeLoaded(success)),
        );
      },
    );
  }

  Future<void> clearAllField() async {
    emit(RegisterStateModel.init());
  }
}
