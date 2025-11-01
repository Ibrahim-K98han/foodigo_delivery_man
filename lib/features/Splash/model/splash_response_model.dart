import 'dart:convert';
import 'package:equatable/equatable.dart';

class SplashResponseModel extends Equatable {
  final String image;
  final String heading;
  final String subheading;

  const SplashResponseModel({
    required this.image,
    required this.heading,
    required this.subheading,
  });

  SplashResponseModel copyWith({String? image, String? heading, String? subheading}) {
    return SplashResponseModel(
      image: image ?? this.image,
      heading: heading ?? this.heading,
      subheading: subheading ?? this.subheading,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'heading': heading,
      'subheading': subheading,
    };
  }

  factory SplashResponseModel.fromMap(Map<String, dynamic> map) {
    return SplashResponseModel(
      image: map['image'] ?? '',
      heading: map['heading'] ?? '',
      subheading: map['subheading'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SplashResponseModel.fromJson(String source) =>
      SplashResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  List<Object?> get props => [image, heading, subheading];
}
