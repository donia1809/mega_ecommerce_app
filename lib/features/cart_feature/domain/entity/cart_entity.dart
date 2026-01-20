import 'package:equatable/equatable.dart';
import 'package:mega_ecommerce_app/features/cart_feature/domain/entity/cart_item_entity.dart';

class CartEntity extends Equatable {
  final List<CartItemEntity> cartItems;
  //final String id;

  const CartEntity({
    required this.cartItems,
   // required this.id,
  });

  @override
  List<Object?> get props => [cartItems, ];
}
