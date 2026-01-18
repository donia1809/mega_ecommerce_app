import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/common_widget/app_failure_widget.dart';
import 'package:mega_ecommerce_app/common_widget/app_loading_widget.dart';
import 'package:mega_ecommerce_app/common_widget/row_widget.dart';
import 'package:mega_ecommerce_app/core/extension/build_context_extensions.dart';
import 'package:mega_ecommerce_app/core/routes/routs.dart';
import 'package:mega_ecommerce_app/features/home_feature/presentation/widget/header_widget.dart';
import 'package:mega_ecommerce_app/features/home_feature/presentation/widget/product_grid_view_widget.dart';
import 'package:mega_ecommerce_app/features/home_feature/presentation/widget/slidable_widget.dart';
import 'package:mega_ecommerce_app/features/product_feature/domain/use_case/get_product_use_case.dart';
import 'package:mega_ecommerce_app/features/product_feature/presentation/cubits/product/product_cubit.dart';
import 'package:mega_ecommerce_app/l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderWidget(),
              SizedBox(height: 8),
              SlidableWidget(),
              SizedBox(height: 8),
              RowWigdet(
                text: AppLocalizations.of(context)!.newArraivalProducts,
                clicableText: AppLocalizations.of(context)!.viewAll,
                onPress:
                    () => context.navigateTo(
                      AppRoutes.allProductsScreen,
                    ),
              ),
              SizedBox(height: 8),
              Expanded(
                child: BlocBuilder<ProductsCubit, IProductsState>(
                  builder: (context, state) {
                    if (state is ProductsLoadingState) {
                      return const Center(child: AppLoadingWidget());
                    }

                    else if (state is ProductsFailureState) {
                      return AppFailureWidget(
                        message: state.failure.message,
                        onPressed: () {
                          context.read<ProductsCubit>().getAllProducts(
                            ProductParams(page: 1),
                          );
                        },
                      );
                    }

                    else if (state is ProductsSuccessState) {
                      return ProductGridViewWidget(
                        products: state.products,
                        onToggleFavoriteSuccess: (newProduct) {
                          context.read<ProductsCubit>().updateProduct(
                            newProduct: newProduct,
                          );
                        },
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
