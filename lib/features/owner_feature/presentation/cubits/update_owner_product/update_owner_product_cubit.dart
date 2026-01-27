import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/owner_feature/domain/use_case/update_owner_product_use_case.dart';
import 'package:mega_ecommerce_app/features/product_feature/domain/entities/product_entity.dart';

part 'update_owner_product_state.dart';

class UpdateOwnerProductCubit extends Cubit<IUpdateOwnerProductState> {
  final UpdateOwnerProductUseCase _updateOwnerProductUseCase;
  UpdateOwnerProductCubit(this._updateOwnerProductUseCase)
    : super(UpdateOwnerProductInitialState());
  void updateOwnerProduct(UpdateOwnerProductParams params) async {
    emit(UpdateOwnerProductLoadingState());

    final result = await _updateOwnerProductUseCase(params);
    result.fold(
      (failure)=> emit(UpdateOwnerProductFailurelState(failure: failure)) ,
      (product)=> emit(UpdateOwnerProductSucceessState(product: product))
      );
  }

   @override
  void emit(IUpdateOwnerProductState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
