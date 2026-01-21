import 'package:equatable/equatable.dart';
import 'package:mega_ecommerce_app/features/orders_feature/domain/entities/order_entity.dart';

class MyOrdersEntity extends Equatable {
  final List<OrderEntity> orders;
  final int page;
  final int pages;
  final int total;

  const MyOrdersEntity({
    required this.orders,
    required this.page,
    required this.pages,
    required this.total,
  });

  @override
  List<Object?> get props => [orders, page, pages, total];
}
