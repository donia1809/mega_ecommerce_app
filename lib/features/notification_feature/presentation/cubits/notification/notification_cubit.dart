import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/core/network/failures/failure.dart';
import 'package:mega_ecommerce_app/features/notification_feature/domain/entity/notification_entity.dart';
import 'package:mega_ecommerce_app/features/notification_feature/domain/use_case/get_notifications_use_case.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<INotificationState> {
  final GetNotificationsUseCase _getNotificationsUseCase;
  NotificationCubit(this._getNotificationsUseCase)
    : super(NotificationInitialState());
  Future<void> getNotification() async {
    emit(NotificationLoadingState());
    final result = await _getNotificationsUseCase();
    result.fold(
      (failure) => emit(NotificationFailureState(failure: failure)),
      (notification) =>
          emit(NotificationSuccessState(notification: notification)),
    );
  }

  @override
  void emit(INotificationState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
