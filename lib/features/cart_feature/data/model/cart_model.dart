import 'package:mega_ecommerce_app/features/cart_feature/domain/entity/cart_entity.dart';

class CartModel extends CartEntity {
  const CartModel({
    required super.userId,
    required super.cartItems,
    required super.id,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      userId: json['user'],
      cartItems:
          (json['cartItems'] as List<dynamic>?)
              ?.map((e) => CartItemModel.fromJson(e))
              .toList() ??
          [],
      id: json['_id'],
    );
  }
}

class CartItemModel extends CartItemEntity {
  const CartItemModel({
    required super.id,
    required super.productId,
    required super.productName,
    required super.image,
    required super.price,
    required super.quantity,
  });
  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      productId: json['product'],
      productName: json['name'],
      image: json['image'],
      price: json['price'],
      quantity: json['qty'],
      id: json['_id'],
    );
  }
}
