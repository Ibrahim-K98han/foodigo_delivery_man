import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodigo/features/Login/bloc/login_bloc.dart';
import 'package:foodigo/features/Order/cubit/orders_state.dart';
import 'package:foodigo/features/Order/model/orders_model.dart';

import '../repository/orders_repository.dart';

class OrdersCubit extends Cubit<OrdersState> {
  final OrdersRepository _repository;
  final LoginBloc _loginBloc;

  OrdersCubit({
    required OrdersRepository repository,
    required LoginBloc loginBloc,
  }) : _repository = repository,
       _loginBloc = loginBloc,
       super(const OrderInitial());

  List<OrdersModel>? orderModel;
  OrdersModel? orModel;

  Future<void> getAllOrder() async {
    emit(const OrderLoading());
    final result = await _repository.getAllOrder(
      _loginBloc.userInformation!.token,
    );
    result.fold((l) => emit(OrderError(l.message, l.statusCode)), (success) {
      orderModel = success;
      emit(OrderLoaded(success));
    });
  }

  /// Get Single Order Details
  Future<void> getOrderDetails(String orderId) async {
    emit(const OrderLoading());
    final result = await _repository.getOrderDetails(
      _loginBloc.userInformation!.token,
      orderId,
    );
    result.fold((l) => emit(OrderError(l.message, l.statusCode)), (success) {
      orModel = success;
      emit(OrderDetailsLoaded(success));
    });
  }
}
