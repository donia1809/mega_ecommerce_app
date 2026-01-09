import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/user_featere/domain/entities/user_profile_entity.dart';
import 'package:mega_ecommerce_app/features/user_featere/domain/use_cases/get_profile_use_case.dart';

part 'user_profile_state.dart';

class UserProfileCubit extends Cubit<IUserProfileState> {
  final GetUserProfileUseCase _getUserProfileUseCase;

  UserProfileCubit(this._getUserProfileUseCase)
    : super(UserProfileInitialState());

  Future<void> getProfile() async {
    emit(UserProfileLoadingState());
    final result = await _getUserProfileUseCase();
    result.fold(
      (failure) => emit(UserProfileFailureState(failure: failure)),
      (profile) => emit(UserProfileSuccessState(profile: profile)),
    );
  }
}
