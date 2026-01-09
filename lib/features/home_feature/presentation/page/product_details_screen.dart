import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mega_ecommerce_app/core/di/dependency_injection.dart';
import 'package:mega_ecommerce_app/core/extension/build_context_extensions.dart';
import 'package:mega_ecommerce_app/core/routes/routs.dart';
import 'package:mega_ecommerce_app/core/theme/colors.dart';
import 'package:mega_ecommerce_app/core/theme/text_style.dart';
import 'package:mega_ecommerce_app/features/cart_feature/domain/entity/product_entity.dart';
import 'package:mega_ecommerce_app/features/cart_feature/presentation/cubits/product_by_id_cubit.dart';
import 'package:mega_ecommerce_app/features/home_feature/presentation/page/home_screen.dart';
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
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
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
                            child: Image.network(
                              product.image,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              height: 250,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, right: 16),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: InkWell(
                                onTap: () {},
                                child: SvgPicture.asset(
                                  'assets/icons/favourite.svg',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: context.screenHeight * 0.01),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(product.name, style: AppTextStyles.bold15),
                        Column(
                          children: [
                            Text(AppLocalizations.of(context)!.price),
                            Text(
                              '\$${product.price}',
                              style: AppTextStyles.bold15,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    ProductImages(product: product),
                    SizedBox(height: 16),
                    Text(
                      AppLocalizations.of(context)!.description,
                      style: AppTextStyles.bold15,
                    ),
                    SizedBox(height: 8),
                    Text(
                      product.description,
                      style: AppTextStyles.regular15,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                    SizedBox(height: 16),
                    RowWigdet(
                      text: AppLocalizations.of(context)!.reviews,
                      clicableText: AppLocalizations.of(context)!.viewAll,
                      onPress:
                          () => context.navigateTo(
                            AppRoutes.allProductsScreen,
                            // arguments: product,
                          ),
                    ),
                  ],
                );
              }

              return SizedBox();
            },
          ),
        ),
      ),
    );
  }
}

class ProductImages extends StatelessWidget {
  final ProductsEntity product;

  const ProductImages({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    if (product.images.isEmpty) {
      return const SizedBox.shrink();
    }
    return SizedBox(
      height: 85,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: product.images.length,
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              product.images[index],
              width: 75,
              height: 75,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => const Icon(Icons.error),
            ),
          );
        },
      ),
    );
  }
}
