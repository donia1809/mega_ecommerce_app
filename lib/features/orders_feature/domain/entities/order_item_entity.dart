import 'package:equatable/equatable.dart';

class OrderItemEntity extends Equatable {
  final String name;
  final int quantity;
  final String image;
  final double price;
  final String productId;
  final String id;

  const OrderItemEntity({
    required this.name,
    required this.quantity,
    required this.image,
    required this.price,
    required this.productId,
    required this.id,
  });
  @override
  List<Object?> get props => [name, quantity, image, price, productId, id];
}
