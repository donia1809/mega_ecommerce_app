import 'package:equatable/equatable.dart';
import 'package:mega_ecommerce_app/features/notification_feature/domain/entity/notification_enum.dart';

class NotificationEntity extends Equatable {
  final String id;
  final String user;
  final String title;
  final String message;
  final NotificationEnum type;
  final String? clickableItemId;
  final bool isRead;

  const NotificationEntity({
    required this.id,
    required this.user,
    required this.title,
    required this.message,
    required this.type,
    required this.clickableItemId,
    required this.isRead,
  });

  @override
  List<Object?> get props => [
    id,
    user,
    title,
    message,
    type,
    clickableItemId,
    isRead,
  ];
}
