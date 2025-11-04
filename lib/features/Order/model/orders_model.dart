// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class OrdersModel extends Equatable {
  final int id;
  final String userId;
  final String restaurantId;
  final String addressId;
  final String timeSlotId;
  final String orderType;
  final String deliveryDay;
  final String coupon;
  final String discountAmount;
  final String deliveryCharge;
  final String vat;
  final String total;
  final String grandTotal;
  final String paymentMethod;
  final String paymentStatus;
  final String orderStatus;
  final String isGuest;
  final String tnxInfo;
  final String deliveryAddress;
  final String createdAt;
  final String updatedAt;
  final String deliveryManId;
  final String orderRequest;
  final String orderReqDate;
  final String orderReqAcceptDate;
  final Restaurant? restaurant;
  final Address? address;
  final User? user;
  final List<Items>? items;
  final Deliveryman? deliveryman;
  const OrdersModel({
    required this.id,
    required this.userId,
    required this.restaurantId,
    required this.addressId,
    required this.timeSlotId,
    required this.orderType,
    required this.deliveryDay,
    required this.coupon,
    required this.discountAmount,
    required this.deliveryCharge,
    required this.vat,
    required this.total,
    required this.grandTotal,
    required this.paymentMethod,
    required this.paymentStatus,
    required this.orderStatus,
    required this.isGuest,
    required this.tnxInfo,
    required this.deliveryAddress,
    required this.createdAt,
    required this.updatedAt,
    required this.deliveryManId,
    required this.orderRequest,
    required this.orderReqDate,
    required this.orderReqAcceptDate,
    this.restaurant,
    this.address,
    this.user,
    this.items,
    this.deliveryman,
  });

  OrdersModel copyWith({
    int? id,
    String? userId,
    String? restaurantId,
    String? addressId,
    String? timeSlotId,
    String? orderType,
    String? deliveryDay,
    String? coupon,
    String? discountAmount,
    String? deliveryCharge,
    String? vat,
    String? total,
    String? grandTotal,
    String? paymentMethod,
    String? paymentStatus,
    String? orderStatus,
    String? isGuest,
    String? tnxInfo,
    String? deliveryAddress,
    String? createdAt,
    String? updatedAt,
    String? deliveryManId,
    String? orderRequest,
    String? orderReqDate,
    String? orderReqAcceptDate,
    Restaurant? restaurant,
    Address? address,
    User? user,
    List<Items>? items,
    Deliveryman? deliveryman,
  }) {
    return OrdersModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      restaurantId: restaurantId ?? this.restaurantId,
      addressId: addressId ?? this.addressId,
      timeSlotId: timeSlotId ?? this.timeSlotId,
      orderType: orderType ?? this.orderType,
      deliveryDay: deliveryDay ?? this.deliveryDay,
      coupon: coupon ?? this.coupon,
      discountAmount: discountAmount ?? this.discountAmount,
      deliveryCharge: deliveryCharge ?? this.deliveryCharge,
      vat: vat ?? this.vat,
      total: total ?? this.total,
      grandTotal: grandTotal ?? this.grandTotal,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      orderStatus: orderStatus ?? this.orderStatus,
      isGuest: isGuest ?? this.isGuest,
      tnxInfo: tnxInfo ?? this.tnxInfo,
      deliveryAddress: deliveryAddress ?? this.deliveryAddress,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deliveryManId: deliveryManId ?? this.deliveryManId,
      orderRequest: orderRequest ?? this.orderRequest,
      orderReqDate: orderReqDate ?? this.orderReqDate,
      orderReqAcceptDate: orderReqAcceptDate ?? this.orderReqAcceptDate,
      restaurant: restaurant ?? this.restaurant,
      address: address ?? this.address,
      user: user ?? this.user,
      items: items ?? this.items,
      deliveryman: deliveryman ?? this.deliveryman,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user_id': userId,
      'restaurant_id': restaurantId,
      'address_id': addressId,
      'time_slot_id': timeSlotId,
      'order_type': orderType,
      'delivery_day': deliveryDay,
      'coupon': coupon,
      'discount_amount': discountAmount,
      'delivery_charge': deliveryCharge,
      'vat': vat,
      'total': total,
      'grand_total': grandTotal,
      'payment_method': paymentMethod,
      'payment_status': paymentStatus,
      'order_status': orderStatus,
      'is_guest': isGuest,
      'tnx_info': tnxInfo,
      'delivery_address': deliveryAddress,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'delivery_man_id': deliveryManId,
      'order_request': orderRequest,
      'order_req_date': orderReqDate,
      'order_req_accept_date': orderReqAcceptDate,
      'restaurant': restaurant?.toMap(),
      'address': address?.toMap(),
      'user': user?.toMap(),
      'items': items?.map((x) => x.toMap()).toList(),
      'deliveryman': deliveryman?.toMap(),
    };
  }

  factory OrdersModel.fromMap(Map<String, dynamic> map) {
    return OrdersModel(
      id: map['id'] ?? 0,
      userId: map['user_id'] ?? '',
      restaurantId: map['restaurant_id'] ?? '',
      addressId: map['address_id'] ?? '',
      timeSlotId: map['time_slot_id'] ?? '',
      orderType: map['order_type'] ?? '',
      deliveryDay: map['delivery_day'] ?? '',
      coupon: map['coupon'] ?? '',
      discountAmount: map['discount_amount'] ?? '',
      deliveryCharge: map['delivery_charge'] ?? '',
      vat: map['vat'] ?? '',
      total: map['total'] ?? '',
      grandTotal: map['grand_total'] ?? '',
      paymentMethod: map['payment_method'] ?? '',
      paymentStatus: map['payment_status'] ?? '',
      orderStatus: map['order_status'] ?? '',
      isGuest: map['is_guest'] ?? '',
      tnxInfo: map['tnx_info'] ?? '',
      deliveryAddress: map['delivery_address'] ?? '',
      createdAt: map['created_at'] ?? '',
      updatedAt: map['updated_at'] ?? '',
      deliveryManId: map['delivery_man_id'] ?? '',
      orderRequest: map['order_request'] ?? '',
      orderReqDate: map['order_req_date'] ?? '',
      orderReqAcceptDate: map['order_req_accept_date'] ?? '',
      restaurant:
          map['restaurant'] != null
              ? Restaurant.fromMap(map['restaurant'] as Map<String, dynamic>)
              : null,
      address:
          map['address'] != null
              ? Address.fromMap(map['address'] as Map<String, dynamic>)
              : null,
      user:
          map['user'] != null
              ? User.fromMap(map['user'] as Map<String, dynamic>)
              : null,
      items:
          map['items'] != null
              ? List<Items>.from(
                (map['items'] as List<dynamic>).map<Items?>(
                  (x) => Items.fromMap(x as Map<String, dynamic>),
                ),
              )
              : null,
      deliveryman:
          map['deliveryman'] != null
              ? Deliveryman.fromMap(map['deliveryman'] as Map<String, dynamic>)
              : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrdersModel.fromJson(String source) =>
      OrdersModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      userId,
      restaurantId,
      addressId,
      timeSlotId,
      orderType,
      deliveryDay,
      coupon,
      discountAmount,
      deliveryCharge,
      vat,
      total,
      grandTotal,
      paymentMethod,
      paymentStatus,
      orderStatus,
      isGuest,
      tnxInfo,
      deliveryAddress,
      createdAt,
      updatedAt,
      deliveryManId,
      orderRequest,
      orderReqDate,
      orderReqAcceptDate,
      restaurant!,
      address!,
      user!,
      items!,
      deliveryman!,
    ];
  }
}

class Restaurant extends Equatable {
  final int id;
  final String logo;
  final String coverImage;
  final String restaurantName;
  final String slug;
  final String cityId;
  final String cuisines;
  final String whatsapp;
  final String address;
  final String latitude;
  final String longitude;
  final String maxDeliveryDistance;
  final String ownerName;
  final String ownerEmail;
  final String ownerPhone;
  final String name;
  final String email;
  final String password;
  final String openingHour;
  final String closingHour;
  final String minProcessingTime;
  final String maxProcessingTime;
  final String timeSlotSeparate;
  final String tags;
  final String isFeatured;
  final String isPickupOrder;
  final String isDeliveryOrder;
  final String adminApproval;
  final String isBanned;
  final String forgetPasswordToken;
  final String createdAt;
  final String updatedAt;
  final String isTrusted;
  const Restaurant({
    required this.id,
    required this.logo,
    required this.coverImage,
    required this.restaurantName,
    required this.slug,
    required this.cityId,
    required this.cuisines,
    required this.whatsapp,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.maxDeliveryDistance,
    required this.ownerName,
    required this.ownerEmail,
    required this.ownerPhone,
    required this.name,
    required this.email,
    required this.password,
    required this.openingHour,
    required this.closingHour,
    required this.minProcessingTime,
    required this.maxProcessingTime,
    required this.timeSlotSeparate,
    required this.tags,
    required this.isFeatured,
    required this.isPickupOrder,
    required this.isDeliveryOrder,
    required this.adminApproval,
    required this.isBanned,
    required this.forgetPasswordToken,
    required this.createdAt,
    required this.updatedAt,
    required this.isTrusted,
  });

  Restaurant copyWith({
    int? id,
    String? logo,
    String? coverImage,
    String? restaurantName,
    String? slug,
    String? cityId,
    String? cuisines,
    String? whatsapp,
    String? address,
    String? latitude,
    String? longitude,
    String? maxDeliveryDistance,
    String? ownerName,
    String? ownerEmail,
    String? ownerPhone,
    String? name,
    String? email,
    String? password,
    String? openingHour,
    String? closingHour,
    String? minProcessingTime,
    String? maxProcessingTime,
    String? timeSlotSeparate,
    String? tags,
    String? isFeatured,
    String? isPickupOrder,
    String? isDeliveryOrder,
    String? adminApproval,
    String? isBanned,
    String? forgetPasswordToken,
    String? createdAt,
    String? updatedAt,
    String? isTrusted,
  }) {
    return Restaurant(
      id: id ?? this.id,
      logo: logo ?? this.logo,
      coverImage: coverImage ?? this.coverImage,
      restaurantName: restaurantName ?? this.restaurantName,
      slug: slug ?? this.slug,
      cityId: cityId ?? this.cityId,
      cuisines: cuisines ?? this.cuisines,
      whatsapp: whatsapp ?? this.whatsapp,
      address: address ?? this.address,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      maxDeliveryDistance: maxDeliveryDistance ?? this.maxDeliveryDistance,
      ownerName: ownerName ?? this.ownerName,
      ownerEmail: ownerEmail ?? this.ownerEmail,
      ownerPhone: ownerPhone ?? this.ownerPhone,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      openingHour: openingHour ?? this.openingHour,
      closingHour: closingHour ?? this.closingHour,
      minProcessingTime: minProcessingTime ?? this.minProcessingTime,
      maxProcessingTime: maxProcessingTime ?? this.maxProcessingTime,
      timeSlotSeparate: timeSlotSeparate ?? this.timeSlotSeparate,
      tags: tags ?? this.tags,
      isFeatured: isFeatured ?? this.isFeatured,
      isPickupOrder: isPickupOrder ?? this.isPickupOrder,
      isDeliveryOrder: isDeliveryOrder ?? this.isDeliveryOrder,
      adminApproval: adminApproval ?? this.adminApproval,
      isBanned: isBanned ?? this.isBanned,
      forgetPasswordToken: forgetPasswordToken ?? this.forgetPasswordToken,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isTrusted: isTrusted ?? this.isTrusted,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'logo': logo,
      'cover_image': coverImage,
      'restaurant_name': restaurantName,
      'slug': slug,
      'city_id': cityId,
      'cuisines': cuisines,
      'whatsapp': whatsapp,
      'address': address,
      'latitude': latitude,
      'longitude': longitude,
      'max_delivery_distance': maxDeliveryDistance,
      'owner_name': ownerName,
      'owner_email': ownerEmail,
      'owner_phone': ownerPhone,
      'name': name,
      'email': email,
      'password': password,
      'opening_hour': openingHour,
      'closing_hour': closingHour,
      'min_processing_time': minProcessingTime,
      'max_processing_time': maxProcessingTime,
      'time_slot_separate': timeSlotSeparate,
      'tags': tags,
      'is_featured': isFeatured,
      'is_pickup_order': isPickupOrder,
      'is_delivery_order': isDeliveryOrder,
      'admin_approval': adminApproval,
      'is_banned': isBanned,
      'forget_password_token': forgetPasswordToken,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'is_trusted': isTrusted,
    };
  }

  factory Restaurant.fromMap(Map<String, dynamic> map) {
    return Restaurant(
      id: map['id'] ?? 0,
      logo: map['logo'] ?? '',
      coverImage: map['cover_image'] ?? '',
      restaurantName: map['restaurant_name'] ?? '',
      slug: map['slug'] ?? '',
      cityId: map['city_id'] ?? '',
      cuisines: map['cuisines'] ?? '',
      whatsapp: map['whatsapp'] ?? '',
      address: map['address'] ?? '',
      latitude: map['latitude'] ?? '',
      longitude: map['longitude'] ?? '',
      maxDeliveryDistance: map['max_delivery_distance'] ?? '',
      ownerName: map['owner_name'] ?? '',
      ownerEmail: map['owner_email'] ?? '',
      ownerPhone: map['owner_phone'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      openingHour: map['opening_hour'] ?? '',
      closingHour: map['closing_hour'] ?? '',
      minProcessingTime: map['min_processing_time'] ?? '',
      maxProcessingTime: map['max_processing_time'] ?? '',
      timeSlotSeparate: map['time_slot_separate'] ?? '',
      tags: map['tags'] ?? '',
      isFeatured: map['is_featured'] ?? '',
      isPickupOrder: map['is_pickup_order'] ?? '',
      isDeliveryOrder: map['is_delivery_order'] ?? '',
      adminApproval: map['admin_approval'] ?? '',
      isBanned: map['is_banned'] ?? '',
      forgetPasswordToken: map['forget_password_token'] ?? '',
      createdAt: map['created_at'] ?? '',
      updatedAt: map['updated_at'] ?? '',
      isTrusted: map['is_trusted'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Restaurant.fromJson(String source) =>
      Restaurant.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      logo,
      coverImage,
      restaurantName,
      slug,
      cityId,
      cuisines,
      whatsapp,
      address,
      latitude,
      longitude,
      maxDeliveryDistance,
      ownerName,
      ownerEmail,
      ownerPhone,
      name,
      email,
      password,
      openingHour,
      closingHour,
      minProcessingTime,
      maxProcessingTime,
      timeSlotSeparate,
      tags,
      isFeatured,
      isPickupOrder,
      isDeliveryOrder,
      adminApproval,
      isBanned,
      forgetPasswordToken,
      createdAt,
      updatedAt,
      isTrusted,
    ];
  }
}

class Address extends Equatable {
  final int id;
  final String userId;
  final String name;
  final String lat;
  final String lon;
  final String email;
  final String phone;
  final String address;
  final String deliveryType;
  final String isGuest;
  final String createdAt;
  final String updatedAt;
  const Address({
    required this.id,
    required this.userId,
    required this.name,
    required this.lat,
    required this.lon,
    required this.email,
    required this.phone,
    required this.address,
    required this.deliveryType,
    required this.isGuest,
    required this.createdAt,
    required this.updatedAt,
  });

  Address copyWith({
    int? id,
    String? userId,
    String? name,
    String? lat,
    String? lon,
    String? email,
    String? phone,
    String? address,
    String? deliveryType,
    String? isGuest,
    String? createdAt,
    String? updatedAt,
  }) {
    return Address(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      deliveryType: deliveryType ?? this.deliveryType,
      isGuest: isGuest ?? this.isGuest,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'user_id': userId,
      'name': name,
      'lat': lat,
      'lon': lon,
      'email': email,
      'phone': phone,
      'address': address,
      'delivery_type': deliveryType,
      'is_guest': isGuest,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      id: map['id'] ?? 0,
      userId: map['user_id'] ?? '',
      name: map['name'] ?? '',
      lat: map['lat'] ?? '',
      lon: map['lon'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      address: map['address'] ?? '',
      deliveryType: map['delivery_type'] ?? '',
      isGuest: map['is_guest'] ?? '',
      createdAt: map['created_at'] ?? '',
      updatedAt: map['updated_at'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) =>
      Address.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      userId,
      name,
      lat,
      lon,
      email,
      phone,
      address,
      deliveryType,
      isGuest,
      createdAt,
      updatedAt,
    ];
  }
}

class User extends Equatable {
  final int id;
  final String name;
  final String email;
  final String emailVerifiedAt;
  final String createdAt;
  final String updatedAt;
  final String status;
  final String image;
  final String phone;
  final String address;
  final String verificationToken;
  final String forgetPasswordToken;
  final String isBanned;
  final String readableId;
  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    required this.image,
    required this.phone,
    required this.address,
    required this.verificationToken,
    required this.forgetPasswordToken,
    required this.isBanned,
    required this.readableId,
  });

  User copyWith({
    int? id,
    String? name,
    String? email,
    String? emailVerifiedAt,
    String? createdAt,
    String? updatedAt,
    String? status,
    String? image,
    String? phone,
    String? address,
    String? verificationToken,
    String? forgetPasswordToken,
    String? isBanned,
    String? readableId,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      status: status ?? this.status,
      image: image ?? this.image,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      verificationToken: verificationToken ?? this.verificationToken,
      forgetPasswordToken: forgetPasswordToken ?? this.forgetPasswordToken,
      isBanned: isBanned ?? this.isBanned,
      readableId: readableId ?? this.readableId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'email_verified_at': emailVerifiedAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'status': status,
      'image': image,
      'phone': phone,
      'address': address,
      'verification_token': verificationToken,
      'forget_password_token': forgetPasswordToken,
      'is_banned': isBanned,
      'readable_id': readableId,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      emailVerifiedAt: map['email_verified_at'] ?? '',
      createdAt: map['created_at'] ?? '',
      updatedAt: map['updated_at'] ?? '',
      status: map['status'] ?? '',
      image: map['image'] ?? '',
      phone: map['phone'] ?? '',
      address: map['address'] ?? '',
      verificationToken: map['verification_token'] ?? '',
      forgetPasswordToken: map['forget_password_token'] ?? '',
      isBanned: map['is_banned'] ?? '',
      readableId: map['readable_id'] ?? '',
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
      name,
      email,
      emailVerifiedAt,
      createdAt,
      updatedAt,
      status,
      image,
      phone,
      address,
      verificationToken,
      forgetPasswordToken,
      isBanned,
      readableId,
    ];
  }
}

class Items extends Equatable {
  final int id;
  final String orderId;
  final String productId;
  final String size;
  final String qty;
  final String total;
  final String createdAt;
  final String updatedAt;
  final Product? product;
  final List<AddonDetails>? addonDetails;
  const Items({
    required this.id,
    required this.orderId,
    required this.productId,
    required this.size,
    required this.qty,
    required this.total,
    required this.createdAt,
    required this.updatedAt,
    this.product,
    this.addonDetails,
  });

  Items copyWith({
    int? id,
    String? orderId,
    String? productId,
    String? size,
    String? qty,
    String? total,
    String? createdAt,
    String? updatedAt,
    Product? product,
    List<AddonDetails>? addonDetails,
  }) {
    return Items(
      id: id ?? this.id,
      orderId: orderId ?? this.orderId,
      productId: productId ?? this.productId,
      size: size ?? this.size,
      qty: qty ?? this.qty,
      total: total ?? this.total,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      product: product ?? this.product,
      addonDetails: addonDetails ?? this.addonDetails,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'order_id': orderId,
      'product_id': productId,
      'size': size,
      'qty': qty,
      'total': total,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'products':product?.toMap(),
      'addon_details': addonDetails?.map((x) => x.toMap()).toList(),
    };
  }

  factory Items.fromMap(Map<String, dynamic> map) {
    return Items(
      id: map['id'] ?? 0,
      orderId: map['order_id'] as String,
      productId: map['product_id'] as String,
      size: map['size'] as String,
      qty: map['qty'] as String,
      total: map['total'] as String,
      createdAt: map['created_at'] as String,
      updatedAt: map['updated_at'] as String,
            product:
          map['products'] != null
              ? Product.fromMap(map['products'] as Map<String, dynamic>)
              : null,
      addonDetails:
          map['addon_details'] != null
              ? List<AddonDetails>.from(
                (map['addon_details'] as List<dynamic>).map<AddonDetails?>(
                  (x) => AddonDetails.fromMap(x as Map<String, dynamic>),
                ),
              )
              : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Items.fromJson(String source) =>
      Items.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      orderId,
      productId,
      size,
      qty,
      total,
      createdAt,
      updatedAt,
      product!,
      addonDetails!,
    ];
  }
}

class Product extends Equatable {
  final int id;
  final String slug;
  final String image;
  final String categoryId;
  final String restaurantId;
  final String price;
  final String offerPrice;
  final String status;
  final String createdAt;
  final String updatedAt;
  final String isFeatured;
  final String name;
  final String shortDescription;
  final String size;
  final List<Addons>? addons;
  const Product({
    required this.id,
    required this.slug,
    required this.image,
    required this.categoryId,
    required this.restaurantId,
    required this.price,
    required this.offerPrice,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.isFeatured,
    required this.name,
    required this.shortDescription,
    required this.size,
    this.addons,
  });

  Product copyWith({
    int? id,
    String? slug,
    String? image,
    String? categoryId,
    String? restaurantId,
    String? price,
    String? offerPrice,
    String? status,
    String? createdAt,
    String? updatedAt,
    String? isFeatured,
    String? name,
    String? shortDescription,
    String? size,
    List<Addons>? addons,
  }) {
    return Product(
      id: id ?? this.id,
      slug: slug ?? this.slug,
      image: image ?? this.image,
      categoryId: categoryId ?? this.categoryId,
      restaurantId: restaurantId ?? this.restaurantId,
      price: price ?? this.price,
      offerPrice: offerPrice ?? this.offerPrice,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isFeatured: isFeatured ?? this.isFeatured,
      name: name ?? this.name,
      shortDescription: shortDescription ?? this.shortDescription,
      size: size ?? this.size,
      addons: addons ?? this.addons,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'slug': slug,
      'image': image,
      'category_id': categoryId,
      'restaurant_id': restaurantId,
      'price': price,
      'offer_price': offerPrice,
      'status': status,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'is_featured': isFeatured,
      'name': name,
      'short_description': shortDescription,
      'size': size,
      'addons': addons?.map((x) => x.toMap()).toList(),
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] ?? 0,
      slug: map['slug'] ?? '',
      image: map['image'] ?? '',
      categoryId: map['category_id'] ?? '',
      restaurantId: map['restaurant_id'] ?? '',
      price: map['price'] ?? '',
      offerPrice: map['offer_price'] ?? '',
      status: map['status'] ?? '',
      createdAt: map['created_at'] ?? '',
      updatedAt: map['updated_at'] ?? '',
      isFeatured: map['is_featured'] ?? '',
      name: map['name'] ?? '',
      shortDescription: map['short_description'] ?? '',
      size: map['size'] ?? '',
      addons:
          map['addons'] != null
              ? List<Addons>.from(
                (map['addons'] as List<dynamic>).map<Addons?>(
                  (x) => Addons.fromMap(x as Map<String, dynamic>),
                ),
              )
              : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      slug,
      image,
      categoryId,
      restaurantId,
      price,
      offerPrice,
      status,
      createdAt,
      updatedAt,
      isFeatured,
      name,
      shortDescription,
      size,
      addons!,
    ];
  }
}

class Addons extends Equatable {
  final int id;
  final String name;
  final String price;
  const Addons({required this.id, required this.name, required this.price});

  Addons copyWith({int? id, String? name, String? price}) {
    return Addons(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'name': name, 'price': price};
  }

  factory Addons.fromMap(Map<String, dynamic> map) {
    return Addons(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      price: map['price'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Addons.fromJson(String source) =>
      Addons.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, name, price];
}

class AddonDetails extends Equatable {
  final int id;
  final String name;
  final String price;
  final int quantity;
  const AddonDetails({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
  });

  AddonDetails copyWith({int? id, String? name, String? price, int? quantity}) {
    return AddonDetails(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
      'quantity': quantity,
    };
  }

  factory AddonDetails.fromMap(Map<String, dynamic> map) {
    return AddonDetails(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      price: map['price'] ?? '',
      quantity: map['quantity'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddonDetails.fromJson(String source) =>
      AddonDetails.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, name, price, quantity];
}

class Deliveryman extends Equatable {
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
  const Deliveryman({
    required this.id,
    required this.manImage,
    required this.fname,
    required this.lname,
    required this.email,
    required this.manType,
    required this.idnType,
    required this.idnNum,
    required this.idnImage,
    required this.phone,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.gender,
    required this.countryCode,
    required this.dateOfBirth,
    required this.cityId,
    required this.zipCode,
    required this.address,
    required this.documentTypeId,
    required this.documentNumber,
    required this.profileImage,
    required this.document,
    required this.shortNote,
    required this.vehicleTypeId,
    required this.vehicleNumber,
    required this.vehicleImage,
    required this.otpExpiresAt,
    required this.isEmailVerified,
  });

  Deliveryman copyWith({
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
  }) {
    return Deliveryman(
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
      'vehicle_type_id': vehicleTypeId,
      'vehicle_number': vehicleNumber,
      'vehicle_image': vehicleImage,
      'otp_expires_at': otpExpiresAt,
      'is_email_verified': isEmailVerified,
    };
  }

  factory Deliveryman.fromMap(Map<String, dynamic> map) {
    return Deliveryman(
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

  String toJson() => json.encode(toMap());

  factory Deliveryman.fromJson(String source) =>
      Deliveryman.fromMap(json.decode(source) as Map<String, dynamic>);

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
