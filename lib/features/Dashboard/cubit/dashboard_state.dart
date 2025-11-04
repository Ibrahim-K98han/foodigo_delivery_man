import 'package:equatable/equatable.dart';
import 'package:foodigo/features/Dashboard/model/splash_model.dart';
import 'package:foodigo/features/register/model/city_model.dart';
import 'package:foodigo/features/Dashboard/model/dashboard_model.dart';

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


//Splash
class SplashLoading extends DashboardState {
  const SplashLoading();

  @override
  List<Object?> get props => [];
}

class SplashError extends DashboardState {
  final String message;
  final int statusCode;

  const SplashError(this.message, this.statusCode);

  @override
  List<Object?> get props => [message, statusCode];
}

class SplashLoaded extends DashboardState {
  final SplashModel splashModel;

  const SplashLoaded(this.splashModel);

  @override
  List<Object?> get props => [splashModel];
}