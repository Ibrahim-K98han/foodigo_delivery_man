// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:foodigo_delivery_man/features/GetProfile/cubit/get_profile_state.dart';

class UserResponseModel extends Equatable {
  final User? user;
  final String token;
  final String tokenType;

  const UserResponseModel({
    this.user,
    required this.token,
    required this.tokenType,
  });

  UserResponseModel copyWith({User? user, String? token, String? tokenType}) {
    return UserResponseModel(
      user: user ?? this.user,
      token: token ?? this.token,
      tokenType: tokenType ?? this.tokenType,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': user?.toMap(),
      'token': token,
      'token_type': tokenType,
    };
  }

  factory UserResponseModel.fromMap(Map<String, dynamic> map) {
    return UserResponseModel(
      user:
          map['delivery_man'] != null
              ? User.fromMap(map['delivery_man'] as Map<String, dynamic>)
              : null,
      token: map['token'] ?? '',
      tokenType: map['token_type'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserResponseModel.fromJson(String source) =>
      UserResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [user, token, tokenType];
}

class User extends Equatable {
  final int id;
  final String manImage;
  final String fname;
  final String lname;
  final String email;
  final String manType;
  final String idnType;
  final String idnNum;
  final String idnImage;
  final String phone;
  final int status;
  final String createdAt;
  final String updatedAt;
  final String gender;
  final String countryCode;
  final String dateOfBirth;
  final String cityId;
  final String zipCode;
  final String address;
  final String documentTypeId;
  final String documentNumber;
  final String profileImage;
  final String document;
  final String shortNote;
  final String vehicleTypeId;
  final String vehicleNumber;
  final String vehicleImage;
  final String otpExpiresAt;
  final bool isEmailVerified;
  final GetProfileState getProfileState;
  const User({
    this.id = 0,
    this.manImage = '',
    this.fname = '',
    this.lname = '',
    this.email = '',
    this.manType = '',
    this.idnType = '',
    this.idnNum = '',
    this.idnImage = '',
    this.phone = '',
    this.status = 0,
    this.createdAt = '',
    this.updatedAt = '',
    this.gender = '',
    this.countryCode = '',
    this.dateOfBirth = '',
    this.cityId = '',
    this.zipCode = '',
    this.address = '',
    this.documentTypeId = '',
    this.documentNumber = '',
    this.profileImage = '',
    this.document = '',
    this.shortNote = '',
    this.vehicleTypeId = '',
    this.vehicleNumber = '',
    this.vehicleImage = '',
    this.otpExpiresAt = '',
    this.isEmailVerified = true,
    this.getProfileState = const GetProfileInitial(),
  });

  User copyWith({
    int? id,
    String? manImage,
    String? fname,
    String? lname,
    String? email,
    String? manType,
    String? idnType,
    String? idnNum,
    String? idnImage,
    String? phone,
    int? status,
    String? createdAt,
    String? updatedAt,
    String? gender,
    String? countryCode,
    String? dateOfBirth,
    String? cityId,
    String? zipCode,
    String? address,
    String? documentTypeId,
    String? documentNumber,
    String? profileImage,
    String? document,
    String? shortNote,
    String? vehicleTypeId,
    String? vehicleNumber,
    String? vehicleImage,
    String? otpExpiresAt,
    bool? isEmailVerified,
    GetProfileState? getProfileState,
  }) {
    return User(
      id: id ?? this.id,
      manImage: manImage ?? this.manImage,
      fname: fname ?? this.fname,
      lname: lname ?? this.lname,
      email: email ?? this.email,
      manType: manType ?? this.manType,
      idnType: idnType ?? this.idnType,
      idnNum: idnNum ?? this.idnNum,
      idnImage: idnImage ?? this.idnImage,
      phone: phone ?? this.phone,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      gender: gender ?? this.gender,
      countryCode: countryCode ?? this.countryCode,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      cityId: cityId ?? this.cityId,
      zipCode: zipCode ?? this.zipCode,
      address: address ?? this.address,
      documentTypeId: documentTypeId ?? this.documentTypeId,
      documentNumber: documentNumber ?? this.documentNumber,
      profileImage: profileImage ?? this.profileImage,
      document: document ?? this.document,
      shortNote: shortNote ?? this.shortNote,
      vehicleTypeId: vehicleTypeId ?? this.vehicleTypeId,
      vehicleNumber: vehicleNumber ?? this.vehicleNumber,
      vehicleImage: vehicleImage ?? this.vehicleImage,
      otpExpiresAt: otpExpiresAt ?? this.otpExpiresAt,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'man_image': manImage,
      'fname': fname,
      'lname': lname,
      'email': email,
      'man_type': manType,
      'idn_type': idnType,
      'idn_num': idnNum,
      'idn_image': idnImage,
      'phone': phone,
      'status': status,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'gender': gender,
      'country_code': countryCode,
      'date_of_birth': dateOfBirth,
      'city_id': cityId,
      'zip_code': zipCode,
      'address': address,
      'document_type_id': documentTypeId,
      'document_number': documentNumber,
      'profile_image': profileImage,
      'document': document,
      'short_note': shortNote,
      'vehicle_typeId': vehicleTypeId,
      'vehicle_number': vehicleNumber,
      'vehicle_image': vehicleImage,
      'otp_expires_at': otpExpiresAt,
      'is_email_verified': isEmailVerified,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? 0,
      manImage: map['man_image'] ?? '',
      fname: map['fname'] ?? '',
      lname: map['lname'] ?? '',
      email: map['email'] ?? '',
      manType: map['man_type'] ?? '',
      idnType: map['idn_type'] ?? '',
      idnNum: map['idn_num'] ?? '',
      idnImage: map['idn_image'] ?? '',
      phone: map['phone'] ?? '',
      status: map['status'] ?? 0,
      createdAt: map['created_at'] ?? '',
      updatedAt: map['updated_at'] ?? '',
      gender: map['gender'] ?? '',
      countryCode: map['country_code'] ?? '',
      dateOfBirth: map['date_of_birth'] ?? '',
      cityId: map['city_id'] ?? '',
      zipCode: map['zip_code'] ?? '',
      address: map['address'] ?? '',
      documentTypeId: map['document_type_id'] ?? '',
      documentNumber: map['document_number'] ?? '',
      profileImage: map['profile_image'] ?? '',
      document: map['document'] ?? '',
      shortNote: map['short_note'] ?? '',
      vehicleTypeId: map['vehicle_type_id'] ?? '',
      vehicleNumber: map['vehicle_number'] ?? '',
      vehicleImage: map['vehicle_image'] ?? '',
      otpExpiresAt: map['otp_expires_at'] ?? '',
      isEmailVerified: map['is_email_verified'] ?? '',
    );
  }

  static User init() {
    return const User(
      id: 0,
      manImage: '',
      lname: '',
      fname: '',
      email: '',
      manType: '',
      idnType: '',
      idnNum: '',
      idnImage: '',
      phone: '',
      status: 0,
      createdAt: '',
      updatedAt: '',
      gender: '',
      countryCode: '',
      dateOfBirth: '',
      cityId: '',
      zipCode: '',
      address: '',
      documentTypeId: '',
      documentNumber: '',
      profileImage: '',
      document: '',
      shortNote: '',
      vehicleTypeId: '',
      vehicleNumber: '',
      vehicleImage: '',
      otpExpiresAt: '',
      isEmailVerified: true,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      manImage,
      fname,
      lname,
      email,
      manType,
      idnType,
      idnNum,
      idnImage,
      phone,
      status,
      createdAt,
      updatedAt,
      gender,
      countryCode,
      dateOfBirth,
      cityId,
      zipCode,
      address,
      documentTypeId,
      documentNumber,
      profileImage,
      document,
      shortNote,
      vehicleTypeId,
      vehicleNumber,
      vehicleImage,
      otpExpiresAt,
      isEmailVerified,
    ];
  }
}
