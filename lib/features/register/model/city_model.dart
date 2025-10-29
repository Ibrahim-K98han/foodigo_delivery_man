// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class CityModel extends Equatable {
  final int id;
  final String name;
  const CityModel({required this.id, required this.name});

  CityModel copyWith({int? id, String? name}) {
    return CityModel(id: id ?? this.id, name: name ?? this.name);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'name': name};
  }

  factory CityModel.fromMap(Map<String, dynamic> map) {
    return CityModel(id: map['id'] ?? 0, name: map['name'] ?? '');
  }

  String toJson() => json.encode(toMap());

  factory CityModel.fromJson(String source) =>
      CityModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, name];
}
