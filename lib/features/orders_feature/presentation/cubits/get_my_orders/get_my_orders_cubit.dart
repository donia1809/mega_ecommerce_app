import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/orders_feature/domain/entities/my_order_emtity.dart';
import 'package:mega_ecommerce_app/features/orders_feature/domain/use_cases/get_my_orders_use_case.dart';

part 'get_my_orders_state.dart';

class GetMyOrdersCubit extends Cubit<IGetMyOrdersState> {
  final GetMyOrdersUseCase _getMyOrdersUseCase;
  GetMyOrdersCubit(this._getMyOrdersUseCase) : super(GetMyOrdersInitialState());

  Future<void> getMyOrders(OrdersParams params) async {
    emit(GetMyOrdersLoadingState());
    final result = await _getMyOrdersUseCase(params);
    result.fold(
      (failure)=>emit(GetMyOrdersFailureState(failure: failure)), 
      (orders)=>emit(GetMyOrdersSuccessState(orders: orders))
      );
  }

  @override
  void emit(IGetMyOrdersState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
