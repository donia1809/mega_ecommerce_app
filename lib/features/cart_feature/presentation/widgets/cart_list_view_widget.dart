import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mega_ecommerce_app/common_widget/app_loading_widget.dart';
import 'package:mega_ecommerce_app/common_widget/common_container_widget.dart';
import 'package:mega_ecommerce_app/core/di/dependency_injection.dart';
import 'package:mega_ecommerce_app/core/theme/colors.dart';
import 'package:mega_ecommerce_app/core/theme/text_style.dart';
import 'package:mega_ecommerce_app/core/utiles/snack_bar_message.dart';
import 'package:mega_ecommerce_app/features/cart_feature/domain/entity/cart_entity.dart';
import 'package:mega_ecommerce_app/features/cart_feature/presentation/cubits/remove_from_cart/remove_from_cart_cubit.dart';
import 'package:mega_ecommerce_app/features/cart_feature/presentation/widgets/counter_widget.dart';
import '../../../../core/utiles/app_icons.dart';

class CartListViewWidget extends StatelessWidget {
  final List<CartItemEntity> cartItem;
  final double totalPrice;
  final void Function(CartItemEntity deletedItem)? onRemoveFromCart;
  const CartListViewWidget({
    super.key,
    required this.cartItem,
    required this.totalPrice,
    this.onRemoveFromCart,
  });
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(height: 8),
      itemCount: cartItem.length,
      itemBuilder: (context, index) {
        final item = cartItem[index];
        return CommonContainerWidget(
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 100,
                    height: 150,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(item.image),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          item.productName,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: AppTextStyles.medium15,
                        ),
                        SizedBox(height: 8),
                        Text(
                          item.price.toString(),
                          style: AppTextStyles.regular13,
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(child: CounterWidget(cart: item)),
                            BlocProvider(
                              create: (context) => sl<RemoveFromCartCubit>(),

                              child: BlocConsumer<
                                RemoveFromCartCubit,
                                IRemoveFromCartState
                              >(
                                listener: (context, state) {
                                  if (state is RemoveFromCartFailursState) {
                                    showSnackBar(
                                      context: context,
                                      message: state.failure.message,
                                      color: AppColors.red,
                                    );
                                  } else if (state
                                      is RemoveFromCartSuccessState) {
                                    onRemoveFromCart?.call(item);
                                  }
                                },
                                builder: (context, state) {
                                  final isLoading =
                                      state is RemoveFromCartLoadingState;
                                  if (isLoading) {
                                    return AppLoadingWidget(size: 12);
                                  }
                                  return IconButton(
                                    icon: SvgPicture.asset(AppIcons.delete),
                                    onPressed:
                                        isLoading
                                            ? null
                                            : () {
                                              context
                                                  .read<RemoveFromCartCubit>()
                                                  .removeFromCart(
                                                    cartId: item.id,
                                                  );
                                            },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
