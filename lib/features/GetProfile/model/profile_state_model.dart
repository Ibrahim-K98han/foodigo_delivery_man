// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:foodigo/features/GetProfile/cubit/get_profile_state.dart';

class ProfileStateModel extends Equatable {
  final String image;
  final String name;
  final String lastName;
  final String email;
  final String phone;
  final String address;
  final String manType;
  final GetProfileState getProfileState;
  const ProfileStateModel({
    this.image = '',
    this.name = '',
    this.lastName = '',
    this.email = '',
    this.phone = '',
    this.address = '',
    this.manType = '',
    this.getProfileState = const GetProfileInitial(),
  });

  ProfileStateModel copyWith({
    String? image,
    String? name,
    String? lastName,
    String? email,
    String? phone,
    String? address,
    String? manType,
    GetProfileState? getProfileState,
  }) {
    return ProfileStateModel(
      image: image ?? this.image,
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      manType: manType ?? this.manType,
      getProfileState: getProfileState ?? this.getProfileState,
    );
  }

  Map<String, String> toMap() {
    return <String, String>{
      'man_image': image,
      'fname': name,
      'lname': lastName,
      'email': email,
      'phone': phone,
      'address': address,
      'man_type': manType,
    };
  }

  factory ProfileStateModel.fromMap(Map<String, dynamic> map) {
    return ProfileStateModel(
      image: map['man_image'] ?? '',
      name: map['fname'] ?? '',
      lastName: map['lname'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      address: map['address'] ?? '',
      manType: map['man_type'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileStateModel.fromJson(String source) =>
      ProfileStateModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      image,
      name,
      lastName,
      email,
      phone,
      address,
      manType,
      getProfileState,
    ];
  }
}
