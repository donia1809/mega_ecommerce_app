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
                      // arguments: product,
                    ),
              ),
              SizedBox(height: 8),
              Expanded(
                child: BlocBuilder<ProductsCubit, IProductsState>(
                  builder: (context, state) {
                    if (state is ProductsLoadingState) {
                      return const Center(child: AppLoadingWidget());
                    }

                    if (state is ProductsFailureState) {
                      return AppFailureWidget(
                        message: state.failure.message,
                        onPressed: () {
                          context.read<ProductsCubit>().getAllProducts(
                            ProductParams(
                              page: 1,
                              keyword: null,
                              category: null,
                              minPrice: null,
                              maxPrice: null,
                              rating: null,
                            ),
                          );
                        },
                      );
                    }

                    if (state is ProductsSuccessState) {
                      return ProductGridViewWidget(products: state.products);
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

// class ShowProductWidget extends StatelessWidget {
//   const ShowProductWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           AppLocalizations.of(context)!.newArraivalProducts,
//           textAlign: TextAlign.start,
//           style: AppTextStyles.bold15,
//         ),
//         TextButton(
//           onPressed: () {
//             context.navigateTo(
//               '/allProductsScreen',
//               // arguments: product,
//             );
//           },
//           child: Text(
//             AppLocalizations.of(context)!.viewAll,
//             textAlign: TextAlign.start,
//             style: AppTextStyles.regular13,
//           ),
//         ),
//       ],
//     );
//   }
// }
