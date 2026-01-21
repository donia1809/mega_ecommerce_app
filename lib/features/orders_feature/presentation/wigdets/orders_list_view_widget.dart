
import 'package:flutter/material.dart';
import 'package:mega_ecommerce_app/common_widget/common_container_widget.dart';
import 'package:mega_ecommerce_app/core/extension/build_context_extensions.dart';
import 'package:mega_ecommerce_app/core/routes/routs.dart';
import 'package:mega_ecommerce_app/features/orders_feature/domain/entities/order_entity.dart';

class OrdersListViewWidget extends StatelessWidget {
  final List<OrderEntity> orders;

  const OrdersListViewWidget({super.key, required this.orders});
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(height: 16),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        return InkWell(
          onTap: () {
            context.navigateTo(
              AppRoutes.orderDetailsScreen,
              arguments: order.id,
            );
          },
          child: CommonContainerWidget(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Orders Total Price: '),
                SizedBox(height: 8),
                Text(order.totalPrice.toString()),
              ],
            ),
          ),
        );
      },
    );
  }
}
