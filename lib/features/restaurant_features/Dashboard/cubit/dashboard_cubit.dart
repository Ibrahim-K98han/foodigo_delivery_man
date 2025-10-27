import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodigo/features/restaurant_features/Dashboard/model/dashboard_model.dart';

import '../../Login/bloc/restaurant_login_bloc.dart';
import '../repository/dashboard_repository.dart';
import 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final DashboardRepository _repository;
  final RestaurantLoginBloc _loginBloc;

  DashboardCubit({
    required DashboardRepository repository,
    required RestaurantLoginBloc loginBloc,
  })  : _repository = repository,
        _loginBloc = loginBloc,
        super(const DashboardInitial());

  DashboardModel? dashboardModel;

  Future<void> getDashboardData() async {
    emit(const DashboardLoading());
    final result = await _repository
        .getResDashboardData(_loginBloc.userInformation!.token);
    result.fold(
      (l) => emit(DashboardError(l.message, l.statusCode)),
      (success) {
        dashboardModel = success;
        emit(DashboardLoaded(success));
      },
    );
  }
}
