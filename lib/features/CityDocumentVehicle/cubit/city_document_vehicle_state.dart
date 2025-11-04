import 'package:equatable/equatable.dart';
import 'package:foodigo/features/CityDocumentVehicle/model/city_document_vehicle_model.dart';

abstract class CityDocumentVehicleState extends Equatable {
  const CityDocumentVehicleState();

  @override
  List<Object?> get props => [];
}

class CityDocumentVehicleInitial extends CityDocumentVehicleState {
  const CityDocumentVehicleInitial();

  @override
  List<Object?> get props => [];
}

class CityDocumentVehicleLoading extends CityDocumentVehicleState {
  const CityDocumentVehicleLoading();

  @override
  List<Object?> get props => [];
}

class CityDocumentVehicleLoaded extends CityDocumentVehicleState {
  final CityDocumentVehicleModel cityDocumentVehicleModel;

  const CityDocumentVehicleLoaded(this.cityDocumentVehicleModel);

  @override
  List<Object?> get props => [cityDocumentVehicleModel];
}

class CityDocumentVehicleSuccess extends CityDocumentVehicleState {
  final CityDocumentVehicleModel cityDocumentVehicleModel;

  const CityDocumentVehicleSuccess(this.cityDocumentVehicleModel);

  @override
  List<Object?> get props => [cityDocumentVehicleModel];
}

class CityDocumentVehicleError extends CityDocumentVehicleState {
  final String message;
  final int statusCode;

  const CityDocumentVehicleError(this.message, this.statusCode);

  @override
  List<Object?> get props => [message, statusCode];
}
