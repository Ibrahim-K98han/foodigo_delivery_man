import 'package:dartz/dartz.dart';
import 'package:foodigo_delivery_man/data/errors/exception.dart';
import 'package:foodigo_delivery_man/data/errors/failure.dart';
import 'package:foodigo_delivery_man/features/CityDocumentVehicle/remote/city_document_vehicle_remote_data_source.dart';

import '../model/city_document_vehicle_model.dart';

abstract class CityDocumentVehicleRepository {
  Future<Either<Failure, CityDocumentVehicleModel>> getCityDocVehicleData();
}

class CityDocumentVehicleRepositoryImpl
    implements CityDocumentVehicleRepository {
  final CityDocumentVehicleRemoteDataSource remoteDataSource;

  const CityDocumentVehicleRepositoryImpl({required this.remoteDataSource});

  ///Get data
  @override
  Future<Either<Failure, CityDocumentVehicleModel>>
  getCityDocVehicleData() async {
    try {
      final result = await remoteDataSource.getCityDocumentVehicleData();
      final review = CityDocumentVehicleModel.fromMap(result['data']);
      return Right(review);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }
}
