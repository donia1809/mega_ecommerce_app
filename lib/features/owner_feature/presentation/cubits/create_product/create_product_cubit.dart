import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/owner_feature/domain/use_case/create_product_use_case.dart';

part 'create_product_state.dart';

class CreateProductCubit extends Cubit<ICreateProductState> {
  final CreateProductUseCase _createProductUseCase;
  CreateProductCubit(this._createProductUseCase)
    : super(CreateProductInitialState());

  void createProduct(CreateProductParams params) async {
    emit(CreateProductLoadingState());
    final result = await _createProductUseCase(params);
    result.fold(
      (failure) => emit(CreateProductFailureState(failure: failure)),
      (_)=> emit(CreateProductSuccessState()) ,
    );
  }

  @override
  void emit(ICreateProductState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
