import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/orders_feature/domain/entities/check_out_order_entity.dart';
import 'package:mega_ecommerce_app/features/orders_feature/domain/use_cases/check_out_use_case.dart';

part 'check_out_state.dart';

class CheckOutCubit extends Cubit<ICheckOutState> {
  final CheckOutUseCase _checkOutUseCase;
  CheckOutCubit(this._checkOutUseCase) : super(CheckOutInitialState());

  void checkOut() async {
    emit(CheckOutLoadingState());
    final result = await _checkOutUseCase();
    result.fold((failure)=>emit(CheckOutFailureState(failure: failure)),
     (result)=>emit(CheckOutSuccessState(checKOutEntity: result)));
  }
  @override
  void emit(ICheckOutState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
