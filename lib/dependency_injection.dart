import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodigo/features/AllFood/remote/all_food_remote_data.dart';
import 'package:foodigo/features/AllFood/repository/all_food_repository.dart';
import 'package:foodigo/features/ChangeProfilePass/cubit/change_profile_pass_cubit.dart';
import 'package:foodigo/features/ChangeProfilePass/remote/change_profile_pass_remote_data_source.dart';
import 'package:foodigo/features/ChangeProfilePass/repository/change_profile_pass_repository.dart';
import 'package:foodigo/features/CityDocumentVehicle/cubit/city_document_vehicle_cubit.dart';
import 'package:foodigo/features/CityDocumentVehicle/remote/city_document_vehicle_remote_data_source.dart';
import 'package:foodigo/features/CityDocumentVehicle/repository/city_document_vehicle_repository.dart';
import 'package:foodigo/features/Dashboard/cubit/dashboard_cubit.dart';
import 'package:foodigo/features/Dashboard/repository/dashboard_repository.dart';
import 'package:foodigo/features/EarningData/cubit/earning_cubit.dart';
import 'package:foodigo/features/EarningData/remote/earning_remote_data_source.dart';
import 'package:foodigo/features/EarningData/repository/earning_repository.dart';
import 'package:foodigo/features/ForgotPassword/cubit/forgot_password_cubit.dart';
import 'package:foodigo/features/ForgotPassword/remote/forgot_password_remote_data_source.dart';
import 'package:foodigo/features/ForgotPassword/repository/forgot_password_repository.dart';
import 'package:foodigo/features/GetProfile/cubit/get_profile_cubit.dart';
import 'package:foodigo/features/GetProfile/remote/get_profile_remote_data_source.dart';
import 'package:foodigo/features/GetProfile/repository/get_profile_repository.dart';
import 'package:foodigo/features/Login/bloc/login_bloc.dart';
import 'package:foodigo/features/Login/remote/login_remote_data.dart';
import 'package:foodigo/features/Login/repository/login_repository.dart';
import 'package:foodigo/features/Order/cubit/orders_cubit.dart';
import 'package:foodigo/features/Order/remote/orders_remote_data_source.dart';
import 'package:foodigo/features/Order/repository/orders_repository.dart';
import 'package:foodigo/features/OrderStatus/cubit/order_status_cubit.dart';
import 'package:foodigo/features/OrderStatus/remote/order_status_remote_data_source.dart';
import 'package:foodigo/features/OrderStatus/repository/order_status_repository.dart';
import 'package:foodigo/features/Privacy/cubit/privacy_policy_cubit.dart';
import 'package:foodigo/features/Privacy/remote/privacy_policy_remote_data_source.dart';
import 'package:foodigo/features/Privacy/repository/privacy_policy_repository.dart';
import 'package:foodigo/features/Splash/cubit/splash_cubit.dart';
import 'package:foodigo/features/Splash/remote/splash_remote_data_source.dart';
import 'package:foodigo/features/Splash/repository/splash_repository.dart';
import 'package:foodigo/features/WithdrawData/cubit/withdraw_cubit.dart';
import 'package:foodigo/features/WithdrawData/remote/withdraw_remote_data_source.dart';
import 'package:foodigo/features/WithdrawData/repository/withdraw_repository.dart';
import 'package:foodigo/features/register/cubit/register_cubit.dart';
import 'package:foodigo/features/register/remote/register_remote_data_source.dart';
import 'package:foodigo/features/register/repository/register_repository.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/local_data_source.dart';
import 'features/AllFood/cubit/all_food_cubit.dart';
import 'features/Dashboard/remote/dashboard_remote_data_source.dart';
import 'features/ForgotPasswordVerify/cubit/forgot_password_verify_cubit.dart';
import 'features/ForgotPasswordVerify/remote/forgot_password_verify_remote_data_source.dart';
import 'features/ForgotPasswordVerify/repository/forgot_password_verify_repository.dart';

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
    RepositoryProvider<GetProfileRemoteDataSource>(
      create:
          (context) => GetProfileRemoteDataSourceImpl(client: context.read()),
    ),
    RepositoryProvider<GetProfileRepository>(
      create:
          (context) =>
              GetProfileRepositoryImpl(remoteDataSource: context.read()),
    ),

    RepositoryProvider<AllFoodRemoteDataSource>(
      create: (context) => AllFoodRemoteDataSourceImpl(client: context.read()),
    ),
    RepositoryProvider<AllFoodRepository>(
      create:
          (context) => AllFoodRepositoryImpl(remoteDataSource: context.read()),
    ),
    RepositoryProvider<RegisterRemoteDataSource>(
      create: (context) => RegisterRemoteDataSourceImpl(client: context.read()),
    ),
    RepositoryProvider<RegisterRepository>(
      create:
          (context) => RegisterRepositoryImpl(remoteDataSource: context.read()),
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

    RepositoryProvider<SplashRemoteDataSource>(
      create: (context) => SplashRemoteDataSourceImpl(client: context.read()),
    ),
    RepositoryProvider<SplashRepository>(
      create:
          (context) => SplashRepositoryImpl(remoteDataSource: context.read()),
    ),

    RepositoryProvider<PrivacyPolicyRemoteDataSource>(
      create:
          (context) =>
              PrivacyPolicyRemoteDataSourceImpl(client: context.read()),
    ),
    RepositoryProvider<PrivacyPolicyRepository>(
      create:
          (context) =>
              PrivacyPolicyRepositoryImpl(remoteDataSource: context.read()),
    ),

    RepositoryProvider<ForgotPasswordVerifyRemoteDataSource>(
      create:
          (context) =>
              ForgotPasswordVerifyRemoteDataSourceImpl(client: context.read()),
    ),
    RepositoryProvider<ForgotPasswordVerifyRepository>(
      create:
          (context) => ForgotPasswordVerifyRepositoryImpl(
            remoteDataSource: context.read(),
          ),
    ),

    RepositoryProvider<CityDocumentVehicleRemoteDataSource>(
      create:
          (context) =>
              CityDocumentVehicleRemoteDataSourceImpl(client: context.read()),
    ),
    RepositoryProvider<CityDocumentVehicleRepository>(
      create:
          (context) => CityDocumentVehicleRepositoryImpl(
            remoteDataSource: context.read(),
          ),
    ),

    RepositoryProvider<EarningRemoteDataSource>(
      create: (context) => EarningRemoteDataSourceImpl(client: context.read()),
    ),
    RepositoryProvider<EarningRepository>(
      create:
          (context) => EarningRepositoryImpl(remoteDataSource: context.read()),
    ),

    RepositoryProvider<WithdrawRemoteDataSource>(
      create: (context) => WithdrawRemoteDataSourceImpl(client: context.read()),
    ),
    RepositoryProvider<WithdrawRepository>(
      create:
          (context) => WithdrawRepositoryImpl(remoteDataSource: context.read()),
    ),

    RepositoryProvider<OrdersRemoteDataSource>(
      create: (context) => OrdersRemoteDataSourceImpl(client: context.read()),
    ),
    RepositoryProvider<OrdersRepository>(
      create:
          (context) => OrdersRepositoryImpl(remoteDataSource: context.read()),
    ),

    RepositoryProvider<OrderStatusRemoteDataSource>(
      create:
          (context) => OrderStatusRemoteDataSourceImpl(client: context.read()),
    ),
    RepositoryProvider<OrderStatusRepository>(
      create:
          (context) =>
              OrderStatusRepositoryImpl(remoteDataSource: context.read()),
    ),
  ];

  static final blocProvider = <BlocProvider>[
    BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(repository: context.read()),
    ),

    BlocProvider<GetProfileCubit>(
      create:
          (context) => GetProfileCubit(
            repository: context.read(),
            loginBloc: context.read(),
          ),
    ),

    BlocProvider<AllFoodCubit>(
      create:
          (context) => AllFoodCubit(
            repository: context.read(),
            loginBloc: context.read(),
          ),
    ),
    BlocProvider<RegisterCubit>(
      create: (context) => RegisterCubit(registerRepository: context.read()),
    ),
    BlocProvider<ForgotPasswordCubit>(
      create:
          (context) => ForgotPasswordCubit(
            forgotPasswordRepository: context.read(),
            login_bloc: context.read(),
          ),
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

    BlocProvider<SplashCubit>(
      create:
          (context) => SplashCubit(
            repository: context.read(),
            loginBloc: context.read(),
          ),
    ),
    BlocProvider<PrivacyPolicyCubit>(
      create:
          (context) => PrivacyPolicyCubit(
            repository: context.read(),
            loginBloc: context.read(),
          ),
    ),

    BlocProvider<ForgotPasswordVerifyCubit>(
      create:
          (context) => ForgotPasswordVerifyCubit(
            forgotPasswordRepository: context.read(),
          ),
    ),
    BlocProvider<CityDocumentVehicleCubit>(
      create: (context) => CityDocumentVehicleCubit(repository: context.read()),
    ),
    BlocProvider<EarningCubit>(
      create:
          (context) => EarningCubit(
            repository: context.read(),
            loginBloc: context.read(),
          ),
    ),

    BlocProvider<WithdrawCubit>(
      create:
          (context) => WithdrawCubit(
            repository: context.read(),
            loginBloc: context.read(),
          ),
    ),

    BlocProvider<OrdersCubit>(
      create:
          (context) => OrdersCubit(
            repository: context.read(),
            loginBloc: context.read(),
          ),
    ),

    BlocProvider<OrderStatusCubit>(
      create:
          (context) => OrderStatusCubit(
            repository: context.read(),
            loginBloc: context.read(),
          ),
    ),
  ];
}
