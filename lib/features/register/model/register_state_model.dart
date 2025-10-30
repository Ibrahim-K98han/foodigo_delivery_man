// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:equatable/equatable.dart';
import '../cubit/register_state.dart';

class RegisterStateModel extends Equatable {
  final int activeTab;
  final String fname;
  final String lname;
  final String gender;
  final String countryCode;
  final String phone;
  final String email;
  final String name;
  final String dateOfBirth;
  final String cityId;
  final String zipCode;
  final String address;
  final String documentTypeId;
  final String documentNumber;
  final String profileImg;
  final String document;
  final String shortNote;
  final String vehicleTypeId;
  final String vehicleNumber;
  final String vehicleImage;
  // final String resendSeconds;
  // final bool isResendActive;
  final String currentPassword;
  final String password;
  final String confirmPassword;
  final String otp;
  final bool isActive;
  final String languageCode;
  final bool showPassword;
  final bool showConPassword;
  final RegisterState registerState;
  const RegisterStateModel({
    this.activeTab = 0,
    required this.fname,
    required this.lname,
    required this.gender,
    required this.countryCode,
    required this.phone,
    required this.email,
    required this.name,
    required this.dateOfBirth,
    required this.cityId,
    required this.zipCode,
    required this.address,
    required this.documentTypeId,
    required this.documentNumber,
    required this.profileImg,
    required this.document,
    required this.shortNote,
    required this.vehicleTypeId,
    required this.vehicleNumber,
    required this.vehicleImage,
    // required this.resendSeconds,
    // this.isResendActive = true,
    required this.currentPassword,
    required this.password,
    required this.confirmPassword,
    required this.otp,
    this.isActive = true,
    this.languageCode = 'en',
    this.showPassword = true,
    this.showConPassword = true,
    this.registerState = const RegisterInitial(),
  });

  RegisterStateModel copyWith({
    int? activeTab,
    String? fname,
    String? lname,
    String? gender,
    String? countryCode,
    String? phone,
    String? email,
    String? name,
    String? dateOfBirth,
    String? cityId,
    String? zipCode,
    String? address,
    String? documentTypeId,
    String? documentNumber,
    String? profileImg,
    String? document,
    String? shortNote,
    String? vehicleTypeId,
    String? vehicleNumber,
    String? vehicleImage,
    // String? resendSeconds,
    // bool? isResendActive,
    String? currentPassword,
    String? password,
    String? confirmPassword,
    String? otp,
    bool? isActive,
    String? languageCode,
    bool? showPassword,
    bool? showConPassword,
    RegisterState? registerState,
  }) {
    return RegisterStateModel(
      activeTab: activeTab ?? this.activeTab,
      fname: fname ?? this.fname,
      lname: lname ?? this.lname,
      gender: gender ?? this.gender,
      countryCode: countryCode ?? this.countryCode,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      name: name ?? this.name,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      cityId: cityId ?? this.cityId,
      zipCode: zipCode ?? this.zipCode,
      address: address ?? this.address,
      documentTypeId: documentTypeId ?? this.documentTypeId,
      documentNumber: documentNumber ?? this.documentNumber,
      profileImg: profileImg ?? this.profileImg,
      document: document ?? this.document,
      shortNote: shortNote ?? this.shortNote,
      vehicleTypeId: vehicleTypeId ?? this.vehicleTypeId,
      vehicleNumber: vehicleNumber ?? this.vehicleNumber,
      vehicleImage: vehicleImage ?? this.vehicleImage,
      // resendSeconds: resendSeconds ?? this.resendSeconds,
      // isResendActive: isResendActive ?? this.isResendActive,
      currentPassword: currentPassword ?? this.currentPassword,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      otp: otp ?? this.otp,
      isActive: isActive ?? this.isActive,
      languageCode: languageCode ?? this.languageCode,
      showPassword: showPassword ?? this.showPassword,
      showConPassword: showConPassword ?? this.showConPassword,
      registerState: registerState ?? this.registerState,
    );
  }

  Map<String, String> toMap() {
    return <String, String>{
      'fname': fname,
      'lname': lname,
      'gender': gender,
      'country_code': countryCode,
      'phone': phone,
      'email': email,
      'name': name,
      'date_of_birth': dateOfBirth,
      'city_id': cityId,
      'zip_code': zipCode,
      'address': address,
      'document_type_id': documentTypeId,
      'document_number': documentNumber,
      'profile_image': profileImg,
      'document': document,
      'short_note': shortNote,
      'vehicle_type_id': vehicleTypeId,
      'vehicle_number': vehicleNumber,
      'vehicle_image': vehicleImage,
      // 'resend_seconds': resendSeconds,
      // 'is_resend_active': isResendActive,
      'current_password': currentPassword,
      'password': password,
      'password_confirmation': confirmPassword,
      'otp': otp,
    };
  }

  factory RegisterStateModel.fromMap(Map<String, dynamic> map) {
    return RegisterStateModel(
      fname: map['fname'] ?? '',
      lname: map['lname'] ?? '',
      gender: map['gender'] ?? '',
      countryCode: map['country_code'] ?? '',
      phone: map['phone'] ?? '',
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      dateOfBirth: map['date_of_birth'] ?? '',
      cityId: map['city_id'] ?? '',
      zipCode: map['zip_code'] ?? '',
      address: map['address'] ?? '',
      documentTypeId: map['document_type_id'] ?? '',
      documentNumber: map['document_number'] ?? '',
      profileImg: map['profile_image'] ?? '',
      document: map['document'] ?? '',
      shortNote: map['short_note'] ?? '',
      vehicleTypeId: map['vehicle_type_id'] ?? '',
      vehicleNumber: map['vehicle_number'] ?? '',
      vehicleImage: map['vehicle_image'] ?? '',
      // resendSeconds: map['resend_seconds'] ?? '',
      // isResendActive: map['is_resend_active'] ?? '',
      currentPassword: map['current_aassword'] ?? '',
      password: map['password'] ?? '',
      confirmPassword: map['password_confirmation'] ?? '',
      otp: map['otp'] ?? '',
    );
  }

  RegisterStateModel clear() {
    return const RegisterStateModel(
      fname: '',
      lname: '',
      gender: '',
      countryCode: '',
      phone: '',
      email: '',
      name: '',
      dateOfBirth: '',
      cityId: '',
      zipCode: '',
      address: '',
      documentTypeId: '',
      documentNumber: '',
      profileImg: '',
      document: '',
      shortNote: '',
      vehicleTypeId: '',
      vehicleNumber: '',
      vehicleImage: '',
      // resendSeconds: '',
      currentPassword: '',
      password: '',
      confirmPassword: '',
      isActive: true,
      showPassword: true,
      showConPassword: true,
      otp: '',
      registerState: RegisterInitial(),
    );
  }

  static RegisterStateModel init() {
    return const RegisterStateModel(
       activeTab: 0,
      fname: '',
      lname: '',
      gender: '',
      countryCode: '',
      phone: '',
      email: '',
      name: '',
      dateOfBirth: '',
      cityId: '',
      zipCode: '',
      address: '',
      documentTypeId: '',
      documentNumber: '',
      profileImg: '',
      document: '',
      shortNote: '',
      vehicleTypeId: '',
      vehicleNumber: '',
      vehicleImage: '',
      // resendSeconds: '',
      currentPassword: '',
      password: '',
      confirmPassword: '',
      otp: '',
      isActive: true,
      showPassword: true,
      showConPassword: true,
      registerState: RegisterInitial(),
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterStateModel.fromJson(String source) =>
      RegisterStateModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      activeTab,
      fname,
      lname,
      gender,
      countryCode,
      phone,
      email,
      name,
      dateOfBirth,
      cityId,
      zipCode,
      address,
      documentTypeId,
      documentNumber,
      profileImg,
      document,
      shortNote,
      vehicleTypeId,
      vehicleNumber,
      vehicleImage,
      // resendSeconds,
      // isResendActive,
      currentPassword,
      password,
      confirmPassword,
      otp,
      isActive,
      languageCode,
      showPassword,
      showConPassword,
      registerState,
    ];
  }
}
