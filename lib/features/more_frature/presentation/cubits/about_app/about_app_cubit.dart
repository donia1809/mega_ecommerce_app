import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/more_frature/domain/entity/menu_entity.dart';
import 'package:mega_ecommerce_app/features/more_frature/domain/use_case/get_about_app_use_case.dart';

part 'about_app_state.dart';

class AboutAppCubit extends Cubit<IAboutAppState> {
  final GetAboutAppUseCase _aboutAppUseCase;
  AboutAppCubit(this._aboutAppUseCase) : super(AboutAppInitialState());

  Future<void> getAboutApp() async {
    emit(AboutAppLoadingState());
    final about = await _aboutAppUseCase();
    about.fold(
      (failure) => emit(AboutAppFailureState(failure: failure)),
      (about) => emit(AboutAppSuccessState(about: about)),
    );
  }
  @override
  void emit(IAboutAppState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
