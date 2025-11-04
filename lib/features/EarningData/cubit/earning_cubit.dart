import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodigo/features/Login/bloc/login_bloc.dart';
import '../model/earning_model.dart';
import '../repository/earning_repository.dart';
import 'earning_state.dart';

class EarningCubit extends Cubit<EarningState> {
  final EarningRepository _repository;
  final LoginBloc _loginBloc;

  EarningCubit({
    required EarningRepository repository,
    required LoginBloc loginBloc,
  })  : _repository = repository,
        _loginBloc = loginBloc,
        super(const EarningStateInitial());

  EarningModel? earningModel;

  /// Get Earning Data
  Future<void> getEarning() async {
    emit(const EarningStateLoading());
    final result =
        await _repository.getEarning(_loginBloc.userInformation!.token);
    result.fold(
      (failure) => emit(EarningStateError(failure.message, failure.statusCode)),
      (success) {
        earningModel = success;
        emit(EarningStateLoaded(success));
      },
    );
  }
}
