import 'package:equatable/equatable.dart';

class CartEntity extends Equatable {
  final String userId;
  final List<CartItemEntity> cartItems;
  final String id;

  const CartEntity({
    required this.userId,
    required this.cartItems,
    required this.id,
  });

  @override
  List<Object?> get props => [userId, cartItems, id];
}

class CartItemEntity extends Equatable {
  final String productId;
  final String productName;
  final String image;
  final int price;
  final int quantity;
  final String id;

  const CartItemEntity({
    required this.id,
    required this.productId,
    required this.productName,
    required this.image,
    required this.price,
    required this.quantity,
  });

  @override
  List<Object?> get props => [productId, productName, image, price, quantity];
}
