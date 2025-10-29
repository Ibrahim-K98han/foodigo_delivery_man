import 'package:dartz/dartz.dart';
import 'package:foodigo/features/register/model/city_model.dart';
import 'package:foodigo/features/register/remote/register_remote_data_source.dart';

import '../../../data/errors/exception.dart';
import '../../../data/errors/failure.dart';
import '../model/register_state_model.dart';

abstract class RegisterRepository {
  Future<Either<dynamic, String>> registerStepOne(RegisterStateModel body);
  Future<Either<dynamic, String>> registerStepTwo(
    RegisterStateModel body,
    Uri url,
  );
  Future<Either<dynamic, String>> registerStepThree(
    RegisterStateModel body,
    Uri url,
  );

  Future<Either<dynamic, String>> verifyRegOtp(
    RegisterStateModel body,
    String email,
  );

  Future<Either<Failure, CityModel>> getCityData();

  Future<Either<dynamic, String>> resendVerificationCode(
    Map<String, dynamic> body,
  );
}

class RegisterRepositoryImpl implements RegisterRepository {
  final RegisterRemoteDataSource remoteDataSource;

  const RegisterRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<dynamic, String>> registerStepOne(
    RegisterStateModel body,
  ) async {
    try {
      final result = await remoteDataSource.registerStepOne(body);
      return Right(result['message']);
    } on InvalidAuthData catch (e) {
      return Left(InvalidAuthData(e.errors));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<dynamic, String>> registerStepTwo(
    RegisterStateModel body,
    Uri url,
  ) async {
    try {
      final result = await remoteDataSource.registerStepTwo(body, url);
      return Right(result['message']);
    } on InvalidAuthData catch (e) {
      return Left(InvalidAuthData(e.errors));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<dynamic, String>> registerStepThree(
    RegisterStateModel body,
    Uri url,
  ) async {
    try {
      final result = await remoteDataSource.registerStepThree(body, url);
      return Right(result['message']);
    } on InvalidAuthData catch (e) {
      return Left(InvalidAuthData(e.errors));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<dynamic, String>> verifyRegOtp(
    RegisterStateModel body,
    String email,
  ) async {
    try {
      final result = await remoteDataSource.otpVerify(body, email);
      return Right(result['message']);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on InvalidAuthData catch (e) {
      return Left(InvalidAuthData(e.errors));
    }
  }

  ///Get City data
  @override
  Future<Either<Failure, CityModel>> getCityData() async {
    try {
      final result = await remoteDataSource.getCity();
      final review = CityModel.fromMap(result['data']);
      return Right(review);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  @override
  Future<Either<dynamic, String>> resendVerificationCode(
    Map<String, dynamic> body,
  ) async {
    try {
      final result = await remoteDataSource.resendVerificationCode(body);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on InvalidAuthData catch (e) {
      return Left(InvalidAuthData(e.errors));
    }
  }
}
