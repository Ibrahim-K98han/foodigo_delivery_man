import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodigo/features/CityDocumentVehicle/cubit/city_document_vehicle_state.dart';
import 'package:foodigo/features/CityDocumentVehicle/model/city_document_vehicle_model.dart';
import 'package:foodigo/features/CityDocumentVehicle/repository/city_document_vehicle_repository.dart';

class CityDocumentVehicleCubit extends Cubit<CityDocumentVehicleState> {
  final CityDocumentVehicleRepository _repository;

  CityDocumentVehicleCubit({
    required CityDocumentVehicleRepository repository,
  }) : _repository = repository,
       super(const CityDocumentVehicleInitial());

  CityDocumentVehicleModel? cityDocumentVehicleModel;
 

  Future<void> getCityDocumentVehicleData() async {
    emit(const CityDocumentVehicleLoading());
    final result = await _repository.getCityDocVehicleData(
    );
    result.fold((l) => emit(CityDocumentVehicleError(l.message, l.statusCode)), (
      success,
    ) {
      cityDocumentVehicleModel = success;
      emit(CityDocumentVehicleLoaded(success));
    });
  }
}
