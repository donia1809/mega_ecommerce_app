import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_ecommerce_app/common_widget/app_loading_widget.dart';
import 'package:mega_ecommerce_app/core/di/dependency_injection.dart';
import 'package:mega_ecommerce_app/core/theme/colors.dart';
import 'package:mega_ecommerce_app/core/utiles/app_icons.dart';
import 'package:mega_ecommerce_app/core/utiles/snack_bar_message.dart';
import 'package:mega_ecommerce_app/features/cart_feature/domain/entity/cart_item_entity.dart';
import 'package:mega_ecommerce_app/features/cart_feature/domain/use_case/update_quantity_use_case.dart';
import 'package:mega_ecommerce_app/features/cart_feature/presentation/cubits/cart/cart_cubit.dart';
import 'package:mega_ecommerce_app/features/cart_feature/presentation/cubits/update_cart_item_quantity/update_cart_item_quantity_cubit.dart';

class CounterWidget extends StatelessWidget {
  final CartItemEntity cartItem;
  const CounterWidget({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<UpdateCartItemQuantityCubit>(),
      child: BlocConsumer<
        UpdateCartItemQuantityCubit,
        IUpdateCartItemQuantityState
      >(
        listener: (context, state) {
          if (state is UpdateCartItemQuantityFailureState) {
            showSnackBar(
              context: context,
              message: state.failure.message,
              color: AppColors.red,
            );
          } else if (state is UpdateCartItemQuantitySuccessState) {
            context.read<CartCubit>().updateQuantity(
              productId: cartItem.productId,
              newQuantity: state.cartItem.quantity,
            );
          }
        },
        builder: (context, state) {
          final isLoading = state is UpdateCartItemQuantityLoadingState;
          if (isLoading) {
            return AppLoadingWidget(size: 16);
          }
          return Row(
            children: [
              //////////// decrement ////////////
              IconButton(
                icon: SvgPicture.asset(
                  AppIcons.arrowDown,
                  colorFilter:
                      cartItem.quantity <= 1
                          ? null
                          : const ColorFilter.mode(
                            AppColors.grey,
                            BlendMode.srcIn,
                          ),
                ),
                onPressed:
                    cartItem.quantity > 1
                        ? () {
                          final newQuentity = cartItem.quantity - 1;
                          final productId = cartItem.productId;
                          context.read<CartCubit>().updateQuantity(
                            productId: productId,
                            newQuantity: newQuentity,
                          );
                          context
                              .read<UpdateCartItemQuantityCubit>()
                              .updateQuantity(
                                params: UpdateQuantityParams(
                                  quantity: newQuentity,
                                  productId: productId,
                                ),
                              );
                        }
                        : null,
              ),

              //////////// quantity ////////////
              Flexible(child: Text(cartItem.quantity.toString())),

              //////////// increment ////////////
              IconButton(
                onPressed: () {
                  final newQuentity = cartItem.quantity + 1;
                          final productId = cartItem.productId;
                          context.read<CartCubit>().updateQuantity(
                            productId: productId,
                            newQuantity: newQuentity,
                          );
                  context.read<UpdateCartItemQuantityCubit>().updateQuantity(
                    params: UpdateQuantityParams(
                      quantity: newQuentity,
                      productId: productId,
                    ),
                  );
                },
                icon: SvgPicture.asset(
                  AppIcons.arrowUp,
                  colorFilter:
                      cartItem.quantity == 1
                          ? const ColorFilter.mode(
                            AppColors.black,
                            BlendMode.srcIn,
                          )
                          : null,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
