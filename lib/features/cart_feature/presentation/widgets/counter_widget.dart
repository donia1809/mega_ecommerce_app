import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_ecommerce_app/core/utiles/app_icons.dart';
import 'package:mega_ecommerce_app/features/cart_feature/domain/entity/cart_entity.dart';
import 'package:mega_ecommerce_app/features/cart_feature/presentation/cubits/cart/cart_cubit.dart';

class CounterWidget extends StatelessWidget {
  final CartItemEntity cart;
  const CounterWidget({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            context.read<CartCubit>().decreaseQuantity(cartId: cart.id);
          },
          icon: SvgPicture.asset(AppIcons.arrowDown),
        ),
        Flexible(child: Text(cart.quantity.toString())),
        IconButton(
          onPressed: () {
            context.read<CartCubit>().increaseQuantity(cartId: cart.id);
          },
          icon: SvgPicture.asset(AppIcons.arrowUp),
        ),
      ],
    );
  }
}