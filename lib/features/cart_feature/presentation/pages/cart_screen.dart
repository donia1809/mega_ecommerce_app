import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/common_widget/app_failure_widget.dart';
import 'package:mega_ecommerce_app/common_widget/app_loading_widget.dart';
import 'package:mega_ecommerce_app/features/cart_feature/presentation/cubits/cart/cart_cubit.dart';
import 'package:mega_ecommerce_app/features/cart_feature/presentation/widgets/cart_list_view_widget.dart';
import 'package:mega_ecommerce_app/l10n/app_localizations.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 24, left: 16, right: 16),
        child: BlocBuilder<CartCubit, ICartState>(
          builder: (context, state) {
            if (state is CartLoadingState) {
              return const Center(child: AppLoadingWidget());
            } else if (state is CartFailureState) {
              return AppFailureWidget(
                message: state.failure.message,
                onPressed: () {
                  context.read<CartCubit>().getCart();
                },
              );
            } else if (state is CartSuccessState) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppLocalizations.of(context)!.totalPrice),

                      Text(state.calculateTotalPrice.toString()),
                    ],
                  ),
                  SizedBox(height: 16),
                  Expanded(
                    child: CartListViewWidget(
                      onRemoveFromCart: (deletedItem) {
                        context.read<CartCubit>().removeCart(
                          cartItemId: deletedItem.id,
                        );
                      },
                      cartItem: state.cartItems,
                      totalPrice: state.calculateTotalPrice,
                    ),
                  ),
                ],
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}

// class _CartScreenBody extends StatelessWidget {
//   final List<CartItemEntity> cartItem;
//   final double totalPrice;
//   const _CartScreenBody({required this.cartItem, required this.totalPrice});
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Padding(
//         padding: EdgeInsets.only(top: 24, left: 16, right: 16),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(AppLocalizations.of(context)!.totalPrice),

//                 Text(totalPrice.toString()),
//               ],
//             ),
//             SizedBox(height: 16),
//             Expanded(
//               child: CartListViewWidget(
//                 onRemoveFromCart: (newCartItem) {
//                   context.read<CartCubit>().updateCartAfterRemoveCartItem(newCartItem: newCartItem);
//                 },
//                 cartItem: cartItem,
//                 totalPrice: totalPrice,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
