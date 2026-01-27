part of 'notification_cubit.dart';

sealed class INotificationState extends Equatable {
  const INotificationState();

  @override
  List<Object?> get props => [];
}

final class NotificationInitialState extends INotificationState {}

final class NotificationLoadingState extends INotificationState {}

final class NotificationSuccessState extends INotificationState {
  final List<NotificationEntity> notification;

  const NotificationSuccessState({required this.notification});
  @override
  List<Object?> get props => [notification];
}

final class NotificationFailureState extends INotificationState {
  final Failure failure;

  const NotificationFailureState({required this.failure});

  @override
  List<Object?> get props => [failure];
}
