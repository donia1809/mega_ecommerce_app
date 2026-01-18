import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/common_widget/product_details.dart';
import 'package:mega_ecommerce_app/core/di/dependency_injection.dart';
import 'package:mega_ecommerce_app/core/extension/build_context_extensions.dart';
import 'package:mega_ecommerce_app/core/routes/routs.dart';
import 'package:mega_ecommerce_app/features/product_feature/domain/use_case/get_product_use_case.dart';
import 'package:mega_ecommerce_app/features/product_feature/presentation/cubits/product/product_cubit.dart';
import 'package:mega_ecommerce_app/l10n/app_localizations.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => sl<ProductsCubit>()..getAllProducts(ProductParams()),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.allProduct)),
        body: BlocBuilder<ProductsCubit, IProductsState>(
          builder: (context, state) {
            if (state is ProductsLoadingState ||
                state is ProductsRefreshingState) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is ProductsFailureState) {
              return Center(child: Text(state.failure.message));
            }

            if (state is ProductsSuccessState) {
              final products = state.products;
              return GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      ResponsiveValue<int>(
                        context,
                        conditionalValues: [
                          Condition.equals(
                            name: TABLET,
                            value: 3,
                            landscapeValue: 3,
                          ),
                          Condition.largerThan(
                            name: TABLET,
                            value: 4,
                            landscapeValue: 4,
                          ),
                        ],
                        defaultValue: 2,
                      ).value,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.58,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return ProductDetails(
                    product: product,
                    onToggleFavoriteSuccess: (newProduct) {
                      context.read<ProductsCubit>().updateProduct(
                        newProduct: newProduct,
                      );
                    },
                    onTap: () {
                      context.navigateTo(
                        AppRoutes.productDetailsScreen,
                        arguments: product.id,
                      );
                    },
                  );
                },
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
