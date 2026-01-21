import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/common_widget/app_failure_widget.dart';
import 'package:mega_ecommerce_app/common_widget/app_loading_widget.dart';
import 'package:mega_ecommerce_app/common_widget/elevated_button.dart';
import 'package:mega_ecommerce_app/core/di/dependency_injection.dart';
import 'package:mega_ecommerce_app/core/extension/build_context_extensions.dart';
import 'package:mega_ecommerce_app/core/routes/routs.dart';
import 'package:mega_ecommerce_app/core/theme/colors.dart';
import 'package:mega_ecommerce_app/core/utiles/snack_bar_message.dart';
import 'package:mega_ecommerce_app/features/cart_feature/presentation/cubits/cart/cart_cubit.dart';
import 'package:mega_ecommerce_app/features/cart_feature/presentation/widgets/cart_list_view_widget.dart';
import 'package:mega_ecommerce_app/features/orders_feature/presentation/cubits/check_out/check_out_cubit.dart';
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
                  SizedBox(height: 16),
                  CheckOutButton(),
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

class CheckOutButton extends StatelessWidget {
  const CheckOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CheckOutCubit>(),
      child: BlocConsumer<CheckOutCubit, ICheckOutState>(
        listener: (context, state) {
          if (state is CheckOutSuccessState) {
            showSnackBar(
              context: context,
              message: 'Checkout successful',
              color: AppColors.green,
            );
            context.navigateTo(AppRoutes.checkOutScreen);
          }
        },
        builder: (context, state) {
          if (state is CheckOutFailureState) {
            return AppFailureWidget(
              message: state.failure.message,
              onPressed: () {
                context.read<CheckOutCubit>().checkOut();
              },
            );
          }
          return CommonElevatedButton(
            isLoading: state is CheckOutLoadingState,
            onPressed: () {
              context.read<CheckOutCubit>().checkOut();
            },
            text: AppLocalizations.of(context)!.checkOut,
          );
        },
      ),
    );
  }
}
