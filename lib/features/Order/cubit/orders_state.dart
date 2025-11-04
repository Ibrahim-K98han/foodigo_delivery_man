import 'package:equatable/equatable.dart';
import 'package:foodigo/features/Order/model/orders_model.dart';

abstract class OrdersState extends Equatable {
  const OrdersState();

  @override
  List<Object?> get props => [];
}

class OrderInitial extends OrdersState {
  const OrderInitial();

  @override
  List<Object?> get props => [];
}

class OrderLoading extends OrdersState {
  const OrderLoading();

  @override
  List<Object?> get props => [];
}

class OrderLoaded extends OrdersState {
  final List<OrdersModel> resOrderModel;

  const OrderLoaded(this.resOrderModel);

  @override
  List<Object?> get props => [resOrderModel];
}

class OrderSuccess extends OrdersState {
  final OrdersModel resOrderModel;

  const OrderSuccess(this.resOrderModel);

  @override
  List<Object?> get props => [resOrderModel];
}

class OrderError extends OrdersState {
  final String message;
  final int statusCode;

  const OrderError(this.message, this.statusCode);

  @override
  List<Object?> get props => [message, statusCode];
}

/// Success: Single Order Details
class OrderDetailsLoaded extends OrdersState {
  final OrdersModel resOrderModel;

  const OrderDetailsLoaded(this.resOrderModel);

  @override
  List<Object?> get props => [resOrderModel];
}

class OrderDetailsLoading extends OrdersState {}
