import 'package:mega_ecommerce_app/features/cart_feature/data/model/cart_item_model.dart';
import 'package:mega_ecommerce_app/features/cart_feature/domain/entity/cart_entity.dart';

class CartModel extends CartEntity {
  const CartModel({
    required super.cartItems,
    //required super.id,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      //id: json['_id']??'',
      cartItems:
          List.from(json['cartItems']??[])
              .map((e) => CartItemModel.fromJson(e))
              .toList(),
    );
  }
}


