import 'package:dartz/dartz.dart';
import 'package:foodigo/data/errors/exception.dart';
import 'package:foodigo/data/errors/failure.dart';
import 'package:foodigo/features/Order/model/orders_model.dart';

import '../remote/orders_remote_data_source.dart';

abstract class OrdersRepository {
  Future<Either<Failure, List<OrdersModel>>> getAllOrder(String token);

  Future<Either<Failure, OrdersModel>> getOrderDetails(
    String token,
    String orderId,
  );
}

class OrdersRepositoryImpl implements OrdersRepository {
  final OrdersRemoteDataSource remoteDataSource;

  const OrdersRepositoryImpl({required this.remoteDataSource});

  ///Get All Order
  @override
  Future<Either<Failure, List<OrdersModel>>> getAllOrder(String token) async {
    try {
      final result = await remoteDataSource.getAllOrder(token);
      final allOrders =
          (result['data']['orders'] as List)
              .map((x) => OrdersModel.fromMap(x))
              .toList();
      return Right(allOrders);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  /// Get Order Details
  @override
  Future<Either<Failure, OrdersModel>> getOrderDetails(
    String token,
    String orderId,
  ) async {
    try {
      final result = await remoteDataSource.getOrderDetails(token, orderId);
      final order = OrdersModel.fromMap(result['data']['order']);
      return Right(order);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }
}
