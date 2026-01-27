import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mega_ecommerce_app/common_widget/app_images.dart';
import 'package:mega_ecommerce_app/common_widget/app_loading_widget.dart';
import 'package:mega_ecommerce_app/core/di/dependency_injection.dart';
import 'package:mega_ecommerce_app/core/theme/colors.dart';
import 'package:mega_ecommerce_app/core/utiles/snack_bar_message.dart';
import 'package:mega_ecommerce_app/features/auth_feature/presentation/pages/auto_login/auto_login_widget.dart';
import 'package:mega_ecommerce_app/features/favorite_feature/presentation/cubit/toggle_favorite/toggle_favourite_cubit.dart';
import 'package:mega_ecommerce_app/features/product_feature/domain/entities/product_entity.dart';
import 'package:mega_ecommerce_app/features/user_featere/domain/entities/role_enum.dart';

class ProductImageWidget extends StatelessWidget {
  final ProductEntity product;
  final void Function(ProductEntity newProduct)? onToggleFavoriteSuccess;
  final XFile? image;
  const ProductImageWidget({this.image,
    super.key,
    required this.product,
    this.onToggleFavoriteSuccess,
  });
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ToggleFavoriteCubit>(),
      child: Container(
        width: double.infinity,
        height: 250,
        decoration: BoxDecoration(
          color: AppColors.containerBackground,
          borderRadius: BorderRadius.circular(8),
        ),

        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: AppImage(path: image?.path ?? product.image),

              // Image.network(
              //   product.image,
              //   fit: BoxFit.cover,
              //   width: double.infinity,
              //   height: 250,
              // ),
            ),
            AppAutoLoginWidget(
              authenticatedBuilder: (user) {
                final isUser = user.role == RoleEnum.user;

                return Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 16),
                  child: Align(
                    alignment: Alignment.topRight,
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
                        } else if (state is ToggleFavoriteSuccessState) {
                          onToggleFavoriteSuccess ?? (product.toggleFavorite());
                        }
                      },
                      builder: (context, state) {
                        if (!isUser) {
                          return SizedBox();
                        }
                        final isLoading = state is ToggleFavoriteLoadingState;
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
                                    child: AppLoadingWidget(),
                                  )
                                  : SvgPicture.asset(
                                    product.isFavorite()
                                        ? 'assets/icons/fav.svg'
                                        : 'assets/icons/favourite.svg',
                                  ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
