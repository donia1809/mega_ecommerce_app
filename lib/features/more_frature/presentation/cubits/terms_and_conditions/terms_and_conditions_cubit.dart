import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/more_frature/domain/entity/menu_entity.dart';
import 'package:mega_ecommerce_app/features/more_frature/domain/use_case/get_terms_and_conditions_use_case.dart';

part 'terms_and_conditions_state.dart';

class TermsAndConditionsCubit extends Cubit<ITermsAndConditionsState> {
  final GetTermsAndConditionsUseCase _getTermsAndConditionsUseCase;
  TermsAndConditionsCubit(this._getTermsAndConditionsUseCase)
    : super(TermsAndConditionsInitialState());

  Future<void> getTermsAndConditions() async {
    emit(TermsAndConditionsLoadingState());
    final terms = await _getTermsAndConditionsUseCase();
    terms.fold(
      (failure) => emit(TermsAndConditionsFailureState(failure: failure)),
      (terms) => emit(TermsAndConditionsSuccessState(terms: terms)),
    );
  }
}
