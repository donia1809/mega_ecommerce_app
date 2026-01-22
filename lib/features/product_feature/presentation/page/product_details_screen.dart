import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/common_widget/app_failure_widget.dart';
import 'package:mega_ecommerce_app/common_widget/elevated_button.dart';
import 'package:mega_ecommerce_app/common_widget/row_widget.dart';
import 'package:mega_ecommerce_app/core/di/dependency_injection.dart';
import 'package:mega_ecommerce_app/core/extension/build_context_extensions.dart';
import 'package:mega_ecommerce_app/core/routes/routs.dart';
import 'package:mega_ecommerce_app/core/theme/colors.dart';
import 'package:mega_ecommerce_app/core/utiles/snack_bar_message.dart';
import 'package:mega_ecommerce_app/features/auth_feature/presentation/pages/auto_login/auto_login_widget.dart';
import 'package:mega_ecommerce_app/features/cart_feature/domain/use_case/add_product_to_cart_use_case.dart';
import 'package:mega_ecommerce_app/features/cart_feature/presentation/cubits/add_to_cart/add_to_cart_cubit.dart';
import 'package:mega_ecommerce_app/features/product_feature/domain/entities/product_entity.dart';
import 'package:mega_ecommerce_app/features/product_feature/presentation/cubits/product_by_id/product_by_id_cubit.dart';
import 'package:mega_ecommerce_app/features/product_feature/presentation/widget/product_description_widget.dart';
import 'package:mega_ecommerce_app/features/product_feature/presentation/widget/product_details_widget.dart';
import 'package:mega_ecommerce_app/features/product_feature/presentation/widget/product_image_widget.dart';
import 'package:mega_ecommerce_app/features/product_feature/presentation/widget/product_list_images_widget.dart';
import 'package:mega_ecommerce_app/features/product_feature/presentation/widget/product_review_widget.dart';
import 'package:mega_ecommerce_app/features/user_featere/domain/entities/role_enum.dart';
import 'package:mega_ecommerce_app/l10n/app_localizations.dart';

class ProductDetailsScreen extends StatelessWidget {
  final String productId;
  const ProductDetailsScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => sl<ProductByIdCubit>()..getProductsById(productId),
        ),
        BlocProvider(create: (context) => sl<AddToCartCubit>()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.producDetails),
        ),
        body: Padding(
          padding: EdgeInsets.only(right: 16, left: 16,bottom: 16),
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
  final ProductEntity product;

  const _ProductDetailsScreenBody({required this.product});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AppAutoLoginWidget(
        authenticatedBuilder: (user) {
          final isUser = user.role == RoleEnum.user;
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
                clicableText: AppLocalizations.of(context)!.addReviow,
                onPress:
                    () => context.navigateTo(
                      AppRoutes.addReviewscreen,
                      arguments: product.id,
                    ),
              ),
              ProductReviewWidget(product: product),
              SizedBox(height: 16),
              BlocConsumer<AddToCartCubit, IAddToCartState>(
                listener: (context, state) {
                  if (state is AddToCartSuccessState) {
                    showSnackBar(
                      context: context,
                      message:
                          AppLocalizations.of(context)!.addedToCartSuccessfully,
                      color: AppColors.green,
                    );
                  }
                },
                builder: (context, state) {
                  if (state is AddToCartFailureState) {
                    return AppFailureWidget(
                      message: state.failure.message,
                      onPressed: () {
                        context.read<ProductByIdCubit>().getProductsById(
                          product.id,
                        );
                      },
                    );
                  }
                  return isUser
                      ? CommonElevatedButton(
                        isLoading: state is AddToCartLoadingState,
                        onPressed: () {
                          {
                            context.read<AddToCartCubit>().addToCart(
                              AddProductToCartParams(
                                productId: product.id,
                                quantity: 1,
                              ),
                            );
                          }
                        },
                        text: AppLocalizations.of(context)!.addToCart,
                      )
                      : Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: CommonElevatedButton(
                              onPressed: () {},
                              text: AppLocalizations.of(context)!.editProduct,
                            ),
                          ),
                          SizedBox(width: 8,),
                          Expanded(
                            child: CommonElevatedButton(
                              color: AppColors.red,
                              onPressed: () {},
                              text: AppLocalizations.of(context)!.removeProduct,
                            ),
                          ),
                        ],
                      );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
