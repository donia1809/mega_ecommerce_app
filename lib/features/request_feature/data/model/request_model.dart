import 'package:mega_ecommerce_app/features/orders_feature/domain/entities/status_enum.dart';
import 'package:mega_ecommerce_app/features/request_feature/domain/entity/request_entity.dart';

class RequestModel extends RequestEntity {
  const RequestModel({
    required super.userId,
    required super.status,
    required super.message,
    required super.id,
  });

  factory RequestModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    return RequestModel(
      userId: data['user'],
      status: OrderStatusEnum.fromString(data['status']),
      message: data['message'],
      id: data['_id'],
    );
  }
}
