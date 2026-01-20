import 'package:equatable/equatable.dart';
import 'package:mega_ecommerce_app/features/product_feature/domain/entities/owner_entity.dart';

class CartItemEntity extends Equatable {
  final String id;
  final String productId;
  final String productName;
  final String image;
  final int price;
  final int quantity;
  final OwnerEntity owner;

  const CartItemEntity({
    required this.owner,
    required this.id,
    required this.productId,
    required this.productName,
    required this.image,
    required this.price,
    required this.quantity,
  });

  CartItemEntity copyWith({final int? quantity}) {
    return CartItemEntity(
      owner: owner,
      id: id,
      productId: productId,
      productName: productName,
      image: image,
      price: price,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  List<Object?> get props => [productId, productName, image, price, quantity];
}
