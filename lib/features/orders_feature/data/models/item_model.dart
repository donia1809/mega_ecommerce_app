import 'package:mega_ecommerce_app/features/orders_feature/domain/entities/item_entity.dart';

class ItemModel extends ItemsEntity {
  const ItemModel({
    required super.name,
    required super.quantity,
    required super.image,
    required super.price,
    required super.productId,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      name: json['name'],
      quantity: json['qty'],
      image: json['image'],
      price: (json['price']as num).toDouble(),
      productId: json['product'],
    );
  }
}
