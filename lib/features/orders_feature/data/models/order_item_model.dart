import 'package:mega_ecommerce_app/features/orders_feature/domain/entities/order_item_entity.dart';

class OrderItemModel extends OrderItemEntity {
  const OrderItemModel({
    required super.name,
    required super.quantity,
    required super.image,
    required super.price,
    required super.productId,
    required super.id,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    
    return OrderItemModel(
      name: json['name'],
      quantity: json['qty'],
      image: json['image'],
      price: (json['price']as num).toDouble(),
      productId: json['product'],
      id: json['_id'],
    );
  }
}
