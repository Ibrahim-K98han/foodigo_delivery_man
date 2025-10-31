import 'package:equatable/equatable.dart';
import 'dart:convert';

class CityDocumentVehicleModel extends Equatable {
  final List<Cities>? cities;
  final List<DocumentTypes>? documentTypes;
  final List<VehicleTypes>? vehicleTypes;

  const CityDocumentVehicleModel({
    this.cities,
    this.documentTypes,
    this.vehicleTypes,
  });

  CityDocumentVehicleModel copyWith({
    List<Cities>? cities,
    List<DocumentTypes>? documentTypes,
    List<VehicleTypes>? vehicleTypes,
  }) {
    return CityDocumentVehicleModel(
      cities: cities ?? this.cities,
      documentTypes: documentTypes ?? this.documentTypes,
      vehicleTypes: vehicleTypes ?? this.vehicleTypes,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cities': cities!.map((x) => x.toMap()).toList(),
      'document_types': documentTypes!.map((x) => x.toMap()).toList(),
      'vehicle_types': vehicleTypes!.map((x) => x.toMap()).toList(),
    };
  }

  factory CityDocumentVehicleModel.fromMap(Map<String, dynamic> map) {
    return CityDocumentVehicleModel(
      cities:
          map['cities'] != null
              ? List<Cities>.from(
                (map['cities'] as List<dynamic>).map<Cities>(
                  (x) => Cities.fromMap(x as Map<String, dynamic>),
                ),
              )
              : null,
      documentTypes:
          map['document_types'] != null
              ? List<DocumentTypes>.from(
                (map['document_types'] as List<dynamic>).map<DocumentTypes>(
                  (x) => DocumentTypes.fromMap(x as Map<String, dynamic>),
                ),
              )
              : null,
      vehicleTypes:
          map['vehicle_types'] != null
              ? List<VehicleTypes>.from(
                (map['vehicle_types'] as List<dynamic>).map<VehicleTypes>(
                  (x) => VehicleTypes.fromMap(x as Map<String, dynamic>),
                ),
              )
              : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CityDocumentVehicleModel.fromJson(String source) =>
      CityDocumentVehicleModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [cities, documentTypes, vehicleTypes];
}

class Cities extends Equatable {
  final int id;
  final String name;

  const Cities({
    required this.id,
    required this.name,
  });

  Cities copyWith({
    int? id,
    String? name,
  }) {
    return Cities(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory Cities.fromMap(Map<String, dynamic> map) {
    return Cities(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Cities.fromJson(String source) =>
      Cities.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object> get props => [id, name];

  @override
  bool get stringify => true;
}

class DocumentTypes extends Equatable {
  final int id;
  final String name;
  final String slug;

  const DocumentTypes({
    required this.id,
    required this.name,
    required this.slug,
  });

  DocumentTypes copyWith({
    int? id,
    String? name,
    String? slug,
  }) {
    return DocumentTypes(
      id: id ?? this.id,
      name: name ?? this.name,
      slug: slug ?? this.slug,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'slug': slug,
    };
  }

  factory DocumentTypes.fromMap(Map<String, dynamic> map) {
    return DocumentTypes(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      slug: map['slug'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory DocumentTypes.fromJson(String source) =>
      DocumentTypes.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object> get props => [id, name, slug];

  @override
  bool get stringify => true;
}

class VehicleTypes extends Equatable {
  final int id;
  final String name;
  final String slug;

  const VehicleTypes({
    required this.id,
    required this.name,
    required this.slug,
  });

  VehicleTypes copyWith({
    int? id,
    String? name,
    String? slug,
  }) {
    return VehicleTypes(
      id: id ?? this.id,
      name: name ?? this.name,
      slug: slug ?? this.slug,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'slug': slug,
    };
  }

  factory VehicleTypes.fromMap(Map<String, dynamic> map) {
    return VehicleTypes(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      slug: map['slug'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory VehicleTypes.fromJson(String source) =>     
      VehicleTypes.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object> get props => [id, name, slug];

  @override
  bool get stringify => true;
}
