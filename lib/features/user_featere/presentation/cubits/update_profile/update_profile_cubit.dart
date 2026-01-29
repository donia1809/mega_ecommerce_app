import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/user_featere/domain/entities/user_profile_entity.dart';
import 'package:mega_ecommerce_app/features/user_featere/domain/use_cases/update_profile_use_case.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<IUpdateProfileState> {
  //ToDo: cache user
  final UpdateProfileUseCase _updateUserProfileUseCase;
  UpdateProfileCubit(this._updateUserProfileUseCase)
    : super(UpdateProfileInitialState());
  Future<void> updateProfile(UpdateProfileParams params) async {
    emit(UpdateProfileLoadingState());
    final result = await _updateUserProfileUseCase(params);
    result.fold(
      (failure) => emit(UpdateProfileFailureState(failure: failure)),
      (updateProfile) => emit(UpdateProfileSuccessState(updateProfile: updateProfile)),
    );
  }
}
