import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/common_widget/app_failure_widget.dart';
import 'package:mega_ecommerce_app/common_widget/app_loading_widget.dart';
import 'package:mega_ecommerce_app/common_widget/common_container_widget.dart';
import 'package:mega_ecommerce_app/core/di/dependency_injection.dart';
import 'package:mega_ecommerce_app/core/theme/text_style.dart';
import 'package:mega_ecommerce_app/core/utiles/app_assets.dart';
import 'package:mega_ecommerce_app/features/orders_feature/domain/use_cases/get_order_details_use_case.dart';
import 'package:mega_ecommerce_app/features/orders_feature/presentation/cubits/get_order_details/get_order_details_cubit.dart';
import 'package:mega_ecommerce_app/l10n/app_localizations.dart';

class OrderDetailsScreen extends StatelessWidget {
  final String orderId;
  const OrderDetailsScreen({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              sl<GetOrderDetailsCubit>()
                ..getOrderDetails(OrdersDetailsParams(id: orderId)),
      child: Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.orderDetails)),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<GetOrderDetailsCubit, IGetOrderDetailsState>(
            builder: (context, state) {
              if (state is GetOrderDetailsFailureState) {
                return AppFailureWidget(
                  message: state.failure.message,
                  onPressed: () {
                    context.read<GetOrderDetailsCubit>().getOrderDetails(
                      OrdersDetailsParams(id: orderId),
                    );
                  },
                );
              } else if (state is GetOrderDetailsLoadingState) {
                return AppLoadingWidget();
              } else if (state is GetOrderDetailsSuccessState) {
                final order = state.order;
                final orderItem = order.orderItems;
                return ListView(
                  children: [
                    CommonContainerWidget(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(AppLocalizations.of(context)!.orderNum),
                          Expanded(
                            child: Text(
                              order.itemsPrice.toString(),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 16),

                    CommonContainerWidget(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(AppLocalizations.of(context)!.totalPrice),
                          Flexible(child: Text(order.totalPrice.toString())),
                        ],
                      ),
                    ),

                    SizedBox(height: 16),

                    CommonContainerWidget(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(AppLocalizations.of(context)!.status),
                          Flexible(child: Text(order.status.value)),
                        ],
                      ),
                    ),

                    SizedBox(height: 16),

                    Text(AppLocalizations.of(context)!.storeOwner),

                    SizedBox(height: 8),

                    Row(
                      children: [
                        CircleAvatar(
                          radius: 24,
                          backgroundImage: AssetImage(AppImages.nativeSplash),
                        ),
                        SizedBox(width: 8),
                        Flexible(child: Text(order.user.name)),
                      ],
                    ),

                    SizedBox(height: 16),

                    Text(AppLocalizations.of(context)!.product),

                    SizedBox(height: 8),

                    ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => SizedBox(height: 8),
                      itemCount: orderItem.length,
                      itemBuilder: (context, index) {
                        final orderItems = orderItem[index];
                        return CommonContainerWidget(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 100,
                                height: 150,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(orderItems.image),
                                ),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        orderItems.name,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: AppTextStyles.medium15,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Flexible(
                                      child: Text(
                                        orderItems.price.toString(),
                                        style: AppTextStyles.regular13,
                                      ),
                                    ),
                                    SizedBox(height: 16),
                                  ],
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  '${AppLocalizations.of(context)!.count}:\n ${orderItems.quantity}',
                                ),
                              ),
                            ],
                          ),
                        );
                      },
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
