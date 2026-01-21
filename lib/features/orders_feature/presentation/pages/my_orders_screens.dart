import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mega_ecommerce_app/common_widget/app_failure_widget.dart';
import 'package:mega_ecommerce_app/common_widget/app_loading_widget.dart';
import 'package:mega_ecommerce_app/core/di/dependency_injection.dart';
import 'package:mega_ecommerce_app/features/orders_feature/domain/use_cases/get_my_orders_use_case.dart';
import 'package:mega_ecommerce_app/features/orders_feature/presentation/cubits/get_my_orders/get_my_orders_cubit.dart';
import 'package:mega_ecommerce_app/features/orders_feature/presentation/wigdets/orders_list_view_widget.dart';
import 'package:mega_ecommerce_app/l10n/app_localizations.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              sl<GetMyOrdersCubit>()..getMyOrders(OrdersParams(page: 1)),
      child: Scaffold(
        appBar: AppBar(title: 
        Text(AppLocalizations.of(context)!.myOrders)),
        body: _MyOrdersScreenBody(),
      ),
    );
  }
}

class _MyOrdersScreenBody extends StatelessWidget {
  const _MyOrdersScreenBody();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocBuilder<GetMyOrdersCubit, IGetMyOrdersState>(
        builder: (context, state) {
          if (state is GetMyOrdersLoadingState) {
            return AppLoadingWidget();
          } else if (state is GetMyOrdersFailureState) {
            return AppFailureWidget(
              message: state.failure.message,
              onPressed: () {
                context.read<GetMyOrdersCubit>().getMyOrders(
                  OrdersParams(page: 1, limit: 10),
                );
              },
            );
          } else if (state is GetMyOrdersSuccessState) {
            final orders = state.orders.orders;
            return Column(
              children: [
                Expanded(child: OrdersListViewWidget(orders: orders)),

                SizedBox(height: 16),
              ],
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
