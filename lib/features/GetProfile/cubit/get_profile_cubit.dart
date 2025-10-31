import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodigo_delivery_man/features/Login/bloc/login_bloc.dart';
import 'package:foodigo_delivery_man/features/Login/model/user_response_model.dart';

import '../../../data/remote_url.dart';
import '../../../utils/utils.dart';
import '../repository/get_profile_repository.dart';
import 'get_profile_state.dart';

class GetProfileCubit extends Cubit<User> {
  final GetProfileRepository _repository;
  final LoginBloc _loginBloc;

  GetProfileCubit({
    required GetProfileRepository repository,
    required LoginBloc loginBloc,
  }) : _repository = repository,
       _loginBloc = loginBloc,
       super(User.init());

  User? user;

  void name(String text) {
    emit(state.copyWith(lname: text));
  }

  void lname(String text) {
    emit(state.copyWith(lname: text));
  }

  void email(String email) {
    emit(state.copyWith(email: email));
  }

  void phone(String phone) {
    emit(state.copyWith(phone: phone));
  }
  void city(String city) {
    emit(state.copyWith(cityId: city));
  }

  void image(String image) {
    emit(state.copyWith(profileImage: image));
  }
  void zip(String text) {
    emit(state.copyWith(zipCode: text));
  }
  void address(String text) {
    emit(state.copyWith(address: text));
  }

  Future<void> getProfileData() async {
    if (_loginBloc.userInformation?.token.isNotEmpty ?? false) {
      emit(state.copyWith(getProfileState: GetProfileLoading()));
      final uri = Utils.tokenWithCode(
        RemoteUrls.getProfile,
        _loginBloc.userInformation!.token,
        _loginBloc.state.languageCode,
      );
      print('Profile=============$uri');
      print('User Token: ${_loginBloc.userInformation?.token}');
      final result = await _repository.getProfileData(
        uri,
        _loginBloc.userInformation!.token,
      );
      result.fold(
        (failure) {
          final errorState = GetProfileError(
            failure.message,
            failure.statusCode,
          );
          emit(state.copyWith(getProfileState: errorState));
        },
        (success) {
          user = success;
          if (user != null) {
            emit(state.copyWith(fname: user!.fname));
            emit(state.copyWith(lname: user!.lname));
            emit(state.copyWith(email: user!.email));
            emit(state.copyWith(phone: user!.phone));
            emit(state.copyWith(address: user!.address));
            emit(state.copyWith(zipCode: user!.zipCode));
            emit(state.copyWith(cityId: user!.cityId));
            emit(state.copyWith(profileImage: user!.profileImage));
          }
          final successState = GetProfileLoaded(success);
          emit(state.copyWith(getProfileState: successState));
        },
      );
    } else {
      final errors = GetProfileError('', 401);
      emit(state.copyWith(getProfileState: errors));
    }
  }

  // Future<void> updateProfile() async {
  //   emit(state.copyWith(getProfileState: UpdateProfileLoading()));
  //   final uri = Utils.tokenWithCode(
  //     RemoteUrls.updateProfile,
  //     _loginBloc.userInformation!.token,
  //     _loginBloc.state.languageCode,
  //   );
  //   print('Update Profile $uri');
  //   try {
  //     final result = await _repository.updateProfile(
  //       state,
  //       uri,
  //       _loginBloc.userInformation!.token,
  //     );
  //     result.fold(
  //       (failure) {
  //         emit(
  //           state.copyWith(
  //             getProfileState: UpdateProfileError(
  //               failure.message,
  //               failure.statusCode,
  //             ),
  //           ),
  //         );
  //       },
  //       (success) {
  //         user = success;
  //         emit(state.copyWith(getProfileState: UpdateProfileLoaded(success)));
  //         // clearState();
  //       },
  //     );
  //   } catch (e) {
  //     emit(
  //       state.copyWith(getProfileState: UpdateProfileError(e.toString(), 500)),
  //     );
  //   }
  // }

  // void clearState() {
  //   emit(const ProfileStateModel());
  // }
}
