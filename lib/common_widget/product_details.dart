import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_ecommerce_app/core/di/dependency_injection.dart';
import 'package:mega_ecommerce_app/core/theme/colors.dart';
import 'package:mega_ecommerce_app/core/theme/text_style.dart';
import 'package:mega_ecommerce_app/core/utiles/snack_bar_message.dart';
import 'package:mega_ecommerce_app/features/auth_feature/presentation/pages/auto_login/auto_login_widget.dart';
import 'package:mega_ecommerce_app/features/favorite_feature/presentation/cubit/toggle_favorite/toggle_favourite_cubit.dart';
import 'package:mega_ecommerce_app/features/product_feature/domain/entities/product_entity.dart';

class ProductDetails extends StatelessWidget {
  final ProductEntity product;
  final VoidCallback onTap;
  final void Function(ProductEntity newProduct)? onToggleFavoriteSuccess;
  const ProductDetails({
    super.key,
    required this.product,
    required this.onTap,
    this.onToggleFavoriteSuccess,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ToggleFavoriteCubit>(),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColors.containerBackground,
                  ),
                  child: Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: [
                      Image.network(
                        product.image,
                        height: double.infinity,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => const Icon(Icons.image),
                      ),
                      AppAutoLoginWidget(
                        authenticatedBuilder: (user) {
                          return Padding(
                            padding: const EdgeInsets.all(16),
                            child: BlocConsumer<
                              ToggleFavoriteCubit,
                              IToggleFavoriteState
                            >(
                              listener: (context, state) {
                                if (state is ToggleFavoriteFailureState) {
                                  showSnackBar(
                                    context: context,
                                    message: state.failure.message,
                                    color: AppColors.red,
                                  );
                                } else if (state
                                    is ToggleFavoriteSuccessState) {
                                  onToggleFavoriteSuccess?.call(
                                    product.toggleFavorite(user.id),
                                  );
                                }
                              },
                              builder: (context, state) {
                                final isLoading =
                                    state is ToggleFavoriteLoadingState;
                                return InkWell(
                                  onTap:
                                      isLoading
                                          ? null
                                          : () {
                                            context
                                                .read<ToggleFavoriteCubit>()
                                                .toggleFavourite(product.id);
                                          },
                                  child:
                                      isLoading
                                          ? const SizedBox(
                                            width: 24,
                                            height: 24,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                            ),
                                          )
                                          : SvgPicture.asset(
                                            product.isFavorite(user.id)
                                                ? 'assets/icons/fav.svg'
                                                : 'assets/icons/favourite.svg',
                                          ),
                                );
                              },
                              // },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 5),
              Text(
                product.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.medium15,
              ),

              Text('\$${product.price}', style: AppTextStyles.semiBold14),
            ],
          ),
        ),
      ),
    );
  }
}
