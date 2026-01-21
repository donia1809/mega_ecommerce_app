import 'package:equatable/equatable.dart';

class ItemsEntity extends Equatable {
  final String productId;
  final String name;
  final String image;
  final double price;
  final int quantity;

  const ItemsEntity({
    required this.name,
    required this.quantity,
    required this.image,
    required this.price,
    required this.productId,
  });
  @override
  List<Object?> get props => [name, quantity, image, price, productId];
}
