import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/owner_feature/domain/use_case/get_owner_product_use_case.dart';
import 'package:mega_ecommerce_app/features/product_feature/domain/entities/product_entity.dart';

part 'owner_product_state.dart';

class OwnerProductCubit extends Cubit<IOwnerProductState> {
  final GetOwnerProductUseCase _getOwnerProductUseCase;
  OwnerProductCubit(this._getOwnerProductUseCase)
    : super(OwnerProductInitialstate());

  Future<void> getOwnerProduct() async {
    emit(OwnerProductLoadingState());

    final result = await _getOwnerProductUseCase();

    result.fold(
      (failure) => emit(OwnerProductFailureState(failure: failure)),
      (ownerProduct) =>
          emit(OwnerProductSeccessState(ownerProduct: ownerProduct)),
    );
  }

  @override
  void emit(IOwnerProductState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
