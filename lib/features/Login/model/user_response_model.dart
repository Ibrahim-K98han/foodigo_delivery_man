// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:foodigo/features/GetProfile/cubit/get_profile_state.dart';

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
  final String status;
  final String createdAt;
  final String updatedAt;
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
    this.status = '',
    this.createdAt = '',
    this.updatedAt = '',
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
    String? status,
    String? createdAt,
    String? updatedAt,
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
      getProfileState: getProfileState ?? this.getProfileState,
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
      status: map['status'] ?? '',
      createdAt: map['created_at'] ?? '',
      updatedAt: map['updated_at'] ?? '',
    );
  }

  static User init() {
    return const User(
      id: 0,
      manImage: '',
      fname: '',
      lname: '',
      email: '',
      manType: '',
      idnType: '',
      idnNum: '',
      idnImage: '',
      phone: '',
      status: '',
      createdAt: '',
      updatedAt: '',
      getProfileState: GetProfileInitial(),
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
    ];
  }
}
