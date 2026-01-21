import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/orders_feature/domain/entities/order_entity.dart';
import 'package:mega_ecommerce_app/features/orders_feature/domain/use_cases/get_order_details_use_case.dart';

part 'get_order_details_state.dart';

class GetOrderDetailsCubit extends Cubit<IGetOrderDetailsState> {
  final GetOrderDetailsUseCase _getOrderDetailsUseCase;
  GetOrderDetailsCubit(this._getOrderDetailsUseCase)
    : super(GetOrderDetailsInitialState());

  Future<void> getOrderDetails(OrdersDetailsParams params) async {
    emit(GetOrderDetailsLoadingState());
    final result = await _getOrderDetailsUseCase(params);
    result.fold(
      (failure)=> emit(GetOrderDetailsFailureState(failure: failure)), 
      (order)=> emit(GetOrderDetailsSuccessState(order: order))
      );
  }

  @override
  void emit(IGetOrderDetailsState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
