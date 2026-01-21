import 'package:equatable/equatable.dart';
import 'package:mega_ecommerce_app/features/orders_feature/domain/entities/item_entity.dart';
import 'package:mega_ecommerce_app/features/orders_feature/domain/entities/order_entity.dart';

class ChecKOutEntity extends Equatable {
  final String message;
  final OrderEntity order;
  final double total;
  final List<ItemsEntity> item;

  const ChecKOutEntity({
    required this.message,
    required this.order,
    required this.total,
    required this.item,
  });

  @override
  List<Object?> get props => [message, order, total, item];
}
