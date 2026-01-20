import 'package:mega_ecommerce_app/features/cart_feature/domain/entity/cart_item_entity.dart';
import 'package:mega_ecommerce_app/features/product_feature/data/model/owner_model.dart';

class CartItemModel extends CartItemEntity {
  const CartItemModel({
    required super.id,
    required super.productId,
    required super.productName,
    required super.image,
    required super.price,
    required super.quantity,
    required super.owner,
  });
  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    final product = json['product'];
    return CartItemModel(
      id: json['id'],
      productId: product['_id'],
      productName: product['name'],
      image: product['image'],
      price: (product['price'] as num).toInt(),
      quantity: json['quantity'] ?? 1,
       owner: OwnerModel.fromJson(product['owner']),
    );
  }
}
