import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/common_widget/row_widget.dart';
import 'package:mega_ecommerce_app/core/di/dependency_injection.dart';
import 'package:mega_ecommerce_app/core/extension/build_context_extensions.dart';
import 'package:mega_ecommerce_app/core/routes/routs.dart';
import 'package:mega_ecommerce_app/features/product_feature/domain/entities/product_entity.dart';
import 'package:mega_ecommerce_app/features/product_feature/presentation/cubits/product_by_id/product_by_id_cubit.dart';
import 'package:mega_ecommerce_app/features/product_feature/presentation/widget/product_description_widget.dart';
import 'package:mega_ecommerce_app/features/product_feature/presentation/widget/product_details_widget.dart';
import 'package:mega_ecommerce_app/features/product_feature/presentation/widget/product_image_widget.dart';
import 'package:mega_ecommerce_app/features/product_feature/presentation/widget/product_list_images_widget.dart';
import 'package:mega_ecommerce_app/l10n/app_localizations.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String productId;
  const ProductDetailsScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProductByIdCubit>()..getProductsById(productId),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.producDetails),
        ),
        body: Padding(
          padding: EdgeInsets.only(right: 16, left: 16),
          child: BlocBuilder<ProductByIdCubit, IProductByIdState>(
            builder: (context, state) {
              if (state is ProductByIdLoadingState) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is ProductByIdFailureState) {
                return Center(child: Text(state.failure.message));
              }

              if (state is ProductByIdSuccessState) {
                final product = state.getProductById;
                return _ProductDetailsScreenBody(product: product);
              }
              return SizedBox();
            },
          ),
        ),
      ),
    );
  }
}

class _ProductDetailsScreenBody extends StatelessWidget {
  final ProductsEntity product;

  const _ProductDetailsScreenBody({required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProductImageWidget(product: product),
        SizedBox(height: context.screenHeight * 0.01),
        ProductDetailsWidget(product: product),
        SizedBox(height: 16),
        ProductListImages(product: product),
        SizedBox(height: 16),
        ProductDescriptionWidget(product: product),
        SizedBox(height: 16),
        RowWigdet(
          text: AppLocalizations.of(context)!.reviews,
          clicableText: AppLocalizations.of(context)!.viewAll,
          onPress:
              () => context.navigateTo(
                AppRoutes.addReviewscreen,
                arguments: product.id,
              ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: product.reviews.length,
            itemBuilder: (context, index) {
              final review = product.reviews[index];
              return SizedBox(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(review.name),
                        Text(review.rating.toString()),
                      ],
                    ),
                    Text(
                      review.comment,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        // ProductReviewWidget(),
      ],
    );
  }
}

// class ProductReviewWidget extends StatelessWidget
// { final 
//   const ProductReviewWidget({super.key});

  
//   @override
//   Widget build(BuildContext context) {
//     return Column();
//   }

// }
