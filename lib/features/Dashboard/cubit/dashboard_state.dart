import 'package:equatable/equatable.dart';
import '../model/dashboard_model.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object?> get props => [];
}

class DashboardInitial extends DashboardState {
  const DashboardInitial();

  @override
  List<Object?> get props => [];
}

class DashboardLoading extends DashboardState {
  const DashboardLoading();

  @override
  List<Object?> get props => [];
}

class DashboardLoaded extends DashboardState {
  final DashboardModel dashboardModel;

  const DashboardLoaded(this.dashboardModel);

  @override
  List<Object?> get props => [dashboardModel];
}


class DashboardSuccess extends DashboardState {
  final DashboardModel dashboardModel;

  const DashboardSuccess(this.dashboardModel);

  @override
  List<Object?> get props => [dashboardModel];
}

class DashboardError extends DashboardState {
  final String message;
  final int statusCode;

  const DashboardError(this.message, this.statusCode);

  @override
  List<Object?> get props => [message, statusCode];
}

