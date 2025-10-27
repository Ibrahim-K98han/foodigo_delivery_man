import 'package:dartz/dartz.dart';
import 'package:foodigo_delivery_man/features/ChangeProfilePass/model/change_profile_pass_state_model.dart';
import 'package:foodigo_delivery_man/features/ChangeProfilePass/remote/change_profile_pass_remote_data_source.dart';
import '../../../data/errors/exception.dart';
import '../../../data/errors/failure.dart';

abstract class ChangeProfilePassRepository {
  Future<Either<dynamic, String>> changeProfilePass(
    ChangeProfilePassStateModel body,
    String token,
  );
}

class ChangeProfilePassRepositoryImpl implements ChangeProfilePassRepository {
  final ChangeProfilePassRemoteDataSource remoteDataSource;

  const ChangeProfilePassRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<dynamic, String>> changeProfilePass(
    ChangeProfilePassStateModel body,
    String token,
  ) async {
    try {
      final result = await remoteDataSource.changeProfilePass(body, token);

      // if (result['success'] == false && result['data'] != null) {
      //   return Left(InvalidAuthData(Errors.fromMap(result['data'])));
      // }

      return Right(result['message']);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    } on InvalidAuthData catch (e) {
      return Left(InvalidAuthData(e.errors));
    }
  }
}
