import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/core/domain/entity/entities/cached_user_entity.dart';
import 'package:mega_ecommerce_app/features/auth_feature/presentation/cubits/auto_login/auto_login_cubit.dart';

class AppAutoLoginWidget extends StatelessWidget {
  const AppAutoLoginWidget({
    super.key,
    this.authenticatedBuilder,
    this.otherStatesWidget,
  });

  final Widget Function(CachedUserEntity user)? authenticatedBuilder;
  final Widget? otherStatesWidget;
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AutoLoginCubit, IAutoLogintState>(
      builder: (context, state) {
        switch (state) {
          case AppAuthenticatedState():
            return authenticatedBuilder?.call(state.user) ?? SizedBox();
          case AutoLoginInitial():
          case AppUnAuthenticatedState():
          case AppGuestState():
            return otherStatesWidget ?? const SizedBox();
        }
      },
    );
  }
}
