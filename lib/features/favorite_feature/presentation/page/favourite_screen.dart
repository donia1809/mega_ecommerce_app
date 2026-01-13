import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/common_widget/app_loading_widget.dart';
import 'package:mega_ecommerce_app/core/theme/colors.dart';
import 'package:mega_ecommerce_app/core/theme/text_style.dart';
import 'package:mega_ecommerce_app/core/utiles/snack_bar_message.dart';
import 'package:mega_ecommerce_app/features/favorite_feature/presentation/cubit/get_favorite/get_favorite_cubit.dart';
import 'package:mega_ecommerce_app/features/home_feature/presentation/widget/product_grid_view_widget.dart';
import 'package:mega_ecommerce_app/l10n/app_localizations.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<GetFavoriteCubit, IGetFavoriteState>(
        listener: (context, state) {
          if (state is GetFavoriteFailureState) {
            showSnackBar(
              context: context,
              message: state.failure.message,
              color: AppColors.red,
            );
          }
        },
        builder: (context, state) {
          if (state is GetFavoriteLoadingState) {
            return Center(child: AppLoadingWidget());
          } else if (state is GetFavoriteSeccessState) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    AppLocalizations.of(context)!.favourite,
                    style: AppTextStyles.bold15,
                  ),
                  SizedBox(height: 24),
                  Expanded(
                    child: ProductGridViewWidget(
                      products: state.products,
                      onToggleFavoriteSuccess: (newProduct) {
                        context.read<GetFavoriteCubit>().removeFavorite(
                          newProduct: newProduct,
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
