import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/more_frature/domain/entity/menu_entity.dart';
import 'package:mega_ecommerce_app/features/more_frature/domain/use_case/get_privacy_policy_use_case.dart';

part 'privacy_policy_state.dart';

class PrivacyPolicyCubit extends Cubit<IPrivacyPolicyState> {
    final GetPrivacyPolicyUseCase _getPrivacyPolicyUseCase;

  PrivacyPolicyCubit(this._getPrivacyPolicyUseCase) : super(PrivacyPolicyInitialState());
  Future<void> gerPrivacyPolicy() async {
    emit(PrivacyPolicyLoadingState());
    final policy = await _getPrivacyPolicyUseCase();
    policy.fold(
      (failure) => emit(PrivacyPolicyFailureState(failure: failure)),
      (policy) => emit(PrivacyPolicySuccessState(policy: policy)),
    );
  }
  @override
  void emit(IPrivacyPolicyState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}




  
