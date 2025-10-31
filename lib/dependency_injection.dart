import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodigo_delivery_man/features/ChangeProfilePass/cubit/change_profile_pass_cubit.dart';
import 'package:foodigo_delivery_man/features/ChangeProfilePass/remote/change_profile_pass_remote_data_source.dart';
import 'package:foodigo_delivery_man/features/ChangeProfilePass/repository/change_profile_pass_repository.dart';
import 'package:foodigo_delivery_man/features/CityDocumentVehicle/cubit/city_document_vehicle_cubit.dart';
import 'package:foodigo_delivery_man/features/CityDocumentVehicle/remote/city_document_vehicle_remote_data_source.dart';
import 'package:foodigo_delivery_man/features/CityDocumentVehicle/repository/city_document_vehicle_repository.dart';
import 'package:foodigo_delivery_man/features/Dashboard/cubit/dashboard_cubit.dart';
import 'package:foodigo_delivery_man/features/Dashboard/remote/dashboard_remote_data_source.dart';
import 'package:foodigo_delivery_man/features/Dashboard/repository/dashboard_repository.dart';
import 'package:foodigo_delivery_man/features/ForgotPassword/cubit/forgot_password_cubit.dart';
import 'package:foodigo_delivery_man/features/ForgotPassword/remote/forgot_password_remote_data_source.dart';
import 'package:foodigo_delivery_man/features/ForgotPassword/repository/forgot_password_repository.dart';
import 'package:foodigo_delivery_man/features/GetProfile/cubit/get_profile_cubit.dart';
import 'package:foodigo_delivery_man/features/GetProfile/remote/get_profile_remote_data_source.dart';
import 'package:foodigo_delivery_man/features/GetProfile/repository/get_profile_repository.dart';
import 'package:foodigo_delivery_man/features/Login/bloc/login_bloc.dart';
import 'package:foodigo_delivery_man/features/Login/remote/login_remote_data.dart';
import 'package:foodigo_delivery_man/features/Login/repository/login_repository.dart';
import 'package:foodigo_delivery_man/features/Privacy/cubit/privacy_policy_cubit.dart';
import 'package:foodigo_delivery_man/features/Privacy/remote/privacy_policy_remote_data_source.dart';
import 'package:foodigo_delivery_man/features/Privacy/repository/privacy_policy_repository.dart';
import 'package:foodigo_delivery_man/features/Splash/cubit/splash_cubit.dart';
import 'package:foodigo_delivery_man/features/Splash/remote/splash_remote_data_source.dart';
import 'package:foodigo_delivery_man/features/Splash/repository/splash_repository.dart';
import 'package:foodigo_delivery_man/features/register/cubit/register_cubit.dart';
import 'package:foodigo_delivery_man/features/register/remote/register_remote_data_source.dart';
import 'package:foodigo_delivery_man/features/register/repository/register_repository.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/local_data_source.dart';
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
    // RepositoryProvider<AddCartRemoteDataSource>(
    //   create: (context) => AddCartRemoteDataSourceImpl(client: context.read()),
    // ),
    // RepositoryProvider<AddCartRepository>(
    //   create:
    //       (context) => AddCartRepositoryImpl(remoteDataSource: context.read()),
    // ),
    // RepositoryProvider<GetAddressRemoteDataSource>(
    //   create:
    //       (context) => GetAddressRemoteDataSourceImpl(client: context.read()),
    // ),
    // RepositoryProvider<GetAddressRepository>(
    //   create:
    //       (context) =>
    //           GetAddressRepositoryImpl(remoteDataSource: context.read()),
    // ),
    // RepositoryProvider<CheckoutRemoteDataSource>(
    //   create: (context) => CheckoutRemoteDataSourceImpl(client: context.read()),
    // ),
    // RepositoryProvider<CheckoutRepository>(
    //   create:
    //       (context) => CheckoutRepositoryImpl(remoteDataSource: context.read()),
    // ),
    // RepositoryProvider<OrderRemoteDataSource>(
    //   create: (context) => OrderRemoteDataSourceImpl(client: context.read()),
    // ),
    // RepositoryProvider<OrderRepository>(
    //   create:
    //       (context) => OrderRepositoryImpl(remoteDataSource: context.read()),
    // ),
    // RepositoryProvider<WishListRemoteDataSource>(
    //   create: (context) => WishListRemoteDataSourceImpl(client: context.read()),
    // ),
    // RepositoryProvider<WishListRepository>(
    //   create:
    //       (context) => WishListRepositoryImpl(remoteDataSource: context.read()),
    // ),
    // RepositoryProvider<ReviewRemoteDataSource>(
    //   create: (context) => ReviewRemoteDataSourceImpl(client: context.read()),
    // ),
    // RepositoryProvider<ReviewRepository>(
    //   create:
    //       (context) => ReviewRepositoryImpl(remoteDataSource: context.read()),
    // ),
    // RepositoryProvider<AllFoodRemoteDataSource>(
    //   create: (context) => AllFoodRemoteDataSourceImpl(client: context.read()),
    // ),
    // RepositoryProvider<AllFoodRepository>(
    //   create:
    //       (context) => AllFoodRepositoryImpl(remoteDataSource: context.read()),
    // ),
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
    // RepositoryProvider<ApplyCouponRemoteDataSource>(
    //   create:
    //       (context) => ApplyCouponRemoteDataSourceImpl(client: context.read()),
    // ),
    // RepositoryProvider<ApplyCouponRepository>(
    //   create:
    //       (context) =>
    //           ApplyCouponRepositoryImpl(remoteDataSource: context.read()),
    // ),
    // RepositoryProvider<PaymentMethodRemoteDataSource>(
    //   create:
    //       (context) =>
    //           PaymentMethodRemoteDataSourceImpl(client: context.read()),
    // ),
    // RepositoryProvider<PaymentMethodRepository>(
    //   create:
    //       (context) =>
    //           PaymentMethodRepositoryImpl(remoteDataSource: context.read()),
    // ),
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
    // RepositoryProvider<SubscriptionRemoteDataSource>(
    //   create:
    //       (context) => SubscriptionRemoteDataSourceImpl(client: context.read()),
    // ),
    // RepositoryProvider<SubscriptionRepository>(
    //   create:
    //       (context) =>
    //           SubscriptionRepositoryImpl(remoteDataSource: context.read()),
    // ),
    RepositoryProvider<DashboardRemoteDataSource>(
      create:
          (context) => DashboardRemoteDataSourceImpl(client: context.read()),
    ),
    RepositoryProvider<DashboardRepository>(
      create:
          (context) =>
              DashboardRepositoryImpl(remoteDataSource: context.read()),
    ),
    // RepositoryProvider<ProductRemoteDataSource>(
    //   create: (context) => ProductRemoteDataSourceImpl(client: context.read()),
    // ),
    // RepositoryProvider<ProductRepository>(
    //   create:
    //       (context) => ProductRepositoryImpl(remoteDataSource: context.read()),
    // ),
    // RepositoryProvider<ResOrderRemoteDataSource>(
    //   create: (context) => ResOrderRemoteDataSourceImpl(client: context.read()),
    // ),
    // RepositoryProvider<ResOrderRepository>(
    //   create:
    //       (context) => ResOrderRepositoryImpl(remoteDataSource: context.read()),
    // ),
    // RepositoryProvider<ResCategoryRemoteDataSource>(
    //   create:
    //       (context) => ResCategoryRemoteDataSourceImpl(client: context.read()),
    // ),
    // RepositoryProvider<ResCategoryRepository>(
    //   create:
    //       (context) =>
    //           ResCategoryRepositoryImpl(remoteDataSource: context.read()),
    // ),
    // RepositoryProvider<StoreProductRemoteDataSource>(
    //   create:
    //       (context) => StoreProductRemoteDataSourceImpl(client: context.read()),
    // ),
    // RepositoryProvider<StoreProductRepository>(
    //   create:
    //       (context) =>
    //           StoreProductRepositoryImpl(remoteDataSource: context.read()),
    // ),
    // RepositoryProvider<RestaurantProfileRemoteDataSource>(
    //   create:
    //       (context) =>
    //           RestaurantProfileRemoteDataSourceImpl(client: context.read()),
    // ),
    // RepositoryProvider<RestaurantProfileRepository>(
    //   create:
    //       (context) =>
    //           RestaurantProfileRepositoryImpl(remoteDataSource: context.read()),
    // ),
    // RepositoryProvider<ResAddonRemoteDataSource>(
    //   create: (context) => ResAddonRemoteDataSourceImpl(client: context.read()),
    // ),
    // RepositoryProvider<ResAddonRepository>(
    //   create:
    //       (context) => ResAddonRepositoryImpl(remoteDataSource: context.read()),
    // ),
    // RepositoryProvider<ResChangePassRemoteDataSource>(
    //   create:
    //       (context) =>
    //           ResChangePassRemoteDataSourceImpl(client: context.read()),
    // ),
    // RepositoryProvider<ResChangePassRepository>(
    //   create:
    //       (context) =>
    //           ResChangePassRepositoryImpl(remoteDataSource: context.read()),
    // ),
    // RepositoryProvider<EarningRemoteDataSource>(
    //   create: (context) => EarningRemoteDataSourceImpl(client: context.read()),
    // ),
    // RepositoryProvider<EarningRepository>(
    //   create:
    //       (context) => EarningRepositoryImpl(remoteDataSource: context.read()),
    // ),
    // RepositoryProvider<WithdrawRemoteDataSource>(
    //   create: (context) => WithdrawRemoteDataSourceImpl(client: context.read()),
    // ),
    // RepositoryProvider<WithdrawRepository>(
    //   create:
    //       (context) => WithdrawRepositoryImpl(remoteDataSource: context.read()),
    // ),
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

    // RepositoryProvider<OrderStatusRemoteDataSource>(
    //   create:
    //       (context) => OrderStatusRemoteDataSourceImpl(client: context.read()),
    // ),
    // RepositoryProvider<OrderStatusRepository>(
    //   create:
    //       (context) =>
    //           OrderStatusRepositoryImpl(remoteDataSource: context.read()),
    // ),
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
  ];

  static final blocProvider = <BlocProvider>[
    BlocProvider<LoginBloc>(
      create: (context) => LoginBloc(repository: context.read()),
    ),
    // BlocProvider<RestaurantLoginBloc>(
    //   create: (context) => RestaurantLoginBloc(repository: context.read()),
    // ),
    BlocProvider<GetProfileCubit>(
      create:
          (context) => GetProfileCubit(
            repository: context.read(),
            loginBloc: context.read(),
          ),
    ),
    // BlocProvider<CartCubit>(
    //   create:
    //       (context) =>
    //           CartCubit(repository: context.read(), loginBloc: context.read()),
    // ),
    // BlocProvider<AddCartCubit>(
    //   create:
    //       (context) => AddCartCubit(
    //         repository: context.read(),
    //         loginBloc: context.read(),
    //       ),
    // ),
    // BlocProvider<GetAddressCubit>(
    //   create:
    //       (context) => GetAddressCubit(
    //         repository: context.read(),
    //         loginBloc: context.read(),
    //       ),
    // ),
    // BlocProvider<CheckoutCubit>(
    //   create:
    //       (context) => CheckoutCubit(
    //         repository: context.read(),
    //         loginBloc: context.read(),
    //       ),
    // ),
    // BlocProvider<OrderCubit>(
    //   create:
    //       (context) =>
    //           OrderCubit(repository: context.read(), loginBloc: context.read()),
    // ),
    // BlocProvider<WishListCubit>(
    //   create:
    //       (context) => WishListCubit(
    //         repository: context.read(),
    //         loginBloc: context.read(),
    //       ),
    // ),
    // BlocProvider<ReviewCubit>(
    //   create:
    //       (context) => ReviewCubit(
    //         repository: context.read(),
    //         loginBloc: context.read(),
    //       ),
    // ),
    // BlocProvider<AllFoodCubit>(
    //   create:
    //       (context) => AllFoodCubit(
    //         repository: context.read(),
    //         loginBloc: context.read(),
    //       ),
    // ),
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
    // BlocProvider<ApplyCouponCubit>(
    //   create:
    //       (context) => ApplyCouponCubit(
    //         repository: context.read(),
    //         loginBloc: context.read(),
    //       ),
    // ),
    // BlocProvider<PaymentCubit>(
    //   create:
    //       (context) => PaymentCubit(
    //         repository: context.read(),
    //         loginBloc: context.read(),
    //       ),
    // ),
    BlocProvider<ChangeProfilePassCubit>(
      create:
          (context) => ChangeProfilePassCubit(
            registerRepository: context.read(),
            loginBloc: context.read(),
          ),
    ),
    // BlocProvider<SubscriptionCubit>(
    //   create:
    //       (context) => SubscriptionCubit(
    //         repository: context.read(),
    //         loginBloc: context.read(),
    //       ),
    // ),
    BlocProvider<DashboardCubit>(
      create:
          (context) => DashboardCubit(
            repository: context.read(),
            loginBloc: context.read(),
          ),
    ),
    // BlocProvider<ProductCubit>(
    //   create:
    //       (context) => ProductCubit(
    //         repository: context.read(),
    //         loginBloc: context.read(),
    //       ),
    // ),
    // BlocProvider<ResOrderCubit>(
    //   create:
    //       (context) => ResOrderCubit(
    //         repository: context.read(),
    //         loginBloc: context.read(),
    //       ),
    // ),
    // BlocProvider<ResCategoriesCubit>(
    //   create:
    //       (context) => ResCategoriesCubit(
    //         repository: context.read(),
    //         loginBloc: context.read(),
    //       ),
    // ),
    // BlocProvider<StoreProductCubit>(
    //   create:
    //       (context) => StoreProductCubit(
    //         repository: context.read(),
    //         loginBloc: context.read(),
    //       ),
    // ),
    // BlocProvider<RestaurantProfileCubit>(
    //   create:
    //       (context) => RestaurantProfileCubit(
    //         repository: context.read(),
    //         loginBloc: context.read(),
    //       ),
    // ),
    // BlocProvider<ResAddonsCubit>(
    //   create:
    //       (context) => ResAddonsCubit(
    //         repository: context.read(),
    //         loginBloc: context.read(),
    //       ),
    // ),
    // BlocProvider<ResChangePassCubit>(
    //   create:
    //       (context) => ResChangePassCubit(
    //         registerRepository: context.read(),
    //         loginBloc: context.read(),
    //       ),
    // ),
    // BlocProvider<EarningCubit>(
    //   create:
    //       (context) => EarningCubit(
    //         repository: context.read(),
    //         loginBloc: context.read(),
    //       ),
    // ),
    // BlocProvider<WithdrawCubit>(
    //   create:
    //       (context) => WithdrawCubit(
    //         repository: context.read(),
    //         loginBloc: context.read(),
    //       ),
    // ),
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
    // BlocProvider<OrderStatusCubit>(
    //   create:
    //       (context) => OrderStatusCubit(
    //         repository: context.read(),
    //         loginBloc: context.read(),
    //       ),
    // ),
    BlocProvider<ForgotPasswordVerifyCubit>(
      create:
          (context) => ForgotPasswordVerifyCubit(
            forgotPasswordRepository: context.read(),
          ),
    ),
    BlocProvider<CityDocumentVehicleCubit>(
      create: (context) => CityDocumentVehicleCubit(repository: context.read()),
    ),
  ];
}
