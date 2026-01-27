import 'package:mega_ecommerce_app/features/notification_feature/domain/entity/notification_entity.dart';
import 'package:mega_ecommerce_app/features/notification_feature/domain/entity/notification_enum.dart';

class NotificationModel extends NotificationEntity {
  const NotificationModel({
    required super.id,
    required super.user,
    required super.title,
    required super.message,
    required super.type,
    required super.clickableItemId,
    required super.isRead,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'] ?? {};
    return NotificationModel(
      id: json['_id'] ?? '',
      user: json['user'] ?? '',
      title: json['title'] ?? '',
      message: json['message'] ?? '',
      type: NotificationEnum.fromString(json['type'] ?? ''),
      clickableItemId: data['orderId'] ?? data['productId'],
      isRead: json['isRead'] ?? false,
    );
  }
}
