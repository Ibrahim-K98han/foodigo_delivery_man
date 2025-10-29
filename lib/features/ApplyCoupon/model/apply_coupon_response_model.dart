// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../add_to_cart/model/add_cart_response_model.dart';

class ApplyCouponResponseModel extends Equatable {
    final Coupon? coupon;
  final CartSummary? cartSummary;

  const ApplyCouponResponseModel({
    this.coupon,
    this.cartSummary,
  });

  ApplyCouponResponseModel copyWith({
    Coupon? coupon,
    CartSummary? cartSummary,
  }) {
    return ApplyCouponResponseModel(
      coupon: coupon ?? this.coupon,
      cartSummary: cartSummary ?? this.cartSummary,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'coupon': coupon?.toMap(),
      'cart_summary': cartSummary?.toMap(),
    };
  }

  factory ApplyCouponResponseModel.fromMap(Map<String, dynamic> map) {
    return ApplyCouponResponseModel(
      coupon: map['coupon'] != null
          ? Coupon.fromMap(map['coupon'] as Map<String, dynamic>)
          : null,
      cartSummary: map['cart_summary'] != null
          ? CartSummary.fromMap(map['cart_summary'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ApplyCouponResponseModel.fromJson(String source) =>
      ApplyCouponResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [coupon!, cartSummary!];
}



class Coupon extends Equatable {
  final String code;
  final String discountType;
  final String discountValue;
  final double discountAmount;
  final double newTotal;

  const Coupon({
    required this.code,
    required this.discountType,
    required this.discountValue,
    required this.discountAmount,
    required this.newTotal,
  });

  Coupon copyWith({
    String? code,
    String? discountType,
    String? discountValue,
    double? discountAmount,
    double? newTotal,
  }) {
    return Coupon(
      code: code ?? this.code,
      discountType: discountType ?? this.discountType,
      discountValue: discountValue ?? this.discountValue,
      discountAmount: discountAmount ?? this.discountAmount,
      newTotal: newTotal ?? this.newTotal,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'discount_type': discountType,
      'discount_value': discountValue,
      'discount_amount': discountAmount,
      'new_total': newTotal,
    };
  }

  factory Coupon.fromMap(Map<String, dynamic> map) {
    return Coupon(
      code: map['code'] ?? '',
      discountType: map['discount_type'] ?? '',
      discountValue: map['discount_value'] ?? '',
      discountAmount: map['discount_amount'] != null
          ? double.tryParse(map['discount_amount'].toString()) ?? 0.0
          : 0.0,
      newTotal: map['new_total'] != null
          ? double.tryParse(map['new_total'].toString()) ?? 0.0
          : 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Coupon.fromJson(String source) =>
      Coupon.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      code,
      discountType,
      discountValue,
      discountAmount,
      newTotal,
    ];
  }
}
