import 'package:dartz/dartz.dart';
import 'package:foodigo/data/errors/exception.dart';
import 'package:foodigo/data/errors/failure.dart';
import 'package:foodigo/features/register/model/city_model.dart';
import 'package:foodigo/features/restaurant_features/Dashboard/remote/dashboard_remote_data_source.dart';

import '../model/dashboard_model.dart';

abstract class DashboardRepository {
  Future<Either<Failure, DashboardModel>> getResDashboardData(String token);
 
}

class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardRemoteDataSource remoteDataSource;

  const DashboardRepositoryImpl({required this.remoteDataSource});

  ///Get Dashboard data
  @override
  Future<Either<Failure, DashboardModel>> getResDashboardData(
    String token,
  ) async {
    try {
      final result = await remoteDataSource.getResDashboard(token);
      final review = DashboardModel.fromMap(result['data']);
      return Right(review);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

 
}
