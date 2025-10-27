import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodigo_delivery_man/features/ChangeProfilePass/cubit/change_profile_pass_cubit.dart';
import 'package:foodigo_delivery_man/features/ChangeProfilePass/remote/change_profile_pass_remote_data_source.dart';
import 'package:foodigo_delivery_man/features/ChangeProfilePass/repository/change_profile_pass_repository.dart';
import 'package:foodigo_delivery_man/features/Dashboard/cubit/dashboard_cubit.dart';
import 'package:foodigo_delivery_man/features/Dashboard/remote/dashboard_remote_data_source.dart';
import 'package:foodigo_delivery_man/features/Dashboard/repository/dashboard_repository.dart';
import 'package:foodigo_delivery_man/features/ForgotPassword/remote/forgot_password_remote_data_source.dart';
import 'package:foodigo_delivery_man/features/ForgotPassword/repository/forgot_password_repository.dart';
import 'package:foodigo_delivery_man/features/Login/bloc/login_bloc.dart';
import 'package:foodigo_delivery_man/features/Login/remote/login_remote_data.dart';
import 'package:foodigo_delivery_man/features/Login/repository/login_repository.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/local_data_source.dart';
class DInjector {
  static late final SharedPreferences _sharedPreferences;

  static Future<void> initDB() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static final repositoryProvider = <RepositoryProvider>[
    RepositoryProvider<SharedPreferences>(
      create: (context) => _sharedPreferences,
    ),
    RepositoryProvider<Client>(create: (context) => Client()),
    RepositoryProvider<LocalDataSources>(
      create:
          (context) => LocalDataSourcesImpl(sharedPreferences: context.read()),
    ),

    RepositoryProvider<LoginRemoteDataSource>(
      create: (context) => LoginRemoteDataSourceImpl(client: context.read()),
    ),
    RepositoryProvider<LoginRepository>(
      create:
          (context) => LoginRepositoryImpl(
            remoteDataSources: context.read(),
            localDataSources: context.read(),
          ),
    ),
    RepositoryProvider<ForgotPasswordRemoteDataSource>(
      create:
          (context) =>
              ForgotPasswordRemoteDataSourceImpl(client: context.read()),
    ),
    RepositoryProvider<ForgotPasswordRepository>(
      create:
          (context) =>
              ForgotPasswordRepositoryImpl(remoteDataSource: context.read()),
    ),
    RepositoryProvider<ChangeProfilePassRemoteDataSource>(
      create:
          (context) =>
              ChangeProfilePassRemoteDataSourceImpl(client: context.read()),
    ),
    RepositoryProvider<ChangeProfilePassRepository>(
      create:
          (context) =>
              ChangeProfilePassRepositoryImpl(remoteDataSource: context.read()),
    ),
    RepositoryProvider<DashboardRemoteDataSource>(
      create:
          (context) => DashboardRemoteDataSourceImpl(client: context.read()),
    ),
    RepositoryProvider<DashboardRepository>(
      create:
          (context) =>
              DashboardRepositoryImpl(remoteDataSource: context.read()),
    ),
  ];

  static final blocProvider = <BlocProvider>[
    BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(repository: context.read()),
    ),
  
    BlocProvider<ChangeProfilePassCubit>(
      create:
          (context) => ChangeProfilePassCubit(
            registerRepository: context.read(),
            loginBloc: context.read(),
          ),
    ),
    BlocProvider<DashboardCubit>(
      create:
          (context) => DashboardCubit(
            repository: context.read(),
            loginBloc: context.read(),
          ),
    ),
  ];
}
