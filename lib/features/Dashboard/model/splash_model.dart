// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class SplashModel extends Equatable {
  final String image;
  final String heading;
  final String subheading;
  const SplashModel({
    required this.image,
    required this.heading,
    required this.subheading,
  });

  SplashModel copyWith({String? image, String? heading, String? subheading}) {
    return SplashModel(
      image: image ?? this.image,
      heading: heading ?? this.heading,
      subheading: subheading ?? this.subheading,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'image': image,
      'heading': heading,
      'subheading': subheading,
    };
  }

  factory SplashModel.fromMap(Map<String, dynamic> map) {
    return SplashModel(
      image: map['image'] ?? '',
      heading: map['heading'] ?? '',
      subheading: map['subheading'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SplashModel.fromJson(String source) =>
      SplashModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [image, heading, subheading];
}
