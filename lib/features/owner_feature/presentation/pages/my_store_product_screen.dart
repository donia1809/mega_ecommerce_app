import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/common_widget/app_failure_widget.dart';
import 'package:mega_ecommerce_app/common_widget/app_loading_widget.dart';
import 'package:mega_ecommerce_app/common_widget/common_container_widget.dart';
import 'package:mega_ecommerce_app/core/di/dependency_injection.dart';
import 'package:mega_ecommerce_app/core/extension/build_context_extensions.dart';
import 'package:mega_ecommerce_app/core/routes/routs.dart';
import 'package:mega_ecommerce_app/features/owner_feature/presentation/cubits/owner_product/owner_product_cubit.dart';
import 'package:mega_ecommerce_app/l10n/app_localizations.dart';

class MyStoreProductScreen extends StatelessWidget {
  const MyStoreProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<OwnerProductCubit>()..getOwnerProduct(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.storePtoducts),
        ),
        body: BlocBuilder<OwnerProductCubit, IOwnerProductState>(
          builder: (context, state) {
            if (state is OwnerProductLoadingState) {
              return AppLoadingWidget();
            } else if (state is OwnerProductFailureState) {
              return AppFailureWidget(
                message: state.failure.message,
                onPressed: () {
                  context.read<OwnerProductCubit>().getOwnerProduct();
                },
              );
            } else if (state is OwnerProductSeccessState) {
              return ListView.separated(
                itemCount: state.ownerProduct.length,
                itemBuilder: (context, index) {
                  final product = state.ownerProduct[index];
                  return InkWell(
                    onTap: () {
                      context.navigateTo(
                        AppRoutes.productDetailsScreen,
                        arguments: product.id,
                      );
                    },
                    child: CommonContainerWidget(
                      child: Row(
                        children: [
                          Image.network(
                            product.image,
                            fit: BoxFit.contain,
                            height: 65,
                            width: 65,
                          ),
                          SizedBox(width: 8),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 8),

                                Text(
                                  product.price.toString(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 8),
              );
            }
            return Center(child: Text('there is no products'));
          },
        ),
      ),
    );
  }
}
