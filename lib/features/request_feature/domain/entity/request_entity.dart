import 'package:equatable/equatable.dart';
import 'package:mega_ecommerce_app/features/orders_feature/domain/entities/status_enum.dart';

class RequestEntity extends Equatable {
  final String userId;
  final OrderStatusEnum status;
  final String message;
  final String id;

  const RequestEntity({required this.userId, required this.status, required this.message, required this.id});
  @override
  List<Object?> get props => [userId,status,message,id];
}
