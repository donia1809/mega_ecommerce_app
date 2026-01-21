import 'package:mega_ecommerce_app/features/orders_feature/data/models/item_model.dart';
import 'package:mega_ecommerce_app/features/orders_feature/data/models/order_model.dart';
import 'package:mega_ecommerce_app/features/orders_feature/domain/entities/check_out_order_entity.dart';

class CheckOutModel extends ChecKOutEntity {
  const CheckOutModel({
    required super.message,
    required super.order,
    required super.total,
    required super.item,
  });

  factory CheckOutModel.fromJson(Map<String, dynamic> json) {
    return CheckOutModel(
      message: json['message'],
      order: OrderModel.fromJson(json['order']),
      total: (json['total']as num).toDouble(),
      item:
          List.from(
            json['items'] ?? [],
          ).map((e) => ItemModel.fromJson(e)).toList(),
    );
  }
}
